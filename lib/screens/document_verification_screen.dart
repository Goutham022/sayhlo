import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/colors.dart';
import 'profile_review_pending.dart';

enum _UploadState { idle, uploading, selected }

class DocumentVerificationScreen extends StatefulWidget {
  const DocumentVerificationScreen({super.key});

  @override
  State<DocumentVerificationScreen> createState() => _DocumentVerificationScreenState();
}

class _DocumentVerificationScreenState extends State<DocumentVerificationScreen> {
  _UploadState _state = _UploadState.idle;
  PlatformFile? _selectedFile;
  double _progressPercent = 0.4; // show 40% initially for upload state
  Timer? _progressTimer;

  static const int _maxBytes = 15 * 1024 * 1024;

  @override
  void dispose() {
    _progressTimer?.cancel();
    super.dispose();
  }

  void _startSimulatedUploadAndTransition(PlatformFile file) {
    setState(() {
      _selectedFile = file;
      _state = _UploadState.uploading;
      _progressPercent = 0.4;
    });

    // Simulate progress then move to selected state. Keep it short and smooth.
    _progressTimer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _progressPercent += 0.15;
        if (_progressPercent >= 1.0) {
          _progressPercent = 1.0;
          _state = _UploadState.selected;
          timer.cancel();
        }
      });
    });
  }

  Future<void> _pickFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: false,
      );

      if (result == null) return; // user cancelled

      final PlatformFile file = result.files.single;
      if (file.size > _maxBytes) return; // silently ignore oversize

      // Immediately show progress state then finish to selected state
      _startSimulatedUploadAndTransition(file);
    } catch (_) {
      // fail silently per requirements
      return;
    }
  }

  void _cancelUpload() {
    _progressTimer?.cancel();
    setState(() {
      _selectedFile = null;
      _state = _UploadState.idle;
      _progressPercent = 0.4;
    });
  }

  void _removeSelectedFile() {
    setState(() {
      _selectedFile = null;
      _state = _UploadState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: AppBar(
        backgroundColor: backgroundWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Select one document for\nverification.',
          style: TextStyle(
            fontFamily: 'Inter',
            color: textPrimaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            height: 1.2,
          ),
        ),
        titleSpacing: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDocumentOption(Icons.badge_outlined, 'Aadhaar card/ PAN'),
            _buildDocumentOption(Icons.card_membership_outlined, 'Certification (optional)'),
            _buildDocumentOption(Icons.image_outlined, 'Portfolio image (optional)'),

            const SizedBox(height: 40),

            // Main area varies by state
            Stack(
              children: [
                // Centered container (empty / selected / uploading)
                Center(child: _buildMainContainer()),

                // Close icon (top-right) visible during uploading and selected
                if (_state == _UploadState.uploading || _state == _UploadState.selected)
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        if (_state == _UploadState.uploading) {
                          _cancelUpload();
                        } else if (_state == _UploadState.selected) {
                          _removeSelectedFile();
                        }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: borderGreyColor, width: 2),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.close, size: 18),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 24),

            // Selected file row and Done button
            if (_state == _UploadState.selected && _selectedFile != null) ...[
              ListTile(
                leading: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: backgroundWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderGreyColor),
                  ),
                  child: const Icon(Icons.insert_drive_file, color: primaryBlueColor),
                ),
                title: Text(
                  _selectedFile!.name,
                  style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
                ),
                subtitle: Text('${(_selectedFile!.size / (1024 * 1024)).toStringAsFixed(2)}MB'),
                trailing: IconButton(
                  onPressed: _removeSelectedFile,
                  icon: const Icon(Icons.close),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProfileReviewPending()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlueColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: const Text('Done', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMainContainer() {
    // Dashed container shared visuals
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundWhiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderGreyColor, width: 1.5),
      ),
      child: CustomPaint(
        painter: DashedRectPainter(color: borderGreyColor, strokeWidth: 1.5, gap: 5.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: _buildStateContent(),
        ),
      ),
    );
  }

  Widget _buildStateContent() {
    switch (_state) {
      case _UploadState.uploading:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.insert_drive_file, size: 48, color: iconGreyColor),
            const SizedBox(height: 20),
            Text('${(_progressPercent * 100).round()}%', style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 18)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: _progressPercent.clamp(0.0, 1.0),
                minHeight: 6,
                backgroundColor: borderGreyColor.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(primaryBlueColor),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Upload document...', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(_selectedFile?.name ?? 'Dr. Roy prescription', style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor)),
          ],
        );

      case _UploadState.selected:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_upload_outlined, size: 48, color: primaryBlueColor),
            const SizedBox(height: 20),
            const Text('Tap to upload document', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('PNG,JPG,PDF', style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor)),
            const SizedBox(height: 12),
            const Text('OR', style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor)),
            const SizedBox(height: 12),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: _pickFile,
                style: ElevatedButton.styleFrom(backgroundColor: primaryBlueColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text('Open Gallery', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        );

      case _UploadState.idle:
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.badge_outlined, size: 48, color: iconGreyColor),
            const SizedBox(height: 20),
            const Text(
              'Please Upload document for\nverification in JPG, PNG, PDF or\nlarger than 15mb.',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _pickFile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlueColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                  Text('Upload', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(width: 8),
                  Icon(Icons.file_upload_outlined, color: whiteColor, size: 20),
                ]),
              ),
            ),
          ],
        );
    }
  }

  Widget _buildDocumentOption(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: iconGreyColor, size: 24),
          const SizedBox(width: 16),
          Text(text, style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 16, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

// Custom Painter for Dashed Border
class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter({
    this.strokeWidth = 1.0,
    this.color = Colors.black,
    this.gap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double x = size.width;
    final double y = size.height;

    final Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, x, y), 
      const Radius.circular(12), // Matching internal radius roughly
    ));

    Path dashPath = Path();

    double dashWidth = 10.0;
    double dashSpace = gap;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }

    canvas.drawPath(dashPath, dashedPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
