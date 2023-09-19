import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

final today = DateUtils.dateOnly(DateTime.now());
const List<String> weekdayLabels = [
  'Dom',
  'Lun',
  'Mar',
  'Mié',
  'Jue',
  'Vie',
  'Sáb',
];

class CalendarHomeTabScreen extends StatefulWidget {
  const CalendarHomeTabScreen({super.key});

  @override
  State<CalendarHomeTabScreen> createState() => _CalendarHomeTabScreenState();
}

class _CalendarHomeTabScreenState extends State<CalendarHomeTabScreen> {
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 7),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 21),
    DateTime(today.year, today.month, 28),
    DateTime(today.year, today.month, 2),
    DateTime(today.year, today.month, 3),
    DateTime(today.year, today.month, 16),
    DateTime(today.year, today.month, 17),
  ];

  final config = CalendarDatePicker2Config(
    firstDayOfWeek: 1,
    weekdayLabels: weekdayLabels,
    weekdayLabelTextStyle: const TextStyle(
      fontFamily: 'QuicksandBold',
      fontSize: 15,
    ),
    calendarType: CalendarDatePicker2Type.multi,
    selectedDayHighlightColor: Colors.red,
    dayBorderRadius: BorderRadius.circular(5),
    todayTextStyle: const TextStyle(
      backgroundColor: Colors.white,
      color: Colors.black,
      fontSize: 20,
    ),
    dayBuilder: ({
      required date,
      decoration,
      isDisabled,
      isSelected,
      isToday,
      textStyle,
    }) {
      final DateTime fecha = DateTime.parse(date.toString());

      int day = fecha.day;
      int month = fecha.month;
      int year = fecha.year;

      String compareDate = "$day-$month-$year";

      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          color: isToday!
              ? Colors.white
              : isSelected!
                  ? Colors.red
                  : compareDate == "6-9-2023"
                      ? const Color.fromARGB(255, 255, 121, 18)
                      : Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
          boxShadow: isToday
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3.0,
                    spreadRadius: 2.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ]
              : null,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Center(
            child: Text(
              day.toString(),
              style: TextStyle(
                  color: isSelected!
                      ? Colors.white
                      : compareDate == "6-9-2023"
                          ? Colors.white
                          : Colors.black,
                  fontFamily: 'QuicksandBold'),
            ),
          ),
        ),
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const MyCarsList(),
          const SizedBox(height: 20),
          const InfoLengend(),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: CalendarDatePicker2(
              config: config,
              value: _multiDatePickerValueWithDefaultValue,
              onValueChanged: (dates) =>
                  setState(() => _multiDatePickerValueWithDefaultValue = dates),
            ),
          )
        ],
      ),
    );
  }
}

class InfoLengend extends StatelessWidget {
  const InfoLengend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Hoy',
                      style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'No circulas',
                      style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Multa',
                      style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 2.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      """Periodo para
verificar""",
                      style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
