import 'package:flutter/material.dart';

class DreamTextEditPage extends StatefulWidget {
  final String transcript; // 하드코딩된 텍스트를 받는 부분

  const DreamTextEditPage({super.key, required this.transcript});

  @override
  _DreamTextEditPageState createState() => _DreamTextEditPageState();
}

class _DreamTextEditPageState extends State<DreamTextEditPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.transcript);  // 텍스트 필드에 전달된 텍스트 세팅
  }

  // 수정된 텍스트 저장 함수
  void saveEditedText() {
    String editedText = _controller.text;
    print("저장된 텍스트: $editedText");
    // 여기서 백엔드에 저장하는 코드 또는 다른 로직을 추가할 수 있습니다.
    Navigator.pop(context);  // 저장 후 이전 화면으로 돌아가기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,  // 앱바 배경색 검정
        title: const Text('텍스트 수정', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "변환된 텍스트를 수정해 주세요",
              style: TextStyle(color: Colors.white),  // 텍스트 색상 흰색
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,  // 수정된 텍스트 입력 필드
              maxLines: 8,
              style: const TextStyle(color: Colors.white),  // 입력된 텍스트 색상 흰색
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[900],  // 입력 필드 배경 어두운 색
                hintText: '텍스트를 입력하세요',
                hintStyle: const TextStyle(color: Colors.grey),  // 힌트 텍스트 색상
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: saveEditedText,  // 임시 저장
                  child: const Text("임시 저장"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // 웹툰 만들기 버튼 (추후 구현)
                    print("웹툰 만들기 버튼 클릭");
                  },
                  child: const Text("웹툰 만들기"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
