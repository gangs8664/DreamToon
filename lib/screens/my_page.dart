import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                "마이페이지",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              _MyPageItem(title: "꿈 기록 조회", icon: Icons.search),
              const Divider(color: Colors.grey),
              _MyPageItem(title: "환경설정", icon: Icons.settings),
              const Divider(color: Colors.grey),
              _MyPageItem(title: "개인정보보호정책", icon: Icons.privacy_tip),
              const Divider(color: Colors.grey),
              _MyPageItem(title: "이용약관", icon: Icons.description),
              const Divider(color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyPageItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _MyPageItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
      onTap: () {},
    );
  }
}
