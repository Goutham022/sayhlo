import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'category_selection_screen.dart';
import '../theme/colors.dart';

class PersonalizationIntroScreen extends StatelessWidget {
  const PersonalizationIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fallback
      body: Stack(
        children: [
          // 2. Top Image Section (Full Screen Hero)
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/photo.svg',
               fit: BoxFit.cover,
              // Ensure it scales responsively
            ),
          ),

          // 3. Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    kPrimaryBlue.withOpacity(0.5), // Soft blue tint mid-way
                    kDeepNavyBlue, // Deep blue at bottom
                  ],
                  stops: const [0.4, 0.7, 1.0], // Adjust stops for cinematic feel
                ),
              ),
            ),
          ),

          // 5. Navigation Elements - Back Arrow
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.black), // Requested Dark color
              tooltip: 'Back',
            ),
          ),

          // Content Area (Bottom)
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 4. Text Content
                const Text(
                  'Let’s personalize\nyour experience',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600, // Medium to Semi-Bold
                    height: 1.2,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // 5. Navigation Elements - Bottom Right Arrow
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const CategorySelectionScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
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
