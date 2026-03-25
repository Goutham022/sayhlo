import 'package:flutter/material.dart';
import 'select_category_expertise_screen.dart';
import 'profile_screen.dart';
import 'history_screen.dart';
import 'my_wallet_screen.dart';
import 'search_experts_screen.dart';
import 'address_selection_screen.dart';
import '../theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP HEADER (GRADIENT SECTION)
            Container(
              padding: const EdgeInsets.only(bottom: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryBlueDarkColor,
                    primaryBlueColor,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      // HEADER – ROW 1 (APP IDENTITY)
                      Row(
                        children: [
                          // Placeholder logo
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(Icons.flash_on, color: primaryBlueColor, size: 20),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Sayhlo',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: whiteColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Right People. Right Advice.',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: whiteColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Right Icons
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const MyWalletScreen()),
                              );
                            },
                            child: const Icon(Icons.account_balance_wallet_outlined, color: whiteColor, size: 24),
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.monetization_on_outlined, color: whiteColor, size: 24),
                          const SizedBox(width: 16),
                          const Icon(Icons.notifications_none, color: whiteColor, size: 24),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // HEADER – ROW 2 (LOCATION)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const AddressSelectionScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: whiteColor.withOpacity(0.85), size: 16),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                '8502 Preston Rd. Inglewood, Maine 98380',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: whiteColor.withOpacity(0.85),
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.chevron_right, color: whiteColor.withOpacity(0.85), size: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // HEADER – ROW 3 (SEARCH BAR)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const SearchExpertsScreen()),
                          );
                        },
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: whiteColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: whiteColor.withOpacity(0.9), size: 20),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Search for a product or expert....',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: whiteColor.withOpacity(0.9),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Icon(Icons.mic_none, color: whiteColor.withOpacity(0.9), size: 20),
                              const SizedBox(width: 12),
                              Icon(Icons.camera_alt_outlined, color: whiteColor.withOpacity(0.9), size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // CATEGORY CHIPS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildCategoryChip('Electronics', Icons.headphones, true),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Bike', Icons.pedal_bike, false),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Real Estate', Icons.apartment, false),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // PROMOTIONAL BANNER CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryBlueDarkColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                     // Content
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Welcome, Preetham',
                                  style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 12),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Get Discount\nupto 35% off',
                                  style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 18, fontWeight: FontWeight.w700, height: 1.1),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'On your first get 30% off',
                                  style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 10),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Book Now',
                                    style: TextStyle(fontFamily: 'Inter', color: primaryBlueColor, fontSize: 12, fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                             flex: 2,
                             child: Container(), // Space for image
                          ),
                        ],
                      ),
                    ),
                    // Placeholder Image (Right)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 10,
                      width: 130, // Approx
                      child: Container(
                         decoration: BoxDecoration(
                           color: Colors.grey[300], // Placeholder color
                           borderRadius: const BorderRadius.only(bottomRight: Radius.circular(16)),
                         ),
                         // Add a basic icon/image placeholder if needed or leave as grey block
                         child: const Icon(Icons.person, size: 80, color: Colors.grey),
                      ),
                    ),
                    // Pagination Dots
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(true),
                          const SizedBox(width: 4),
                          _buildDot(false),
                          const SizedBox(width: 4),
                          _buildDot(false),
                             const SizedBox(width: 4),
                          _buildDot(false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),

             // TOP EXPERTS NEAR YOU
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                    'Top Experts near you',
                    style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontSize: 16, fontWeight: FontWeight.w700),
                 ),
               ),
             ),
             const SizedBox(height: 16),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   _buildExpertCard('Sujoy Sharma', 'Electronics Specialist', '4.9', '(102 review)'),
                   const SizedBox(width: 16),
                   _buildExpertCard('Shreya Shah', 'Fashion Specialist', '4.9', '(122 review)'),
                   const SizedBox(width: 16),
                   _buildExpertCard('Ramesh', 'Electronics', '4.9', '(22 review)'), // Truncated in image sample
                 ],
               ),
             ),

             const SizedBox(height: 24),

             // NEAR BY STORES
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                    'Near By Stores',
                    style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontSize: 16, fontWeight: FontWeight.w700),
                 ),
               ),
             ),
             const SizedBox(height: 16),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Column(
                 children: [
                   _buildStoreCard('Reliance Digital', 'Electronics Store', '1.2km away', '4.9(102 review)'),
                   const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
                   _buildStoreCard('Car Hub', 'Car Store', '0.8km away', '3.9(188 review)'),
                    const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('See all', style: TextStyle(fontFamily: 'Inter', color: primaryBlueColor, fontSize: 12, fontWeight: FontWeight.w500)),
                          Icon(Icons.keyboard_arrow_down, color: primaryBlueColor, size: 16),
                        ],
                      ),
                    ),
                 ],
               ),
             ),

             const SizedBox(height: 24),

             // HOW SAYHLO HELPED PEOPLE
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                    'HOW SAYHLO HELPED PEOPLE',
                    style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontSize: 14, fontWeight: FontWeight.w700), // Uppercase
                 ),
               ),
             ),
             const SizedBox(height: 16),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Container(
                 padding: const EdgeInsets.all(16),
                 decoration: BoxDecoration(
                   color: whiteColor,
                   borderRadius: BorderRadius.circular(12),
                   border: Border.all(color: const Color(0xFFEEEEEE)),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         CircleAvatar(
                           radius: 20,
                           backgroundColor: kPrimaryBlue,
                           child: const Text('SD', style: TextStyle(color: whiteColor, fontSize: 14)),
                         ),
                         const SizedBox(width: 12),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: const [
                             Text('Ramesh Gupta', style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w600, fontSize: 14)),
                             Text('Bangalore', style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                           ],
                         ),
                         const Spacer(),
                         Container(
                           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                           decoration: BoxDecoration(
                             color: whiteColor,
                             borderRadius: BorderRadius.circular(100), // Pill
                           ),
                           child: Row(
                             children: const [
                               Icon(Icons.star, color: successGreenColor, size: 14), // Green star in new image? No, image has filled green circle with white star? 
                               // Ref image: Green circle with white star inside? Or just green star? 
                               // Zooming in: It looks like a green filled circle with white star inside, or just a green star icon next to text.
                               // Let's go with Green Icon.
                               Icon(Icons.stars, color: successGreenColor, size: 16), 
                               SizedBox(width: 4),
                               Text('4.4', style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                             ],
                           ),
                         ),
                       ],
                     ),
                     const SizedBox(height: 12),
                     const Text(
                       'The verification process was quick and very smooth. I felt confident knowing my data was secure.',
                       style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12, height: 1.4),
                     ),
                   ],
                 ),
               ),
             ),

             const SizedBox(height: 40),

             // BRANDING FOOTER
             Stack(
               children: [
                 // Background pattern placeholder (grey dots/lines)
                 Container(
                   height: 150,
                   width: double.infinity,
                   color: const Color(0xFFF5F5F5), // Very light grey
                   // Add CustomPainter here for pattern if strictly required, simplified to color for now or image asset if avail
                 ),
                 Positioned.fill(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        const Text(
                          '# Just Sayhlo',
                          style: TextStyle(fontFamily: 'Inter', color: kPrimaryBlue, fontSize: 24, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.flag, color: Colors.orange, size: 16), // India flag placeholder colors
                            SizedBox(width: 4),
                            Text('Made for India', style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.favorite, color: Colors.red, size: 12),
                            SizedBox(width: 4),
                            Text('From Minds of PrismEx', style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                          ],
                        ),
                     ],
                   ),
                 ),
               ],
             ),
             
             // Extra space for FAB and BottomBar
             const SizedBox(height: 80), 
          ],
        ),
      ),
      // BOTTOM NAVIGATION
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryBlueColor,
        elevation: 4,
        child: const Icon(Icons.mic, color: whiteColor), // Icon inside FAB
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: whiteColor,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', true, context),
              _buildNavItem(Icons.sports_esports, 'Hlo Arena', false, context),
              const SizedBox(width: 40), // Space for FAB
              _buildNavItem(Icons.history, 'History', false, context),
              _buildNavItem(Icons.person_outline, 'Profile', false, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Profile') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        } else if (label == 'History') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HistoryScreen()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? primaryBlueColor : kTextGrey, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              color: isSelected ? primaryBlueColor : kTextGrey,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? primaryBlueColor : Colors.transparent,
        border: Border.all(color: primaryBlueColor, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? whiteColor : primaryBlueColor, size: 16),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              color: isSelected ? whiteColor : primaryBlueColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 24 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? whiteColor : greyColor, // Ref image has white active dot on dark banner? 
        // Ref image: Active dot is Blue? No, white/lighter on dark bg?
        // Wait, "Active dot: primaryBlueColor" in REQUIREMENT.
        // "Inactive: greyColor"
        // But banner bg is primaryBlueDarkColor. Blue on Dark Blue might be low contrast.
        // Reference image shows white active dot on the banner.
        // BUT REQUIREMENT SAYS: "Active dot: primaryBlueColor". I MUST FOLLOW REQUIREMENT.
        // Wait, looking at the image provided... Start of "Promotional Banner" section rules.
        // The dots are at the bottom of the banner.
        // Okay, I will follow rule: isActive ? primaryBlueColor : greyColor.
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildExpertCard(String name, String role, String rating, String count) {
    return Container(
      width: 140, // Fixed width card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
             child: const Icon(Icons.person, size: 60, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: Text(name, style: const TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w700, fontSize: 14), overflow: TextOverflow.ellipsis)),
              const SizedBox(width: 4),
              const Icon(Icons.verified, color: successGreenColor, size: 14),
            ],
          ),
          Text(role, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12), overflow: TextOverflow.ellipsis),
           const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text(rating, style: const TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w600, fontSize: 12)),
               const SizedBox(width: 2),
               Expanded(child: Text(count, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 10), overflow: TextOverflow.ellipsis)),
            ],
          ),
           const SizedBox(height: 6),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
             decoration: BoxDecoration(
               color: successGreenColor.withOpacity(0.15),
               borderRadius: BorderRadius.circular(4),
             ),
             child: const Text('Active', style: TextStyle(fontFamily: 'Inter', color: successGreenColor, fontSize: 10, fontWeight: FontWeight.w600)),
           ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(String name, String category, String distance, String rating) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
         Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.store, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w700, fontSize: 16)),
                Text(category, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 14)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: kPrimaryBlue, size: 14), // Pin icon
                    const SizedBox(width: 4),
                    Text(distance, style: const TextStyle(fontFamily: 'Inter', color: kPrimaryBlue, fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 12),
                    Text('Mumbai (W)', style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)), // Hardcoded as per image often showing location suffix
                  ],
                ),
                const SizedBox(height: 4),
                 Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
