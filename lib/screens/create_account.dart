import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';
import 'sign_in.dart'; // <-- FIX: Import the SignInScreen
import 'verify_email.dart';

class CreateAccountScreen extends StatefulWidget {
  final bool isExpert;
  const CreateAccountScreen({super.key, this.isExpert = false});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Header area: full-width dark blue with pattern
          Container(
            width: double.infinity,
            // Fully cover the background with blue, and have rounded bottom on the blue itself to flow into the white container.
            decoration: const BoxDecoration(
              color: kBackgroundBlue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28), bottom: Radius.circular(0)),
            ),
            padding: const EdgeInsets.only(top: 28, bottom: 18),
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
                      // Center logo + text
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Uncomment if logo SVG needed
                          // SvgPicture.asset(
                          //   'assets/images/appbar.svg',
                          //   height: 36,
                          //   width: 36,
                          //   fit: BoxFit.contain,
                          // ),
                          // const SizedBox(width: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // SvgPicture.asset(
                              //   'assets/images/appbar.svg',
                              //   height: 36,
                              //   width: 36,
                              //   fit: BoxFit.contain,
                              // ),
                              const SizedBox(width: 8),
                              Text('Sayhlo', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text('Right People. Right Advice.', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
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
                    Text('Create Your Account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black)),
                    const SizedBox(height: 8),
                    Text('Join us to access all features. It only takes a minute to get started.', style: TextStyle(fontSize: 14, color: kTextGrey)),

                    const SizedBox(height: 18),

                    _buildField(label: 'Full Name', hint: 'Jon Martin'),
                    const SizedBox(height: 12),
                    _buildField(label: 'Mobile Number', hint: 'Jon Martin'),
                    const SizedBox(height: 12),
                    _buildField(label: 'Your Email', hint: 'Jon Martin'),
                    const SizedBox(height: 12),
                    _buildField(label: 'Confirm Password', hint: 're write your password'),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _agree = !_agree),
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              border: Border.all(color: kOutlineGrey, width: 1.6),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: _agree ? const Icon(Icons.check, size: 18, color: kPrimaryBlue) : null,
                          ),
                        ),
                        const SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            text: 'I agree to ',
                            style: TextStyle(color: kTextGrey, fontSize: 14),
                            children: [
                              TextSpan(
                                text: 'Terms & Privacy',
                                style: TextStyle(color: kPrimaryBlue, fontSize: 14),
                                recognizer: TapGestureRecognizer()..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => VerifyEmailScreen(
                                    contactIdentifier: 'user@example.com',
                                    isExpert: widget.isExpert)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Divider with Or
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

                    // Google sign-in button
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
                            // Placeholder for Google G logo; replace with asset if available
                            SvgPicture.asset('assets/icons/google.svg', height: 24, width: 24),
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
                          text: "Already have an account? ",
                          style: TextStyle(color: kTextGrey),
                          children: [
                            TextSpan(
                              text: 'Sign In', // FIX: The correct action for existing users
                              style: TextStyle(color: kPrimaryBlue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignInScreen(isExpert: widget.isExpert)));
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

  Widget _buildField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: TextField(
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFFAAB6C1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
      ],
    );
  }
}
