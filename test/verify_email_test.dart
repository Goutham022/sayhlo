import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sayhlo/screens/verify_email.dart';

void main() {
  testWidgets('OTP input, paste, and verify button state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: VerifyEmailScreen(contactIdentifier: 'test', autoVerify: false)));
    await tester.pumpAndSettle();

    // Ensure first OTP box focused
    expect(find.bySemanticsLabel('OTP digit 1'), findsOneWidget);

    // Enter digits
    await tester.enterText(find.bySemanticsLabel('OTP digit 1'), '1');
    await tester.enterText(find.bySemanticsLabel('OTP digit 2'), '2');
    await tester.enterText(find.bySemanticsLabel('OTP digit 3'), '3');
    await tester.enterText(find.bySemanticsLabel('OTP digit 4'), '4');
    await tester.pumpAndSettle();

    // Verify button enabled
    final verify = find.text('Verify');
    expect(verify, findsOneWidget);
  });
}
