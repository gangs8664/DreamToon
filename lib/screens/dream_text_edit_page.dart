// import 'package:flutter/material.dart';
//
// class DreamTextEditPage extends StatefulWidget {
//   final String transcript;
//   final int sttId;
//
//   const DreamTextEditPage({super.key, required this.transcript, required this.sttId,});
//
//   @override
//   State<DreamTextEditPage> createState() => _DreamTextEditPageState();
// }
//
// class _DreamTextEditPageState extends State<DreamTextEditPage> {
//   late TextEditingController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController(text: widget.transcript);
//   }
//
//   void _showCustomDialog(String message) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         backgroundColor: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 message,
//                 style: const TextStyle(fontSize: 16, color: Colors.black87),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF3F51B5),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   child: const Text(
//                     "확인",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       // appBar: AppBar(
//       //   backgroundColor: Colors.black,
//       //   centerTitle: true,
//       //   title: const Text('텍스트 확인', style: TextStyle(color: Colors.white)),
//       //   iconTheme: const IconThemeData(color: Colors.white),
//       // ),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: const Text('텍스트 확인', style: TextStyle(color: Colors.white)),
//         // iconTheme: const IconThemeData(color: Colors.white),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.home, color: Colors.white),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 barrierDismissible: false,
//                 builder: (BuildContext dialogContext) {
//                   return AlertDialog(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     content: const Text(
//                       "더 이상 진행하지 않고 홈으로 이동하시겠습니까?\n임시 데이터는 삭제됩니다.",
//                       style: TextStyle(color: Colors.black87, fontSize: 15),
//                       textAlign: TextAlign.center,
//                     ),
//                     actionsAlignment: MainAxisAlignment.spaceEvenly,
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(dialogContext),
//                         child: const Text("취소", style: TextStyle(color: Colors.deepPurple)),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(dialogContext); // 알림창 닫기
//                           Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false); // 홈으로 이동
//                         },
//                         child: const Text("홈으로 이동", style: TextStyle(color: Colors.deepPurple)),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//               "변환된 텍스트를 확인해 주세요",
//               style: TextStyle(color: Colors.white70, fontSize: 16),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: controller,
//               maxLines: 8,
//               style: const TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 hintText: '텍스트를 입력하세요',
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 filled: true,
//                 fillColor: Colors.grey[900],
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white24),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     _showCustomDialog("텍스트가 수정되었습니다");
//                   },
//                   icon: const Icon(Icons.save_alt, color: Colors.deepPurple),
//                   label: const Text("텍스트 수정", style: TextStyle(color: Colors.deepPurple)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     _showCustomDialog("웹툰 생성이 시작됩니다. 잠시만 기다려주세요.");
//                   },
//                   icon: const Icon(Icons.auto_stories, color: Colors.deepPurple),
//                   label: const Text("웹툰 만들기", style: TextStyle(color: Colors.deepPurple)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // ---------------------------------------------------------------
import 'package:flutter/material.dart';
import 'webtoon_result_page.dart';

class DreamTextEditPage extends StatefulWidget {
  final String transcript;
  final int sttId;

  const DreamTextEditPage({
    super.key,
    required this.transcript,
    required this.sttId,
  });

  @override
  State<DreamTextEditPage> createState() => _DreamTextEditPageState();
}

class _DreamTextEditPageState extends State<DreamTextEditPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.transcript);
  }

  void _showCustomDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F51B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "확인",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHomeDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "홈으로 이동하시겠습니까?",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                    ),
                    child: const Text("취소", style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3F51B5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                    ),
                    child: const Text("홈으로 이동", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startWebtoonCreation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "웹툰 생성이 시작됩니다.\n잠시만 기다려주세요.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pop(context); // 다이얼로그 닫기
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const WebtoonResultPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('텍스트 확인', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: _showHomeDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "변환된 텍스트를 확인해 주세요",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLines: 8,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '텍스트를 입력하세요',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _showCustomDialog("텍스트가 수정되었습니다");
                  },
                  icon: const Icon(Icons.save_alt, color: Colors.deepPurple),
                  label: const Text("텍스트 수정", style: TextStyle(color: Colors.deepPurple)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _startWebtoonCreation,
                  icon: const Icon(Icons.auto_stories, color: Colors.deepPurple),
                  label: const Text("웹툰 만들기", style: TextStyle(color: Colors.deepPurple)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
