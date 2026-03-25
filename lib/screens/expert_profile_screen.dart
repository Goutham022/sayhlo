import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'expert_videos_screen.dart';

class ExpertProfileScreen extends StatelessWidget {
  const ExpertProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: AppBar(
        backgroundColor: backgroundWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textPrimaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Sujoy Sharma',
          style: TextStyle(
            fontFamily: 'Inter',
            color: textPrimaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: _buildProfileHeader(),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      labelColor: primaryBlueColor,
                      unselectedLabelColor: textSecondaryColor,
                      indicatorColor: primaryBlueColor,
                      indicatorWeight: 3,
                      labelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 13),
                      unselectedLabelStyle: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, fontSize: 13),
                      tabs: [
                        Tab(text: 'Slots'),
                        Tab(text: 'How I Help'),
                        Tab(text: 'Reviews'),
                        Tab(text: 'About'),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: const TabBarView(
              children: [
                SlotsTab(),
                HowIHelpTab(),
                ReviewsTab(),
                AboutTab(),
              ],
            ),
        ),
      ),
       // Bottom Fixed Button for "Slots" tab primarily, but requested generally "Bottom fixed primary button"
       // The prompt says "Slots tab content: ... Bottom fixed primary button: 'Book this slot'". 
       // It implies this might be specific to the Slots tab, or global. 
       // Given the "Book this slot" text, it's context-sensitive. 
       // However, often in these designs, if the user is on "About", they might still want to book.
       // But strictly following "Slots tab content: ... Bottom fixed ...", I should probably put it IN the tab or stick it to bottom if tab is active.
       // For simplicity and "Fixed at bottom" usually implies Scaffold bottomNavigationBar or similar.
       // Let's check the request "Flow 2... Slots tab content: ... Bottom fixed primary button".
       // I will place it inside the SlotsTab using a Stack or Column to ensure it's fixed relative to that view, or just use Scaffold bottomNavigationBar and update it based on tab?
       // Easier: Put it in the SlotsTab stack.
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner & Avatar
        SizedBox(
            height: 180,
            child: Stack(
                children: [
                    // Banner
                    Container(
                        height: 120,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: primaryBlueColor,
                            borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                                Icon(Icons.headset_mic, color: whiteColor, size: 20),
                                SizedBox(width: 8),
                                Text(
                                    'SayHlo Electronic Expert',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: whiteColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                    ),
                                ),
                            ],
                        ),
                    ),
                    // Avatar
                    Positioned(
                        top: 80, // Overlapping
                        left: 32,
                        child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: whiteColor, width: 3),
                                image: const DecorationImage(
                                     image: AssetImage('assets/images/placeholder_expert.png'), // Placeholder
                                     fit: BoxFit.cover,
                                ),
                            ),
                        ),
                    ),
                    // Available Now Indicator
                    Positioned(
                        right: 16,
                        bottom: 45, // Aligned roughly with name
                        child: Row(
                            children: const [
                                Icon(Icons.circle, color: successGreenColor, size: 10),
                                SizedBox(width: 4),
                                Text(
                                    'Available now',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: successGreenColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        ),
        
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    // Name
                    Row(
                        children: const [
                            Text(
                                'Sujoy Sharma',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: textPrimaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.verified, color: successGreenColor, size: 16),
                        ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                        'Electronics Specialist',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: textSecondaryColor,
                            fontSize: 13,
                        ),
                    ),
                    const SizedBox(height: 6),
                    // Rating
                    Row(
                        children: const [
                             Icon(Icons.star, color: warningYellowColor, size: 14),
                             SizedBox(width: 4),
                             Text(
                                 '4.9(102 booking)',
                                 style: TextStyle(
                                     fontFamily: 'Inter',
                                     color: textSecondaryColor,
                                     fontSize: 12,
                                 ),
                             ),
                        ],
                    ),
                     const SizedBox(height: 8),
                     // Location
                     Row(
                         children: [
                             Icon(Icons.location_on_outlined, color: textPrimaryColor, size: 16),
                             const SizedBox(width: 4),
                             Expanded(
                                 child: RichText(
                                     text: const TextSpan(
                                         style: TextStyle(
                                             fontFamily: 'Inter',
                                             color: textPrimaryColor,
                                             fontSize: 13,
                                         ),
                                         children: [
                                             TextSpan(text: 'Service area ', style: TextStyle(fontWeight: FontWeight.w600)),
                                             TextSpan(text: '6391 Elgin St. Celina, Delaware...', style: TextStyle(color: textSecondaryColor)),
                                         ],
                                     ),
                                     overflow: TextOverflow.ellipsis,
                                 ),
                             ),
                         ],
                     ),
                     const SizedBox(height: 12),
                     // Intro
                     const Text(
                         'Intro',
                         style: TextStyle(
                             fontFamily: 'Inter',
                             color: textPrimaryColor,
                             fontWeight: FontWeight.w600,
                             fontSize: 14,
                         ),
                     ),
                     const SizedBox(height: 4),
                     const Text(
                         'I help people make confident decisions about bikes.\nwhether it’s buying, fixing, or checking service quotes.',
                         style: TextStyle(
                             fontFamily: 'Inter',
                             color: textSecondaryColor,
                             height: 1.4,
                             fontSize: 13,
                         ),
                     ),
                     const SizedBox(height: 16),
                ],
            ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _SliverAppBarDelegate(this._tabBar);
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundWhiteColor,
      child: _tabBar,
    );
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}

