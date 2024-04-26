import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../helpers/helpers.dart';
import 'custom_text.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key, required this.eventsList});

  final Map<DateTime, List> eventsList;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _focusedDay;
//late DateTime _selectedDay;
  //Map<DateTime, List> _eventsList = {};

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
// _selectedDay = DateTime.now();
    _firstDay = DateTime.utc(2024, 1, 1);
    _lastDay = DateTime.utc(2024, 12, 31);
    // _eventsList = {
    //   DateTime(2024, 4, 5): ['Evento 1'],
    //   DateTime(2024, 4, 12): ['Evento 2'],
    //   DateTime(2024, 4, 15): ['Evento 3'],
    //   DateTime(2024, 4, 17): ['Evento 4']
    // };
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(widget.eventsList);

    List getEventForDay(DateTime day) {
      return events[day] ?? [];
    }

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(43, 60, 79, 1),
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: 'Agenda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 0.12,
          ),
          TableCalendar(
            locale: 'pt_BR',
            daysOfWeekHeight: 20,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white),
              weekendStyle: TextStyle(color: Colors.white),
            ),
            headerStyle: HeaderStyle(
              titleCentered: true,
              titleTextStyle: const TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              titleTextFormatter: (date, locale) =>
                  Helpers.monthsName[date.month]!,
              formatButtonVisible: false,
              leftChevronIcon:
                  const Icon(Icons.chevron_left, color: Colors.white),
              rightChevronIcon:
                  const Icon(Icons.chevron_right, color: Colors.white),
            ),
            calendarStyle: const CalendarStyle(
              markersAlignment: Alignment.topCenter,
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white),
              markerDecoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              todayDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 9, 14), shape: BoxShape.circle),
            ),
            focusedDay: _focusedDay,
            firstDay: _firstDay,
            lastDay: _lastDay,
            eventLoader: getEventForDay,
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                // _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            //  selectedDayPredicate: (day) {
            //   return isSameDay(_selectedDay, day);
            // },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
          ),
        ],
      ),
    );
  }
}
