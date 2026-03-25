import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';
import 'create_account.dart';

class SayhloScreen extends StatelessWidget {
  const SayhloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryBlue = kPrimaryBlue;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.6, 0.5, 1.0],
            colors: [
              Color(0xFF004280),
              Color(0xFF004280),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Column(
          children: [
            // Top SVG app bar illustration fading out at the bottom into background gradient
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  child: SvgPicture.asset(
                    'assets/images/appbar.svg',
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color(0xFF004280),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Move the main illustration here, just below the app bar, without gap
            Stack(
              children: [
                Container(
                  height: 350, // Adjust height as needed for your design
                  width: double.infinity,
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    'assets/images/hello.svg',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradient overlay at bottom to mix colours and end with straight line
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFFB1CAE5).withOpacity(0.6),
                          Color(0xFFFFFFFF),
                        ],
                        stops: [0.0, 0.8, 1.0],
                      ),
                    ),
                  ),
                ),
                // Straight hard edge/line at bottom (simulate as 2px line)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 2,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Column(
                  children: [
                    // Heading
                    Text(
                      'Choose how you want to use',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF070707)),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '"SAYHLO"',
                            style: TextStyle(
                                color: primaryBlue,
                                fontWeight: FontWeight.w900,
                                fontSize: 28),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // Role indicator SVG asset
                    SvgPicture.asset(
                      'assets/icons/headone.svg',
                      width: 72,
                      height: 72,
                    ),
                    const Spacer(),
                    // Buttons
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const CreateAccountScreen(isExpert: false)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('User Login',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const CreateAccountScreen(isExpert: true)));
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primaryBlue, width: 1.6),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          foregroundColor: primaryBlue,
                        ),
                        child: Text('Expert Login',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: primaryBlue)),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
