import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'chat_session_screen.dart';
import 'call_required_modal.dart';

class ExpertHome extends StatefulWidget {
  const ExpertHome({super.key});

  @override
  State<ExpertHome> createState() => _ExpertHomeState();
}

class _ExpertHomeState extends State<ExpertHome> {
  bool _available = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo (left), empty center, availability toggle and bell on right
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  // Logo
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(color: whiteColor, shape: BoxShape.circle),
                    child: const Center(child: Icon(Icons.flash_on, color: primaryBlueColor, size: 20)),
                  ),

                  const Spacer(),

                  // Availability toggle and bell
                  Row(
                    children: [
                      // Toggle
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _available = !_available;
                          });
                        },
                        child: Container(
                          width: 46,
                          height: 28,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: _available ? onlineGreenColor : greyColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Align(
                            alignment: _available ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(color: whiteColor, shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none, color: textPrimaryColor),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Profile card area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: primaryBlueDarkColor, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    // Avatar
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(color: whiteColor, shape: BoxShape.circle),
                      child: const Icon(Icons.person, color: primaryBlueColor, size: 36),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Rajesh Kumar', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontWeight: FontWeight.w700, fontSize: 16)),
                          SizedBox(height: 4),
                          Text('Motor Expert', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 12)),
                          SizedBox(height: 8),
                          Text('+91 458992497', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 12)),
                          SizedBox(height: 4),
                          Text('rajeshkumar@gmail.com', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Availability message card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12)),
                child: const Text('You receive requests only when available', style: TextStyle(fontFamily: 'Inter', fontSize: 14)),
              ),
            ),

            const SizedBox(height: 12),

            // Action buttons row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _available ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ChatSessionScreen(),
                          ),
                        );
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlueColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Chat', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _available ? () {
                        CallRequiredModal.show(context);
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlueColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Call', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: borderGreyColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Visit', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Earnings Snapshot
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: primaryBlueColor, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('₹1,200', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 20, fontWeight: FontWeight.w700)),
                          SizedBox(height: 6),
                          Text('Today', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 12)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('₹8,400', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 20, fontWeight: FontWeight.w700)),
                          SizedBox(height: 6),
                          Text('This week', style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 12)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(Icons.trending_up, color: whiteColor),
                          SizedBox(height: 6),
                          Text('Trust\nImpact', textAlign: TextAlign.right, style: TextStyle(fontFamily: 'Inter', color: whiteColor, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Conditional section: Live Requests vs Upcoming + Insights
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    if (_available) ...[
                      // Live Requests title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Live Requests', style: TextStyle(fontFamily: 'Inter', color: textPrimaryColor, fontSize: 16, fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(height: 12),

                      // Sample request card
                      _buildRequestCard('Rajesh Kumar', 'Buying Advice • Electronics', 'Hot Seat'),
                      const SizedBox(height: 12),
                      _buildRequestCard('Priya Sharma', 'Technical Issue • Laptop', 'Regular'),
                    ] else ...[
                      // Upcoming Requests header
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGreyColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Upcoming Requests', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                            Icon(Icons.add),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Insights Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGreyColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: const [Icon(Icons.check_circle, color: successGreenColor), SizedBox(width: 8), Text('You helped 5 users today')]),
                            const SizedBox(height: 8),
                            Row(children: const [Icon(Icons.verified, color: primaryBlueColor), SizedBox(width: 8), Text('Rated Honest by 14 users')]),
                            const SizedBox(height: 8),
                            Row(children: const [Icon(Icons.trending_up, color: Colors.orange), SizedBox(width: 8), Text('Eligible for Hot Seat')]),
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Request'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Earning'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildRequestCard(String name, String subtitle, String tag) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2))]),
      child: Row(
        children: [
          Container(width: 6, height: 56, color: primaryBlueColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: textSecondaryColor)),
                const SizedBox(height: 6),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.yellow[200], borderRadius: BorderRadius.circular(6)), child: Text('Source: $tag', style: const TextStyle(fontSize: 12))),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: primaryBlueColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text('Accept')),
              const SizedBox(height: 8),
              OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: BorderSide(color: borderGreyColor), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text('Decline')),
            ],
          )
        ],
      ),
    );
  }
}