// --- TABS ---

class SlotsTab extends StatelessWidget {
    const SlotsTab({super.key});

    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                        const Text(
                            'Available ways to talk',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: textPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                            ),
                        ),
                        const SizedBox(height: 12),
                        RichText(
                           text: const TextSpan(
                               style: TextStyle(fontFamily: 'Inter', fontSize: 13, color: textPrimaryColor),
                               children: [
                                   TextSpan(text: 'Services Time : ', style: TextStyle(fontWeight: FontWeight.w600)),
                                   TextSpan(text: 'Available Now', style: TextStyle(color: successGreenColor, fontWeight: FontWeight.w600)),
                               ],
                           ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Chat Card
                        _buildSlotCard(Icons.chat_bubble_outline, 'Chat', '₹299 / 10 mins'),
                        const SizedBox(height: 12),
                        // Call Card
                        _buildSlotCard(Icons.phone_outlined, 'Call', '₹299 / 10 mins'),
                        
                        const SizedBox(height: 80), // Space for bottom button
                    ],
                ),
                Positioned(
                    left: 16, right: 16, bottom: 16,
                    child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryBlueColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Book this slot', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontWeight: FontWeight.w600)),
                        ),
                    ),
                ),
            ],
        );
    }
    
    Widget _buildSlotCard(IconData icon, String title, String price) {
        return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: lightBlueOne,
                borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
                children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: primaryBlueColor,
                            borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(icon, color: whiteColor, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(title, style: const TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w700, fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(price, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                            ],
                        ),
                    ),
                    Row(
                        children: const [
                             Text('View timings', style: TextStyle(fontFamily: 'Inter', color: primaryBlueColor, fontWeight: FontWeight.w500, fontSize: 12)),
                             SizedBox(width: 4),
                             Icon(Icons.keyboard_arrow_down, color: primaryBlueColor, size: 16),
                        ],
                    ),
                ],
            ),
        );
    }
}

class HowIHelpTab extends StatelessWidget {
    const HowIHelpTab({super.key});
    
    @override
    Widget build(BuildContext context) {
        return ListView(
            padding: const EdgeInsets.all(16),
            children: [
                 Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         border: Border.all(color: warningYellowColor), // Orange border as per ref
                     ),
                     child: Column(
                         children: [
                             _buildHelpItem('assets/icons/buying_decisions.png' /* placeholder */, 'Buying Decisions', 'I help you decide whether to buy or avoid a product or service.', true),
                             const Divider(height: 1, color: Color(0xFFEEEEEE)), // faint divider
                             _buildHelpItem('assets/icons/issue_diagnosis.png', 'Issue Diagnosis', 'I help understand what’s wrong and whether it needs fixing.', true),
                             const Divider(height: 1, color: Color(0xFFEEEEEE)),
                             _buildHelpItem('assets/icons/quote_check.png', 'Quote / Price Check', 'I verify if a quote or price is fair.', false),
                         ],
                     ),
                 ),
            ],
        );
    }
    
    Widget _buildHelpItem(String iconPath, String title, String desc, bool isBottomPadding) {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    // Icon Placeholder
                    Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(
                            color: Colors.orange[50], // Light orange bg for icon
                            borderRadius: BorderRadius.circular(8), 
                        ),
                        // Ideally strictly use assets, but using Icon for now as placeholders weren't provided or generated.
                        // Ref image shows colorful icons. I'll use generally available Icons with colors to approximate.
                        child: const Center(child: Icon(Icons.lightbulb, color: warningYellowColor, size: 20)), 
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(title, style: const TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w600, fontSize: 14)),
                                const SizedBox(height: 4),
                                Text(desc, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 13, height: 1.4)),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}

