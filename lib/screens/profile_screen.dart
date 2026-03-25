import 'package:flutter/material.dart';
import 'dart:math';
import 'home_screen.dart'; // For existing screen navigation context if needed
import '../theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: AppBar(
        backgroundColor: backgroundWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(), // Or navigate to Home if this is a replacement
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            color: textPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFEEEEEE),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              // PROFILE SUMMARY CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryBlueDarkColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          // Profile Image
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 2),
                            ),
                            child: const CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.grey, // Placeholder
                              backgroundImage: AssetImage('assets/images/placeholder_profile.png'), // Or Icon
                              child: Icon(Icons.person, size: 40, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Name & Role
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sujal Shah',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: whiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Decision maker',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: whiteColor.withOpacity(0.85),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Confidence Score
                          Column(
                            children: [
                              CustomPaint(
                                size: const Size(80, 40), // Semi-circle size
                                painter: ArcPainter(
                                  percentage: 0.78,
                                  color: successGreenColor,
                                  trackColor: warningYellowColor, // Gradient requested, using colors provided
                                ),
                                child: const SizedBox(
                                  width: 80,
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        '78',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: whiteColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Confidence Score',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: whiteColor.withOpacity(0.85),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: whiteColor, height: 1, thickness: 0.5),
                    
                    // WALLET STRIP
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        children: [
                          const Text(
                            'Wallet Balance: ₹2,345',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Add funds',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: primaryBlueColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // QUICK ACTION BUTTON GRID
              Row(
                children: [
                  _buildGridButton(Icons.assignment_outlined, 'My Decision'),
                  const SizedBox(width: 16),
                  _buildGridButton(Icons.headset_mic_outlined, 'Consultation'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildGridButton(Icons.bookmark_border, 'Saved Insights'),
                  const SizedBox(width: 16),
                  _buildGridButton(Icons.card_giftcard, 'Referrals'),
                ],
              ),

              const SizedBox(height: 24),

              // OPTION LIST ITEMS
              _buildOptionItem(Icons.currency_rupee, 'Transaction History'),
              const SizedBox(height: 12),
              _buildOptionItem(Icons.local_offer_outlined, 'Manage Subscription'),
              const SizedBox(height: 12),
              _buildOptionItem(Icons.settings_outlined, 'Account Settings'),

              const SizedBox(height: 32),

              // PRIMARY CTA BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Ask an Expert',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // BOTTOM NAVIGATION
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryBlueColor,
        elevation: 4,
        child: const Icon(Icons.smart_toy, color: whiteColor), // Bot icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: backgroundWhiteColor,
        elevation: 10,
        shadowColor: Colors.black26, 
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 'Home', false, context),
              _buildNavItem(Icons.sports_esports, 'Hlo Arena', false, context),
              const SizedBox(width: 40), // Space for FAB
              _buildNavItem(Icons.history, 'History', false, context),
              _buildNavItem(Icons.person, 'Profile', true, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryBlueColor.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: primaryBlueColor, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: primaryBlueColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryBlueColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: whiteColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: textPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: textSecondaryColor),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          // Navigate back to Home and clear stack on top of it or pushReplacement
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? primaryBlueColor : greyColor, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              color: isSelected ? primaryBlueColor : greyColor,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double percentage;
  final Color color;
  final Color trackColor;

  ArcPainter({required this.percentage, required this.color, required this.trackColor});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    // Background Arc
    paint.color = trackColor.withOpacity(0.3); // Faint track
    canvas.drawArc(rect, pi, pi, false, paint);

    // Foreground Gradient Arc
    final gradient = LinearGradient(
      colors: [successGreenColor, trackColor],
    ).createShader(rect);
    
    paint.shader = gradient;
    paint.color = Colors.white; // Ignored by shader
    
    // Draw only the percentage
    canvas.drawArc(rect, pi, pi * percentage, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
