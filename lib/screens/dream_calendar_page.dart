import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DreamCalendarPage extends StatefulWidget {
  const DreamCalendarPage({super.key});

  @override
  State<DreamCalendarPage> createState() => _DreamCalendarPageState();
}

class _DreamCalendarPageState extends State<DreamCalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, String> _dummyDreams = {
    DateTime.utc(2022, 6, 6):
    "이집트에 갔는데 군인들이 보였어. 탱크도 보였어. 여기서 전쟁이 일어나는건가? 피라미드에 눈이 잔뜩 쌓여있었어. 이게 꿈인가? 아까 엄마..."
  };

  @override
  Widget build(BuildContext context) {
    final selectedText = _selectedDay != null && _dummyDreams[_selectedDay!] != null
        ? _dummyDreams[_selectedDay!]
        : "해당 날짜의 꿈 기록이 없습니다.";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "꿈 달력",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              TableCalendar(
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
              if (_selectedDay != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd('en_US').format(_selectedDay!),
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        selectedText!,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
