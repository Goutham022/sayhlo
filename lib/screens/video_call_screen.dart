import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/colors.dart';
import 'expert_home.dart';

/// Video call screen with full-screen video background and controls.
/// Shows self-view preview, mic/speaker/camera toggles, and End Call button.
class VideoCallScreen extends StatefulWidget {
  final String userName;
  final String expertName;
  final int initialSeconds;

  const VideoCallScreen({
    super.key,
    this.userName = 'Rajesh Kumar',
    this.expertName = 'Sujoy Sharma',
    this.initialSeconds = 120, // 2:00
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool _isMicOn = true;
  bool _isSpeakerOn = true;
  bool _isCameraOn = true;
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _endCall();
      }
    });
  }

  void _endCall() {
    _timer?.cancel();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const ExpertHome()),
      (route) => false,
    );
  }

  String get _formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen video placeholder background
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFCBB19A), Color(0xFFB8A082)], // Tan/brown placeholder
              ),
            ),
            child: const Center(
              child: Icon(Icons.person, color: Colors.white54, size: 200),
            ),
          ),

          // Safe area content
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_back, color: whiteColor, size: 20),
                        ),
                      ),
                      
                      const Spacer(),
                      
                      // Name and duration + self-view
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.expertName,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: whiteColor,
                              shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _formattedTime,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: whiteColor,
                              shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Self-view preview
                          Container(
                            width: 100,
                            height: 130,
                            decoration: BoxDecoration(
                              color: const Color(0xFF9B7BBB), // Purple placeholder
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: whiteColor, width: 2),
                            ),
                            child: const Center(
                              child: Icon(Icons.person, color: Colors.white70, size: 60),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom controls
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: Column(
                    children: [
                      // Control buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Mic toggle
                          _buildControlButton(
                            icon: _isMicOn ? Icons.mic : Icons.mic_off,
                            isActive: _isMicOn,
                            onTap: () => setState(() => _isMicOn = !_isMicOn),
                          ),
                          const SizedBox(width: 24),
                          // Speaker toggle
                          _buildControlButton(
                            icon: _isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                            isActive: _isSpeakerOn,
                            onTap: () => setState(() => _isSpeakerOn = !_isSpeakerOn),
                          ),
                          const SizedBox(width: 24),
                          // Camera toggle
                          _buildControlButton(
                            icon: _isCameraOn ? Icons.videocam : Icons.videocam_off,
                            isActive: _isCameraOn,
                            onTap: () => setState(() => _isCameraOn = !_isCameraOn),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // End Call button
                      GestureDetector(
                        onTap: _endCall,
                        child: Container(
                          width: 180,
                          height: 56,
                          decoration: BoxDecoration(
                            color: kEndCallPink,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: const Center(
                            child: Icon(Icons.call_end, color: whiteColor, size: 28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: kControlButtonBg,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? whiteColor : whiteColor.withValues(alpha: 0.5),
          size: 24,
        ),
      ),
    );
  }
}
