// import 'dart:async';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
//
// class DreamRecordPage extends StatefulWidget {
//   const DreamRecordPage({super.key});
//
//   @override
//   State<DreamRecordPage> createState() => _DreamRecordPageState();
// }
//
// class _DreamRecordPageState extends State<DreamRecordPage> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   int _seconds = 0;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..repeat();
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       setState(() {
//         _seconds++;
//       });
//     });
//   }
//
//   String _formatTime(int seconds) {
//     final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
//     final secs = (seconds % 60).toString().padLeft(2, '0');
//     return "$minutes:$secs";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       // 취소 로직 (예시로 텍스트 수정 화면으로 이동)
//                     },
//                     child: const Text(
//                       '취소',
//                       style: TextStyle(color: Colors.white, fontSize: 22),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // 종료 로직: 텍스트 수정 화면으로 이동
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => DreamTextEditPage(
//                             transcript: "하드코딩된 텍스트 예시", // 하드코딩된 텍스트 전달
//                             sttId: 123, // 예시 ID
//                           ),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       '종료',
//                       style: TextStyle(color: Colors.blue, fontSize: 22),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 85),
//             Text(
//               '음성 인식 중',
//               style: const TextStyle(color: Colors.white, fontSize: 30),
//             ),
//             const SizedBox(height: 40),
//             const Icon(Icons.graphic_eq, size: 60, color: Colors.greenAccent),
//             const SizedBox(height: 32),
//             Text(
//               _formatTime(_seconds),
//               style: const TextStyle(color: Colors.white, fontSize: 24),
//             ),
//             const SizedBox(height: 200),
//
//             const Text(
//               '당신의 꿈을 우리에게 말해주세요.',
//               style: TextStyle(color: Colors.white),
//             ),
//
//             const Spacer(),
//
//             // 녹음 정지 버튼 (일시정지 상태일 때는 계속 유지)
//             IconButton(
//               icon: Icon(
//                 Icons.pause, // 일시 정지 아이콘
//                 color: Colors.white,
//                 size: 60,
//               ),
//               onPressed: () {
//                 // 녹음 상태 전환 로직
//               },
//             ),
//             const SizedBox(height: 60),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DreamTextEditPage extends StatelessWidget {
//   final String transcript;
//   final int sttId;
//
//   const DreamTextEditPage({super.key, required this.transcript, required this.sttId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: const Text('텍스트 수정', style: TextStyle(color: Colors.white)),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//               "변환된 텍스트를 수정해 주세요",
//               style: TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: TextEditingController(text: transcript),
//               maxLines: 8,
//               decoration: const InputDecoration(border: OutlineInputBorder()),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // 임시 저장 또는 웹툰 생성 요청 추가 가능
//               },
//               child: const Text("임시 저장"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// -----------------------------------------------------------------------
// import 'dart:async';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
//
// class DreamRecordPage extends StatefulWidget {
//   const DreamRecordPage({super.key});
//
//   @override
//   State<DreamRecordPage> createState() => _DreamRecordPageState();
// }
//
// class _DreamRecordPageState extends State<DreamRecordPage> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   int _seconds = 0;
//   Timer? _timer;
//   bool _isPaused = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..repeat();
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//     _startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       if (!_isPaused) {
//         setState(() {
//           _seconds++;
//         });
//       }
//     });
//   }
//
//   void _pauseRecording() {
//     setState(() {
//       _isPaused = true;
//     });
//   }
//
//   void _resumeRecording() {
//     setState(() {
//       _isPaused = false;
//     });
//   }
//
//   String _formatTime(int seconds) {
//     final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
//     final secs = (seconds % 60).toString().padLeft(2, '0');
//     return "$minutes:$secs";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       // 취소 로직
//                     },
//                     child: const Text(
//                       '취소',
//                       style: TextStyle(color: Colors.white, fontSize: 22),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // 종료 로직
//                     },
//                     child: const Text(
//                       '종료',
//                       style: TextStyle(color: Colors.blue, fontSize: 22),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 85),
//             Text(
//               _isPaused ? '일시정지 중' : '음성 인식 중',
//               style: const TextStyle(color: Colors.white, fontSize: 30),
//             ),
//             const SizedBox(height: 40),
//             const Icon(Icons.graphic_eq, size: 60, color: Colors.greenAccent),
//             const SizedBox(height: 32),
//             Text(
//               _formatTime(_seconds),
//               style: const TextStyle(color: Colors.white, fontSize: 24),
//             ),
//             const SizedBox(height: 200),
//             const Text(
//               '당신의 꿈을 우리에게 말해주세요.',
//               style: TextStyle(color: Colors.white),
//             ),
//             const Spacer(),
//             // 정지 및 재개 버튼 (일시정지 상태일 때만 보임)
//             IconButton(
//               icon: Icon(
//                 _isPaused ? Icons.play_arrow : Icons.pause,
//                 color: Colors.white,
//                 size: 60,
//               ),
//               onPressed: _isPaused ? _resumeRecording : _pauseRecording,
//             ),
//             const SizedBox(height: 60),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class WaveformPainter extends CustomPainter {
//   final double animationValue;
//
//   WaveformPainter({required this.animationValue});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.greenAccent
//       ..strokeWidth = 3
//       ..strokeCap = StrokeCap.round;
//
//     final width = size.width;
//     final height = size.height;
//     final waveCount = 10;
//     final waveWidth = width / waveCount;
//
//     for (int i = 0; i < waveCount; i++) {
//       final x = i * waveWidth;
//       final amplitude = (animationValue * height * 0.4).abs(); // 파형 진폭
//       final y1 = height / 2 - amplitude;
//       final y2 = height / 2 + amplitude;
//
//       canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true; // 애니메이션 값이 바뀔 때마다 다시 그리기
//   }
// }
// -------------------------------------------------------
import 'dart:async';
import 'package:flutter/material.dart';
import 'dream_text_edit_page.dart';

class DreamRecordPage extends StatefulWidget {
  const DreamRecordPage({super.key});

  @override
  State<DreamRecordPage> createState() => _DreamRecordPageState();
}

class _DreamRecordPageState extends State<DreamRecordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _seconds = 0;
  Timer? _timer;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!_isPaused) {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void _pauseRecording() {
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeRecording() {
    setState(() {
      _isPaused = false;
    });
  }

  void _endRecording() {
    // 종료 → 텍스트 수정 화면으로 이동 (하드코딩)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DreamTextEditPage(
          transcript: '하드코딩된 꿈 내용입니다.',
          sttId: 999,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // 상단 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("취소", style: TextStyle(color: Colors.white, fontSize: 18)),
                  GestureDetector(
                    onTap: _endRecording,
                    child: const Text("종료", style: TextStyle(color: Colors.blue, fontSize: 18)),
                  )
                ],
              ),
            ),

            const SizedBox(height: 70),
            const Text("음성 인식 중", style: TextStyle(color: Colors.white38, fontSize: 22)),
            const SizedBox(height: 16),
            const Icon(Icons.graphic_eq, color: Colors.greenAccent, size: 64),
            const SizedBox(height: 16),
            Text(
              _formatTime(_seconds),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Spacer(),

            const Text("당신의 꿈을 우리에게 말해주세요.", style: TextStyle(color: Colors.white38)),
            const SizedBox(height: 16),

            _isPaused
                ? IconButton(
              onPressed: _resumeRecording,
              icon: const Icon(Icons.play_arrow, size: 36, color: Colors.white),
            )
                : IconButton(
              onPressed: _pauseRecording,
              icon: const Icon(Icons.pause, size: 36, color: Colors.white),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}



