
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DreamMainPage extends StatefulWidget {
//   final String nickname;

//   const DreamMainPage({super.key, required this.nickname});

//   @override
//   State<DreamMainPage> createState() => _DreamMainPageState();
// }

// class _DreamMainPageState extends State<DreamMainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.black,
//         statusBarIconBrightness: Brightness.light,
//         statusBarBrightness: Brightness.dark,
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Padding(
//           padding: const EdgeInsets.fromLTRB(16, 48, 16, 0), // 상단 safe 영역 확보
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🔹 닉네임 + 검색 아이콘
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${widget.nickname}님",
//                     style: const TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.search, color: Colors.white, size: 30,),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),

//               // 🔹 인사 문구
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "오늘도 함께",
//                       style: TextStyle(fontSize: 34, color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       "꿈을 기록해볼까요?",
//                       style: TextStyle(fontSize: 34, fontWeight: FontWeight.normal, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               // 🔹 이미지 카드 2개
//               SizedBox(
//                 height: 180,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pushNamed(context, '/record'),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage('assets/images/dream_record.png'),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     alignment: Alignment.bottomRight,
//                     padding: const EdgeInsets.all(12),
//                     child: const Text(
//                       "꿈 기록하기",
//                       style: TextStyle(fontSize: 27, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 180,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pushNamed(context, '/calendar'),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage('assets/images/dream_calendar.png'),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     alignment: Alignment.bottomRight,
//                     padding: const EdgeInsets.all(12),
//                     child: const Text(
//                       "꿈 캘린더",
//                       style: TextStyle(fontSize: 30, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 180,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pushNamed(context, '/calendar'),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage('assets/images/dream_calendar.png'),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     alignment: Alignment.bottomRight,
//                     padding: const EdgeInsets.all(12),
//                     child: const Text(
//                       "꿈 캘린더",
//                       style: TextStyle(fontSize: 30, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ----------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DreamMainPage extends StatefulWidget {
  final String nickname;

  const DreamMainPage({super.key, required this.nickname});

  @override
  State<DreamMainPage> createState() => _DreamMainPageState();
}

class _DreamMainPageState extends State<DreamMainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.nickname}님",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "오늘도 함께",
                        style: TextStyle(fontSize: 34, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "꿈을 기록해볼까요?",
                        style: TextStyle(fontSize: 34, fontWeight: FontWeight.normal, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildCard(
                  onTap: () => Navigator.pushNamed(context, '/record'),
                  imagePath: 'assets/images/dream_record.png',
                  label: "꿈 기록하기",
                ),
                const SizedBox(height: 20),
                _buildCard(
                  onTap: () => Navigator.pushNamed(context, '/calendar'),
                  imagePath: 'assets/images/dream_calendar.png',
                  label: "꿈 캘린더",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required VoidCallback onTap, required String imagePath, required String label}) {
    return SizedBox(
      height: 180,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.all(12),
          child: Text(
            label,
            style: const TextStyle(fontSize: 27, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
