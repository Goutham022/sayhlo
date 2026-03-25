import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ProfileReviewPending extends StatelessWidget {
  const ProfileReviewPending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Blue background / gradient to match reference
      body: SafeArea(
        child: Column(
          children: [
            // AppBar area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Illustration placeholder
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 300,
                  decoration: BoxDecoration(
                    color: primaryBlueColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.laptop_mac, size: 120, color: Colors.white70),
                  ),
                ),
              ),
            ),

            // Message area
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: const BoxDecoration(
                  color: Color(0xFFF5FAFF),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Your profile is under review.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'You will be notified once approved.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Continue button — navigates to Expert Home
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/expert_home');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primaryBlueColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: const Text('Continue', style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: whiteColor)),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: primaryBlueColor,
    );
  }
}
