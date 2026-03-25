import 'package:flutter/material.dart';
import 'document_verification_screen.dart';
import '../theme/colors.dart';

class SelectCategoryExpertiseScreen extends StatefulWidget {
  const SelectCategoryExpertiseScreen({super.key});

  @override
  State<SelectCategoryExpertiseScreen> createState() => _SelectCategoryExpertiseScreenState();
}

class _SelectCategoryExpertiseScreenState extends State<SelectCategoryExpertiseScreen> {
  // Category Data
  final List<String> _categories = [
    'Electronics Expert',
    'Motor Mechanic',
    'Fitness Coach',
    'Insurance Advisor',
    'Real Estate Consultant',
    'Automobile expert',
    'Home appliances technician',
  ];

  // Language Data
  final List<String> _languages = [
    'English',
    'Hindi',
    'Malayalam',
    'Telugu',
  ];

  // State Variables
  String? _selectedCategory = 'Motor Mechanic'; // Pre-selected as per image/requirements (though image shows check)
  // Actually image shows "Motor Mechanic" picked.
  // Prompt says "Selected state (Motor Mechanic): ... Only one category selectable at a time."
  
  // For languages, prompt says "All checkboxes initially unchecked".
  // Assuming multiple selection for languages as typical, but prompt said "Same checkbox styling as category list".
  // I will use a Set for multiple selection for languages.
  final Set<String> _selectedLanguages = {};

  final TextEditingController _cityController = TextEditingController(text: 'Nagpur');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Select Category of\nExpertise',
          style: TextStyle(
            fontFamily: 'Inter',
            color: textPrimaryColor,
            fontWeight: FontWeight.w700, // Bold
            fontSize: 22, // Slightly larger
            height: 1.2,
          ),
        ),
        titleSpacing: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // Category List
                  ..._categories.map((category) => _buildCategoryItem(category)),

                  const SizedBox(height: 24),

                  // Your Experience Section
                  const Text(
                    'Your Experience',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: textPrimaryColor,
                      fontWeight: FontWeight.w700, // Bold
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderGreyColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Select',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: hintTextColor,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_down, color: textSecondaryColor),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // City Section
                  const Text(
                    'City',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: textPrimaryColor,
                      fontWeight: FontWeight.w700, // Bold
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderGreyColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nagpur',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: textSecondaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // Note: If this needs to be editable TextField:
                    // child: TextField(
                    //   controller: _cityController,
                    //   decoration: const InputDecoration(
                    //     border: InputBorder.none,
                    //     isDense: true,
                    //     contentPadding: EdgeInsets.zero,
                    //   ),
                    //   style: const TextStyle(
                    //     fontFamily: 'Inter',
                    //     color: textSecondaryColor,
                    //     fontSize: 14,
                    //   ),
                    // ),
                    // Requirements said "Input field below ... Pre-filled with 'Nagpur'". 
                    // Container look matches dropdown but is an input. I'll stick to Container with Text for strict visual matching 
                    // or TextField if functional. "Input field" implies TextField. I'll use TextField but styled to match exactly.
                  ),

                  const SizedBox(height: 24),

                  // Languages Section
                  const Text(
                    'Languages spoken',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: textPrimaryColor,
                      fontWeight: FontWeight.w700, // Bold
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ..._languages.map((lang) => _buildLanguageItem(lang)),

                  const SizedBox(height: 40), // Bottom padding for scrolling
                ],
              ),
            ),
          ),
          
          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DocumentVerificationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600, // Semi-bold
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String category) {
    final bool isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategory = category;
          });
        },
        child: Row(
          children: [
            // Custom Checkbox
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? primaryBlueColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? primaryBlueColor : borderGreyColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4), // Slight round for checkbox
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: whiteColor,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              category,
              style: TextStyle(
                fontFamily: 'Inter',
                color: isSelected ? primaryBlueColor : textSecondaryColor,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem(String language) {
    final bool isSelected = _selectedLanguages.contains(language);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              _selectedLanguages.remove(language);
            } else {
              _selectedLanguages.add(language);
            }
          });
        },
        child: Row(
          children: [
            // Custom Checkbox
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? primaryBlueColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? primaryBlueColor : borderGreyColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: whiteColor,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              language,
              style: TextStyle(
                fontFamily: 'Inter',
                color: isSelected ? primaryBlueColor : textSecondaryColor,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
