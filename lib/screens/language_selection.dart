import 'package:flutter/material.dart';
import 'sayhlo.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  int _selected = 0;

  final _languages = const [
    {'symbol': 'Aa', 'name': 'English'},
    {'symbol': 'अ', 'name': 'हिंदी'},
    {'symbol': 'అ', 'name': 'తెలుగు'},
    {'symbol': 'അ', 'name': 'മലയാളം'},
  ];

  @override
  Widget build(BuildContext context) {
    final deepBlue = const Color(0xFF043A76);
    final brightBlue = const Color(0xFF0EA0FF);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background gradient + dotted texture painter
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [brightBlue, deepBlue],
              ),
            ),
            child: CustomPaint(
              painter: _DottedPainter(),
              child: const SizedBox.expand(),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Back arrow
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                // Illustration
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Image.asset(
                        'assets/icons/language.png',
                        width: 80,
                        height: 80,
                      ),

                      const SizedBox(height: 24),

                      // Heading
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          'Choose your preferred language',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Text(
                          'You can change this anytime from settings.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom rounded card area
                _buildBottomCard(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 251, 255),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 22,
            spreadRadius: 2,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 2x2 language grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.8,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(_languages.length, (i) {
              final lang = _languages[i];
              final selected = _selected == i;
              return GestureDetector(
                onTap: () => setState(() => _selected = i),
                child: Container(
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selected ? const Color(0xFF0058AA) : const Color(0xFF8092A2),
                      width: selected ? 2 : 1.6,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        lang['symbol'] as String,
                        style: TextStyle(
                          color: selected ? const Color(0xFF0058AA) : const Color(0xFF8092A2),
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // const SizedBox(height: 2),
                      Text(
                        lang['name'] as String,
                        style: TextStyle(
                          color: selected ? const Color(0xFF0058AA) : const Color(0xFF8092A2),
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 60),

          // OK button
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SayhloScreen()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFF004280)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              ),
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DottedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.06);
    final spacing = 12.0;
    final radius = 1.6;
    // Only draw dots on the top half with a subtle fade toward bottom
    final height = size.height * 0.35;
    for (double y = 20; y < height; y += spacing) {
      for (double x = 20; x < size.width - 20; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
