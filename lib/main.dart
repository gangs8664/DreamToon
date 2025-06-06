import 'package:flutter/material.dart';
import 'screens/main_scaffold.dart';
import 'screens/dream_record_page.dart';
import 'screens/dream_calendar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamToon',
      home: const MainScaffold(), // ✅ 메인 스카폴드 연결
      routes: {
        '/record': (context) => const DreamRecordPage(),
        '/calendar': (context) => const DreamCalendarPage(),
      },
    );
  }
}
