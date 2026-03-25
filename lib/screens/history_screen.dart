import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_screen.dart'; // For navigation context
import 'profile_screen.dart'; // For navigation context
import '../theme/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: AppBar(
        backgroundColor: backgroundWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(), // Navigate back
        ),
        title: const Text(
          'History',
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHistoryCard(),
          const SizedBox(height: 16),
          _buildHistoryCard(),
          const SizedBox(height: 16),
          _buildHistoryCard(),
        ],
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
              _buildNavItem(Icons.history, 'History', true, context), // Selected
              _buildNavItem(Icons.person_outline, 'Profile', false, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderGreyColor),
      ),
      child: Column(
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '24 Dec 2024 • 12 messages',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: textSecondaryColor,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.chat_bubble_outline, color: primaryBlueColor, size: 16),
                  const SizedBox(width: 4),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: primaryBlueColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Main Content Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image Placeholder
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/placeholder_expert.png'), // Using placeholder or logic to load valid asset
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey[300], // Fallback
                ),
                child: const Icon(Icons.person, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Rajesh Kumar',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: textPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Electronics',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: primaryBlueColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Discussed bike price',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: textSecondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Savings
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   const Icon(Icons.monetization_on, color: warningYellowColor, size: 16), // Using warningYellowColor for Gold Coin look
                   const SizedBox(width: 4),
                   const Text(
                    'Saved ₹3,000',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: successGreenColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon, String label, bool isSelected, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (label == 'Profile') {
           Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
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
