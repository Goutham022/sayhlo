import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ChatSessionScreen extends StatefulWidget {
  const ChatSessionScreen({super.key});

  @override
  State<ChatSessionScreen> createState() => _ChatSessionScreenState();
}

class _ChatSessionScreenState extends State<ChatSessionScreen> {
  final List<_Message> _messages = [
    _Message(text: 'Is there any way to check if the battery was replaced?', incoming: true, time: '12:30pm'),
    _Message(text: 'Yes, you can check battery health in Settings and also verify via serial number.', incoming: false, time: '12:40pm'),
  ];
  final TextEditingController _controller = TextEditingController();

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_Message(text: text, incoming: false, time: 'Now'));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: AppBar(
        backgroundColor: primaryBlueColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Chat Session', style: TextStyle(fontFamily: 'Inter', fontSize: 14)),
            SizedBox(height: 2),
            Text('Rajesh Kumar', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 18)),
          ],
        ),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Time Remaining', style: TextStyle(fontFamily: 'Inter', fontSize: 12)),
                SizedBox(height: 4),
                Row(children: [Icon(Icons.timer, size: 18), SizedBox(width: 6), Text('2:00')])
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final m = _messages[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: m.incoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: m.incoming ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          if (m.incoming) ...[
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: primaryBlueColor,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(18),
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18),
                                  ),
                                ),
                                child: Text(m.text, style: const TextStyle(color: whiteColor)),
                              ),
                            ),
                          ] else ...[
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(color: primaryBlueColor),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(18),
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18),
                                  ),
                                ),
                                child: Text(m.text, style: const TextStyle(color: primaryBlueColor)),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.only(
                          left: m.incoming ? 8 : 0,
                          right: m.incoming ? 0 : 8,
                        ),
                        child: Text(
                          m.time,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: textSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Footer actions
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: whiteColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(onPressed: () {}, icon: const Icon(Icons.edit_outlined), label: const Text('Write Notes')),
                    TextButton(onPressed: () {}, child: const Text('End Session', style: TextStyle(color: Colors.red))),
                  ],
                ),

                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.mic_none)),
                    Expanded(
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGreyColor)),
                        child: Row(children: [
                          Expanded(child: TextField(controller: _controller, decoration: const InputDecoration.collapsed(hintText: 'Type here......'))),
                          IconButton(onPressed: _send, icon: const Icon(Icons.send, color: primaryBlueColor, size: 20)),
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool incoming;
  final String time;
  _Message({required this.text, required this.incoming, required this.time});
}
