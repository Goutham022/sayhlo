import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // 1. Top Right Language Selector
            Positioned(
              top: 16,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6), // Light grey background like reference
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'English',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: kTextColor.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: kTextColor.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
            
            // 2. Center Content (Logo & Tagline)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon
                      SvgPicture.asset(
                        'assets/icons/headone.svg',
                        height: 50, // Approximate size from image
                        width: 50,
                      ),
                      const SizedBox(width: 12),
                      
                      // Text "Sayhlo"
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 42, // Large title size
                            fontWeight: FontWeight.w600,
                            height: 1.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'Say',
                              style: TextStyle(color: kTextColor), // Black/Dark
                            ),
                            TextSpan(
                              text: 'hlo',
                              style: TextStyle(color: kPrimaryBlue), // Blue
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Tagline
                  const Text(
                    'Right People. Right Advice',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: kPrimaryBlue, // Matches "hlo" blue
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2, // Slightly spaced out
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
