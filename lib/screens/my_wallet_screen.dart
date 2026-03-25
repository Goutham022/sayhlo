import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

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
          'My Wallet',
          style: TextStyle(
            fontFamily: 'Inter',
            color: textPrimaryColor,
            fontWeight: FontWeight.w500, // Medium weight
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFEEEEEE), // Very thin light grey
            height: 1.0,
          ),
        ),
      ),
      // Utilizing Column with Spacer/Expanded to push 'Done' button to bottom if content allows, 
      // or main ScrollView + bottomNavigationBar/persistent footer.
      // Reference shows 'Done' at bottom. "Fixed at bottom with safe-area spacing".
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AVAILABLE BALANCE CARD
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: primaryBlueColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                           Text(
                            'Available Balance',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: textWhiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '₹1,250',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: textWhiteColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w700, // Very bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // SUBTEXT
                    const Center(
                      child: Text(
                        'Used for expert calls and services',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: textSecondaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
              
                    // RECHARGE AMOUNT TITLE
                    const Text(
                      'Recharge Amount',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: textPrimaryColor,
                        fontWeight: FontWeight.w700, // Bold
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
              
                    // AMOUNT BUTTONS GRID
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.2, // Rectangular shape
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                         final amounts = ['₹100', '₹250', '₹500', '₹1000', '₹2000', '₹3000'];
                         return Container(
                           decoration: BoxDecoration(
                             border: Border.all(color: borderGreyColor),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           alignment: Alignment.center,
                           child: Text(
                             amounts[index],
                             style: const TextStyle(
                               fontFamily: 'Inter',
                               color: textSecondaryColor,
                               fontSize: 14,
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                         );
                      },
                    ),
                    
                    const SizedBox(height: 40),
              
                    // ADD MONEY BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 48,
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
                          'Add Money',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: textWhiteColor, // defined in colors.dart as alias or constant
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // SECURITY INFO
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.verified_user_outlined, color: successGreenColor, size: 20), // Shield placeholder
                  SizedBox(width: 8),
                  Text(
                    'Secure payments. You Wallet is safe.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: textSecondaryColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, color: Color(0xFFEEEEEE)), // Optional separate divider if strictly required above bottom section? Ref doesn't show clearly but "Done" is detached.
            // Actually, "Done" is bottom action.
            
            // BOTTOM ACTION BUTTON (DONE)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(), // "Done" likely closes or returns
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryBlueColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: primaryBlueColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
