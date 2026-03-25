import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'audio_call_screen.dart';

/// Modal bottom sheet displayed when user taps "Call" button on Expert Home.
/// Shows user details and "Start Call" button to initiate audio call.
class CallRequiredModal extends StatelessWidget {
  final String userName;
  final String userNeed;
  final String budget;
  final String urgency;

  const CallRequiredModal({
    super.key,
    this.userName = 'Rajesh Kumar',
    this.userNeed = 'Buying advice for smartphone',
    this.budget = '₹40-50k',
    this.urgency = 'Medium',
  });

  /// Show this modal as a bottom sheet
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CallRequiredModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with title and close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Call Required',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryBlueColor,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, color: textSecondaryColor, size: 24),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // User field
          _buildFieldLabel('User'),
          const SizedBox(height: 4),
          Text(
            userName,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textPrimaryColor,
            ),
          ),
          const Divider(height: 24),

          // User need field
          _buildFieldLabel('User need'),
          const SizedBox(height: 4),
          Text(
            userNeed,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textPrimaryColor,
            ),
          ),
          const Divider(height: 24),

          // Budget field
          _buildFieldLabel('Budget'),
          const SizedBox(height: 4),
          Text(
            budget,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textPrimaryColor,
            ),
          ),
          const Divider(height: 24),

          // Urgency field with badge
          _buildFieldLabel('Urgency'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: kUrgencyYellowBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              urgency,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kUrgencyYellowText,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Start Call button
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // Close modal
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AudioCallScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.phone, size: 20),
              label: const Text(
                'Start Call',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlueColor,
                foregroundColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textSecondaryColor,
      ),
    );
  }
}
