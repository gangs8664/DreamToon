import 'package:flutter/material.dart';

class DreamMainPage extends StatelessWidget {
  final String nickname; // ← 사용자 닉네임

  const DreamMainPage({super.key, required this.nickname});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // 🔹 닉네임 + 검색 아이콘
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$nickname님",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // 🔹 질문 문구
              const Text(
                "오늘도 함께\n꿈을 기록해볼까요?",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 24),
              // 🔹 2개의 이미지 카드 (GridView)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2.2,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/record');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/dream_record.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          "꿈 기록하기",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/calendar');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/dream_calendar.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          "꿈 캘린더",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
