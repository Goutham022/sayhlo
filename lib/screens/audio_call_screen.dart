import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/colors.dart';
import 'video_call_screen.dart';
import 'expert_home.dart';

/// Audio call screen with dark gradient background and controls.
/// Displays profile, mic/speaker toggles, and End Call button.
class AudioCallScreen extends StatefulWidget {
  final String userName;
  final String expertName;
  final int initialSeconds;

  const AudioCallScreen({
    super.key,
    this.userName = 'Rajesh Kumar',
    this.expertName = 'Sujoy Sharma',
    this.initialSeconds = 120, // 2:00
  });

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  bool _isMicOn = true;
  bool _isSpeakerOn = true;
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
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kAudioCallGradientStart, kAudioCallGradientEnd],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, color: whiteColor, size: 20),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Title and user name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Chat Session',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: whiteColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.userName,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Time remaining
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Time Remaining',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined, color: whiteColor, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              _formattedTime,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Center content - Profile image and name
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile placeholder (rounded square)
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4A574), // Tan/brown placeholder
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.person, color: whiteColor, size: 80),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.expertName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),

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
                        // Video button (inactive, navigates to video call)
                        _buildControlButton(
                          icon: Icons.videocam_off,
                          isActive: false,
                          onTap: () {
                            _timer?.cancel();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => VideoCallScreen(
                                  userName: widget.userName,
                                  expertName: widget.expertName,
                                  initialSeconds: _remainingSeconds,
                                ),
                              ),
                            );
                          },
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
