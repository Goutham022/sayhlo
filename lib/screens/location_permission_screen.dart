import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'home_screen.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 2. Top Navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 3. Center Icon (Split Color)
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              kPrimaryBlue,   // Left half
                              Color(0xFF003060), // Slightly darker/different shade for right half aesthetic
                            ],
                            stops: [0.5, 0.5], // Sharp split in the middle
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.location_on,
                          size: 120,
                          color: Colors.white, // Color required for ShaderMask to apply
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // 4. Title Text
                    const Text(
                      'What is your Location?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w600, // Medium/Semi-Bold
                        color: kTextColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 5. Subtitle Text
                    const Text(
                      'We need to know your location to suggested near services.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14, // Smaller than title
                        fontWeight: FontWeight.w400,
                        color: kTextGrey, // Muted constant
                        height: 1.5, // Soft line spacing
                      ),
                    ),
                    const SizedBox(height: 60),

                    // 6. Primary Action Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Allow',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 7. Secondary Action (Skip)
                    TextButton(
                      onPressed: () {
                        // Skip logic
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: kPrimaryBlue,
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: kPrimaryBlue,
                          fontSize: 16, // Medium size
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40), // Bottom spacing
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
