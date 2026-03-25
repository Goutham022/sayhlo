import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'location_permission_screen.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  // Matching exact text from requirements
  // 'Appliances' is selected by default in the image reference
  String _selectedCategory = 'Appliances'; 

  final List<Map<String, dynamic>> _categories = [
    {'name': 'TV', 'icon': Icons.tv},
    {'name': 'Mobile', 'icon': Icons.smartphone}, // or phone_android
    {'name': 'Bike', 'icon': Icons.directions_bike}, // or motorcycle
    {'name': 'Appliances', 'icon': Icons.kitchen}, // generic appliance
    {'name': 'Home Product', 'icon': Icons.chair_outlined}, // or home_work_outlined
    {'name': 'Finance', 'icon': Icons.attach_money},
    {'name': 'Real Estate', 'icon': Icons.apartment}, // or location_city
    {'name': 'Fitness', 'icon': Icons.fitness_center},
    {'name': 'Other', 'icon': Icons.grid_view},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlue, // Fallback background
      body: Stack(
        children: [
          // 2. Background Gradient (Top Section)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35, // Cover top area
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF001A33), // Dark navy blue
                    Color(0xFF004280), // Slightly lighter blue - adjusting order for top-to-bottom feel as per image
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Subtle top pattern overlay (reusing the painter concept or similar)
                  Positioned.fill(
                    child: CustomPaint(
                      painter: DotGridPainter(),
                    ),
                  ),
                  // 3. Header Content
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            'What do you usually buy?',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 22, // Larger than body
                              fontWeight: FontWeight.w600, // Semi-Bold
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

          // 4. Main Content Container
          Positioned(
            top: 160, // Adjust to overlap gradient properly
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  // 5. Category Selection Grid
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: _categories.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.3, // Rectangular card shape
                        ),
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          final isSelected = _selectedCategory == category['name'];
                          return _buildCategoryCard(category['name'], category['icon'], isSelected);
                        },
                      ),
                    ),
                  ),
                  
                  // 7. Continue Button
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56, // Large and tappable
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const LocationPermissionScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom / 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String name, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = name;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryBlue.withOpacity(0.05) : Colors.transparent, // Light blue tint if selected
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? kPrimaryBlue : const Color(0xFFEEEEEE), // Primary blue if selected, else thin grey
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? kPrimaryBlue : const Color(0xFF757575), // Primary blue id selected, else grey
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Inter',
                color: isSelected ? kPrimaryBlue : const Color(0xFF757575),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusing the DotGridPainter from previous screen for consistency
class DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    const double spacing = 20.0;
    const double radius = 2.0;

    for (double y = 0; y < size.height; y += spacing) {
      paint.color = Colors.white.withOpacity(0.1 * (1 - y / size.height));
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
