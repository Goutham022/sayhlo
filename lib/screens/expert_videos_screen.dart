import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../theme/colors.dart';
import 'home_screen.dart';

class ExpertVideosScreen extends StatefulWidget {
  const ExpertVideosScreen({super.key});

  @override
  State<ExpertVideosScreen> createState() => _ExpertVideosScreenState();
}

class _ExpertVideosScreenState extends State<ExpertVideosScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/spiderman.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Player Section
          Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: const Color(0xFF4A4A4A), // Dark grey background
                child: _isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const Center(child: CircularProgressIndicator(color: whiteColor)),
              ),
              // Back Button Overlay
              Positioned(
                top: 40,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.arrow_back, color: whiteColor, size: 20),
                  ),
                ),
              ),
              // Play/Pause Overlay
              Positioned.fill(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying ? _controller.pause() : _controller.play();
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: whiteColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
              // Progress Bar Overlay
              Positioned(
                bottom: 10,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '2m 24 sec / 5m',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: whiteColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.48, // Matches ~2m 24s of 5m
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF2D55), // Pinkish color from image
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Positioned(
                          left: (MediaQuery.of(context).size.width - 32) * 0.48 - 4,
                          top: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF2D55),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Video Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bike engine noise explained',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: textPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Videos by Rahul',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: textPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                _buildVideoListItem(context, true),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(height: 1, color: Color(0xFFEEEEEE)),
                ),
                _buildVideoListItem(context, false),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(height: 1, color: Color(0xFFEEEEEE)),
                ),
                _buildVideoListItem(context, false),
              ],
            ),
          ),
          const Spacer(),
          // Back home button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: primaryBlueColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Back home',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildVideoListItem(BuildContext context, bool isSelected) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: textPrimaryColor),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: Icon(Icons.play_arrow_outlined, color: textPrimaryColor, size: 24),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bike engine noise explained',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: isSelected ? primaryBlueColor : textPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '29 July  •  5M',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: textSecondaryColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        if (!isSelected)
          const Icon(Icons.play_circle_filled, color: primaryBlueColor, size: 36),
      ],
    );
  }
}