class ReviewsTab extends StatelessWidget {
    const ReviewsTab({super.key});
    
    @override
    Widget build(BuildContext context) {
        return ListView(
            padding: const EdgeInsets.all(16),
            children: [
                const Text(
                    'Reviews (44 rating)',
                    style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 16),
                _buildReviewCard('Ramesh Gupta', 'Bangalore', 4.4, 'The verification process was quick and very smooth. I felt confident knowing my data was secure.'),
                const SizedBox(height: 16),
                const Divider(height: 1, color: Color(0xFFEEEEEE)),
                const SizedBox(height: 16),
                _buildReviewCard('Ramesh Gupta', 'Bangalore', 4.4, 'The verification process was quick and very smooth. I felt confident knowing my data was secure.'),
                const SizedBox(height: 16),
                const Divider(height: 1, color: Color(0xFFEEEEEE)),
                 const SizedBox(height: 16),
                _buildReviewCard('Ramesh Gupta', 'Bangalore', 4.4, 'The verification process was quick and very smooth.'),
            ],
        );
    }
    
    Widget _buildReviewCard(String name, String loc, double rating, String text) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Row(
                    children: [
                        Container(
                            width: 32, height: 32,
                            decoration: BoxDecoration(
                                color: primaryBlueColor,
                                borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                                child: Text(
                                    name.substring(0, 2).toUpperCase(), // Initials "SD" in ref, "RG" here
                                    style: const TextStyle(color: whiteColor, fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                            ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Row(
                                    children: [
                                        Text(name, style: const TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w600, fontSize: 14)),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.star, color: warningYellowColor, size: 14),
                                        const SizedBox(width: 2),
                                        Text(rating.toString(), style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                                    ],
                                ),
                                Text(loc, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                            ],
                        ),
                    ],
                ),
                const SizedBox(height: 12),
                Text(text, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 13, height: 1.4)),
            ],
        );
    }
}

class AboutTab extends StatelessWidget {
    const AboutTab({super.key});

    @override
    Widget build(BuildContext context) {
         return ListView(
             padding: const EdgeInsets.all(16),
             children: [
                 const Text('About me', style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w600, fontSize: 16)),
                 const SizedBox(height: 8),
                 RichText(
                     text: const TextSpan(
                         style: TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 13, height: 1.5),
                         children: [
                              TextSpan(text: 'I help people make confident decisions about bikes\n\n', style: TextStyle(color: textPrimaryColor)),
                              TextSpan(text: 'whether it’s buying, fixing, or checking service quotes. The expert profile was designed to minimize cognitive load and eliminate sales pressure, focusing entirely on credibility, clarity, and user confidence.'),
                         ],
                     ),
                 ),
                 const SizedBox(height: 24),
                 
                 GestureDetector(
                   onTap: () {
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => const ExpertVideosScreen()),
                     );
                   },
                   child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                           const Text('Videos by Rahul', style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w600, fontSize: 16)),
                           Row(
                               children: const [
                                   Text('View More', style: TextStyle(fontFamily: 'Inter', color: primaryBlueColor, fontWeight: FontWeight.w500, fontSize: 12)),
                                   Icon(Icons.chevron_right, color: primaryBlueColor, size: 16),
                               ],
                           ),
                       ],
                   ),
                 ),
                 const SizedBox(height: 16),
                 
                 _buildVideoRow('Bike engine noise explained', '29 July • 5M'),
                 const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 1, color: Color(0xFFEEEEEE))),
                 _buildVideoRow('Bike engine noise explained', '29 July • 5M'),
             ],
         );
    }
    
    Widget _buildVideoRow(String title, String meta) {
        return Row(
            children: [
                Container(
                    width: 40, height: 40,
                     decoration: BoxDecoration(
                        border: Border.all(color: textSecondaryColor),
                        borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(child: Icon(Icons.play_arrow_outlined, color: textPrimaryColor)),
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(title, style: const TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontWeight: FontWeight.w500, fontSize: 14)),
                            const SizedBox(height: 2),
                            Text(meta, style: const TextStyle(fontFamily: 'Inter', color: textSecondaryColor, fontSize: 12)),
                        ],
                    ),
                ),
                const Icon(Icons.play_circle_filled, color: primaryBlueColor, size: 32),
            ],
        );
    }
}
