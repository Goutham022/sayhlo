import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';
import 'create_account.dart';
import 'verify_email.dart'; // <-- FIX: Import the missing VerifyEmailScreen

class SignInScreen extends StatelessWidget {
  final bool isExpert;
  const SignInScreen({super.key, this.isExpert = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Header: deep blue with SVG pattern and logo
          Container(
            width: double.infinity,
            color: kBackgroundBlue,
            padding: const EdgeInsets.only(top: 80, bottom: 80),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // SvgPicture.asset('assets/images/appbar.svg', height: 36, width: 36),
                          const SizedBox(width: 8),
                          const Text('Sayhlo', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text('Right People. Right Advice.', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ),

          // White rounded card container
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    const Text('Sign In', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black)),
                    const SizedBox(height: 8),
                    Text('Welcome back! Enter your details to continue.', style: TextStyle(fontSize: 14, color: kTextGrey)),

                    const SizedBox(height: 18),

                    const Text('Your Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'name@email.com',
                          hintStyle: TextStyle(color: kTextGrey),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: kOutlineGrey, width: 1.4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: kPrimaryBlue, width: 1.6),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to VerifyEmailScreen with contactIdentifier passed
                          final email = 'user@example.com';
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => VerifyEmailScreen(
                                contactIdentifier: email, 
                                autoVerify: false,
                                isExpert: isExpert,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Send OTP', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password', style: TextStyle(color: kPrimaryBlue)),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Divider(thickness: 1, color: Color(0xFFE6E6E6))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Or', style: TextStyle(color: kTextGrey)),
                        ),
                        const Expanded(child: Divider(thickness: 1, color: Color(0xFFE6E6E6))),
                      ],
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: kOutlineGrey, width: 1.4),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // If SVG doesn't show, try a fallback icon:
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              // child: Image.asset(
                              //   'assets/icons/google.svg',
                              //   // package: null,
                              //   height: 22,
                              //   width: 22,
                              //   // errorBuilder: (context, error, stackTrace) =>
                              //   //     Icon(Icons.account_circle, color: Colors.grey, size: 22),
                              // ),
                            ),
                            const SizedBox(width: 12),
                            Text('Continue with Google', style: TextStyle(color: Colors.black87, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: kTextGrey),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(color: kPrimaryBlue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateAccountScreen(isExpert: isExpert)));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
