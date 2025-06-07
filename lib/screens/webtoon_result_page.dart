import 'package:flutter/material.dart';

class WebtoonResultPage extends StatelessWidget {
  const WebtoonResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          '생성된 그림 확인',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const Text(
              '당신의 꿈을 확인하세요',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),

            /// ✅ 2x2 그림
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(4, (index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent),
                  ),
                  child: Image.network(
                    'https://via.placeholder.com/300x300.png?text=${index + 1}',
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            /// ✅ 아래 텍스트 or 선택 영역 (드롭다운 대체)
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 16),

            /// ✅ 다시 수정하기 버튼
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
              child: const Text(
                '다시 수정하기',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
            const Spacer(),

            /// ✅ 하단 버튼 3개
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.download, color: Colors.white),
                Icon(Icons.check_circle, color: Colors.white),
                Icon(Icons.share, color: Colors.white),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
