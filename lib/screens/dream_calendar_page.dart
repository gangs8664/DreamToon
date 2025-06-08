// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

// class DreamCalendarPage extends StatefulWidget {
//   const DreamCalendarPage({super.key});

//   @override
//   State<DreamCalendarPage> createState() => _DreamCalendarPageState();
// }

// class _DreamCalendarPageState extends State<DreamCalendarPage> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   final Map<DateTime, String> _dummyDreams = {
//     DateTime.utc(2025, 6, 9):
//     "이집트에 갔는데 군인들이 보였어. 탱크도 보였어. 여기서 전쟁이 일어나는건가? 피라미드에 눈이 잔뜩 쌓여있었어. 이게 꿈인가? 아까 엄마..."
//   };

//   @override
//   Widget build(BuildContext context) {
//     final selectedText = _selectedDay != null && _dummyDreams[_selectedDay!] != null
//         ? _dummyDreams[_selectedDay!]
//         : "해당 날짜의 꿈 기록이 없습니다.";

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               const Center(
//                 child: Text(
//                   "꿈 캘린더",
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TableCalendar(
//                 firstDay: DateTime.utc(2020, 1, 1),
//                 lastDay: DateTime.utc(2030, 12, 31),
//                 focusedDay: _focusedDay,
//                 calendarFormat: CalendarFormat.month,
//                 selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                 onDaySelected: (selectedDay, focusedDay) {
//                   setState(() {
//                     _selectedDay = selectedDay;
//                     _focusedDay = focusedDay;
//                   });
//                 },
//                 calendarStyle: const CalendarStyle(
//                   todayDecoration: BoxDecoration(
//                     color: Colors.redAccent,
//                     shape: BoxShape.circle,
//                   ),
//                   selectedDecoration: BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.circle,
//                   ),
//                   defaultTextStyle: TextStyle(color: Colors.white),
//                   weekendTextStyle: TextStyle(color: Colors.white70),
//                 ),
//                 headerStyle: const HeaderStyle(
//                   formatButtonVisible: false,
//                   titleCentered: true,
//                   titleTextStyle: TextStyle(color: Colors.white),
//                   leftChevronIcon: Icon(Icons.chevron_left, color: Colors.red),
//                   rightChevronIcon: Icon(Icons.chevron_right, color: Colors.red),
//                 ),
//                 daysOfWeekStyle: const DaysOfWeekStyle(
//                   weekdayStyle: TextStyle(color: Colors.grey),
//                   weekendStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               if (_selectedDay != null)
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF1E1E1E),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         DateFormat.yMMMMd('en_US').format(_selectedDay!),
//                         style: const TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         selectedText!,
//                         style: const TextStyle(color: Colors.white, fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ---------------------------------------------
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DreamCalendarPage extends StatefulWidget {
  const DreamCalendarPage({super.key});

  @override
  State<DreamCalendarPage> createState() => _DreamCalendarPageState();
}

class _DreamCalendarPageState extends State<DreamCalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<String>> _dummyDreams = {
    DateTime.utc(2025, 6, 9): [
      "밤새 어두운 골목길을 혼자 걷고 있었어. 그런데 갑자기 뒤에서 누군가 따라온다는 느낌이 들었어. 낯선 남자였고 무서워서 도망치려 했지. 그런데 가까이 다가오니까 알고 보니 내 친구였어.",
      "좀비가 나를 당장이라도 잡아먹을 것처럼 쫓아왔어. 나는 겁에 질려서 도망치려고 했지만 온몸이 굳어서 움직이지 못했고, 결국 좀비에게 잡혔지. 잡히니까 꿈에서 깼다? 근데 우리집 강아지가 내 위에 올라와 있었어."
    ],
    DateTime.utc(2025, 6, 8): [
      "이집트에 갔는데 군인들이 보였어. 탱크도 보였어. 여기서 전쟁이 일어나는 건가? 피라미드에 눈이 잔뜩 쌓여 있었어. 이게 꿈인가?"
    ],
  };

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko_KR', null);
  }

  @override
  Widget build(BuildContext context) {
    final dreams = _selectedDay != null && _dummyDreams[_selectedDay!] != null
        ? _dummyDreams[_selectedDay!]!
        : [];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단바
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("꿈 캘린더", style: TextStyle(color: Colors.white, fontSize: 24)),
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () => Navigator.pushNamed(context, '/'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 캘린더
              TableCalendar(
                locale: 'ko_KR',
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white70),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: Colors.white),
                  leftChevronIcon: Icon(Icons.chevron_left, color: Colors.red),
                  rightChevronIcon: Icon(Icons.chevron_right, color: Colors.red),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.grey),
                  weekendStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),

              // 꿈 기록 출력
              if (_selectedDay != null)
                Expanded(
                  child: dreams.isNotEmpty
                      ? ListView.separated(
                          itemCount: dreams.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${DateFormat.yMMMMd('ko_KR').format(_selectedDay!)} - 기록 ${index + 1}",
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    dreams[index],
                                    style: const TextStyle(color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : const Text(
                          "해당 날짜의 꿈 기록이 없습니다.",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
