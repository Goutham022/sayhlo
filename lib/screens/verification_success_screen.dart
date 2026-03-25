import 'dart:async';
import 'package:flutter/material.dart';
import 'personalization_intro_screen.dart';
import '../theme/colors.dart';
import 'welcome_expert.dart';

class VerificationSuccessScreen extends StatefulWidget {
  final bool isExpert;
  const VerificationSuccessScreen({super.key, this.isExpert = false});

  @override
  State<VerificationSuccessScreen> createState() => _VerificationSuccessScreenState();
}

class _VerificationSuccessScreenState extends State<VerificationSuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate after 5 seconds
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => widget.isExpert 
                ? const Welcome_Expert() 
                : const PersonalizationIntroScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 2. Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryBlue, // 18.94%
                  kDeepNavyBlue, // 100%
                ],
                stops: [0.1894, 1.0],
              ),
            ),
          ),
          
          // 3. Subtle Top Pattern Overlay
          // Using a CustomPainter to simulate a subtle dot grid texture
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300, // Top portion only
            child: CustomPaint(
              painter: DotGridPainter(),
            ),
          ),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 4. Success Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // 5. Text Content
                // Main Heading
                const Text(
                  'Verification\nSuccessful',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter', // Assuming Inter or system default, need to match "Modern"
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600, // Semi-Bold
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),

                // Subtitle
                Text(
                  'Your verification has been completed\nsuccessfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for the Subtle Dot Grid
class DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05) // Very subtle
      ..style = PaintingStyle.fill;

    const double spacing = 20.0;
    const double radius = 2.0;

    for (double y = 0; y < size.height; y += spacing) {
      // Fade out as we go down
      paint.color = Colors.white.withOpacity(0.05 * (1 - y / size.height));
      
      for (double x = 0; x < size.width; x += spacing) {
         // Create a grid pattern
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
