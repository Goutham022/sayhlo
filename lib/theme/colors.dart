import 'package:flutter/material.dart';

/// Centralized color constants used across the app.
const Color kPrimaryBlue = Color(0xFF004280);
const Color kBackgroundBlue = Color(0xFF004280);
const Color kSoftWhite = Color(0xFFF7FAFC);
const Color kTextGrey = Color(0xFF66788A);
const Color kOutlineGrey = Color(0xFFCBDAE6);

// Additional aliased names required by new screens (do not hardcode elsewhere)
const Color kPrimaryColor = kPrimaryBlue;
const Color kPrimaryButtonColor = kPrimaryBlue;
const Color kButtonTextColor = Color(0xFFFFFFFF);
const Color kMutedText = kTextGrey;
const Color kTextColor = Color(0xFF071018);
const Color kBorderColor = kOutlineGrey;
const Color kScaffoldBackground = Color(0xFFFFFFFF);
const Color kDisabledButtonColor = Color(0xFFB0BEC5);
const Color kDeepNavyBlue = Color(0xFF001A33);

// Aliases for Select Category of Expertise Screen
const Color textPrimaryColor = kTextColor;
const Color textSecondaryColor = kTextGrey;
const Color borderGreyColor = kOutlineGrey;
const Color primaryBlueColor = kPrimaryBlue;
const Color hintTextColor = Color(0xFFA0AEC0);
const Color whiteColor = Colors.white;

// Aliases for Document Verification Screen
const Color backgroundWhiteColor = Colors.white;
const Color iconGreyColor = kTextGrey;

// Aliases for Home Screen
const Color primaryBlueDarkColor = Color(0xFF001A33);
const Color successGreenColor = Color(0xFF28C76F);
const Color greyColor = Color(0xFFBDBDBD);

// Aliases for Profile Screen
const Color warningYellowColor = Color(0xFFFFC107); // Standard amber/yellow for warnings/ratings

// Aliases for My Wallet Screen
const Color textWhiteColor = Colors.white;

// Aliases for Expert Profile Screen
const Color bannerColor = kPrimaryBlue; // or kDeepNavyBlue based on ref, but blue looks safer 
const Color tabIndicatorColor = kPrimaryBlue;
const Color cardBackgroundColor = Color(0xFFF2F6FA); // Light bluish text box bg? Checking ref... Reviews card maybe?
// Ref shows review avatar bg as PRIMARY BLUE, card is WHITE.
// Slots tab: Chat card is light blue/grey bg. Let's add a light shade.
const Color lightBlueOne = Color(0xFFE6F0FA); // Light blue for card backgrounds like Chat/Call
const Color onlineGreenColor = Color(0xFF43A047); 

// Aliases for Audio/Video Call Screens
const Color kAudioCallGradientStart = Color(0xFF0D2137); // Dark navy gradient top
const Color kAudioCallGradientEnd = Color(0xFF061320);   // Darker navy gradient bottom
const Color kEndCallPink = Color(0xFFFF4081);            // Pink/red for End Call button
const Color kControlButtonGrey = Color(0xFF6B7280);      // Grey for mic/speaker/video buttons
const Color kControlButtonBg = Color(0xFF4A5568);        // Darker grey button background

// Aliases for Call Required Modal
const Color kUrgencyYellowBg = Color(0xFFFFF9E6);        // Light yellow badge background
const Color kUrgencyYellowText = Color(0xFFC49A00);      // Darker yellow badge text

