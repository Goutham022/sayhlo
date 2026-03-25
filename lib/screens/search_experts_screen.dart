import 'package:flutter/material.dart';
import 'expert_profile_screen.dart';
import '../theme/colors.dart';

class SearchExpertsScreen extends StatelessWidget {
  const SearchExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Slightly taller for search bar
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                // Back Arrow
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: textPrimaryColor),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
                
                // Search Field
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderGreyColor),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: textSecondaryColor, size: 20), // Placeholder color alias
                        const SizedBox(width: 8),
                         const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search expert...',
                              hintStyle: TextStyle(
                                fontFamily: 'Inter',
                                color: textSecondaryColor, // textHintColor
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Filter Button
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderGreyColor),
                  ),
                  child: const Center(
                    child: Icon(Icons.tune, color: textPrimaryColor, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           // Page Title
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
             child: Text(
               'Electronics Specialist',
               style: TextStyle(
                 fontFamily: 'Inter',
                 color: textPrimaryColor,
                 fontWeight: FontWeight.w700, // Bold
                 fontSize: 20,
               ),
             ),
           ),
           
           // Expert List
           Expanded(
             child: ListView.separated(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               itemCount: 8, // Roughly matches scrollable list assumption
               separatorBuilder: (context, index) => const SizedBox(height: 16),
               itemBuilder: (context, index) => const ExpertCard(),
             ),
           ),
        ],
      ),
    );
  }
}

class ExpertCard extends StatelessWidget {
  const ExpertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ExpertProfileScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: whiteColor, // cardWhiteColor
          borderRadius: BorderRadius.circular(12),
          // No shadow requested "No elevation/shadow"
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          // Avatar
          Stack(
            children: [
              Container(
                 width: 60,
                 height: 60,
                 decoration: BoxDecoration(
                   color: Colors.grey[300], // avatarPlaceholderColor
                   borderRadius: BorderRadius.circular(8),
                 ),
                 // Placeholder, no image in reference for default state usually or just grey box
              ),
              // Online Dot
              Positioned(
                 right: 4,
                 bottom: 4,
                 child: Container(
                   width: 12,
                   height: 12,
                   decoration: BoxDecoration(
                     color: successGreenColor, // onlineGreenColor
                     shape: BoxShape.circle,
                     border: Border.all(color: whiteColor, width: 2),
                   ),
                 ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Row(
                   children: [
                     const Text(
                       'Sujoy Sharma',
                       style: TextStyle(
                         fontFamily: 'Inter',
                         color: primaryBlueColor,
                         fontWeight: FontWeight.w700, // Bold
                         fontSize: 16,
                       ),
                     ),
                     const SizedBox(width: 6),
                     const Icon(Icons.verified, color: successGreenColor, size: 16),
                   ],
                 ),
                 const SizedBox(height: 4),
                 const Text(
                   'Electronics Specialist',
                   style: TextStyle(
                     fontFamily: 'Inter',
                     color: textSecondaryColor,
                     fontWeight: FontWeight.w500, // Medium
                     fontSize: 12,
                   ),
                 ),
                 const SizedBox(height: 4),
                 // Rating Row
                 Row(
                   children: [
                     const Icon(Icons.star, color: warningYellowColor, size: 14), // ratingStarColor
                     const SizedBox(width: 4),
                     RichText(
                       text: const TextSpan(
                         style: TextStyle(
                           fontFamily: 'Inter',
                           color: textSecondaryColor,
                           fontSize: 12,
                         ),
                         children: [
                           TextSpan(text: '4.9', style: TextStyle(fontWeight: FontWeight.w600, color: textSecondaryColor)), // Slightly darker/bolder? kept same based on ref text "4.9(102 booking)"
                           TextSpan(text: '(102 booking)'),
                         ],
                       ),
                     ),
                   ],
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
