// import 'package:flutter/material.dart';
//
// class DreamRecordPage extends StatelessWidget {
//   const DreamRecordPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("취소", style: TextStyle(color: Colors.white, fontSize: 18)),
//                   const Text("종료", style: TextStyle(color: Colors.blue, fontSize: 18)),
//                 ],
//               ),
//             ),
//             const Column(
//               children: [
//                 Text(
//                   "음성 인식 중",
//                   style: TextStyle(color: Colors.white38, fontSize: 22),
//                 ),
//                 SizedBox(height: 16),
//                 Icon(Icons.graphic_eq, color: Colors.greenAccent, size: 64),
//                 SizedBox(height: 16),
//                 Text(
//                   "00:01",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ],
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 40.0),
//               child: Column(
//                 children: [
//                   Text(
//                     "당신의 꿈을 우리에게 말해주세요.",
//                     style: TextStyle(color: Colors.white38),
//                   ),
//                   SizedBox(height: 16),
//                   Icon(Icons.pause, size: 36, color: Colors.white),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// -------------------------------------------------------------------
// import 'dart:async';
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
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..repeat();
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
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
//             // 음성 인식 상태 표시
//             Text(
//               '음성 인식 중',
//               style: const TextStyle(color: Colors.white, fontSize: 24),
//             ),
//             const SizedBox(height: 20),
//
//             // 파형 애니메이션
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Container(
//                   width: double.infinity,
//                   height: 100,
//                   color: Colors.black,
//                   child: CustomPaint(
//                     painter: WaveformPainter(animationValue: _animation.value),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 30),
//             // 타이머 및 기타 UI 요소
//             Text(
//               '00:01',
//               style: const TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // 녹음 시작/종료 로직
//               },
//               child: const Text('종료'),
//             ),
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
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class DreamRecordPage extends StatefulWidget {
  const DreamRecordPage({super.key});

  @override
  State<DreamRecordPage> createState() => _DreamRecordPageState();
}

class _DreamRecordPageState extends State<DreamRecordPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _seconds = 0;
  Timer? _timer;

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
      setState(() {
        _seconds++;
      });
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 상단: 취소 / 종료 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // 취소 로직
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 종료 로직
                    },
                    child: const Text(
                      '종료',
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),

            // 음성 인식 중 / 타이머
            const SizedBox(height: 85),
            Text(
              '음성 인식 중',
              style: const TextStyle(color: Colors.grey, fontSize: 30),
            ),
            const SizedBox(height: 40),
            const Icon(Icons.graphic_eq, size: 60, color: Colors.greenAccent),
            const SizedBox(height: 32),
            Text(
              _formatTime(_seconds),
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 200),

            // 꿈 안내 텍스트
            const Text(
              '당신의 꿈을 우리에게 말해주세요.',
              style: TextStyle(color: Colors.grey),
            ),
            const Spacer(),

            // 일시정지 / 녹음 시작 버튼
            IconButton(
              icon: Icon(
                Icons.pause, // 예시: 일시 정지 아이콘
                color: Colors.white,
                size: 60,
              ),
              onPressed: () {
                // 녹음 상태 전환 로직
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final double animationValue;

  WaveformPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final width = size.width;
    final height = size.height;
    final waveCount = 10;
    final waveWidth = width / waveCount;

    for (int i = 0; i < waveCount; i++) {
      final x = i * waveWidth;
      final amplitude = (animationValue * height * 0.4).abs(); // 파형 진폭
      final y1 = height / 2 - amplitude;
      final y2 = height / 2 + amplitude;

      canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 애니메이션 값이 바뀔 때마다 다시 그리기
  }
}

