import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hoy_no_circulas/features/calendar/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';

class InfoCalendarHomeTab extends StatelessWidget {
  final bool navigateToCalendar;

  const InfoCalendarHomeTab({
    super.key,
    this.navigateToCalendar = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorP = Theme.of(context).primaryColor;
    final double widthContainerCalendar =
        MediaQuery.of(context).size.width * 0.13;

    const TextStyle fontBold = TextStyle(fontFamily: 'QuicksandBold');

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 30,
                            child: Icon(
                              FontAwesomeIcons.car,
                              size: 30,
                              color: Colors.grey[500],
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: -1,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Hoy circulas',
                            style: TextStyle(
                              fontFamily: 'QuicksandBold',
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Manana no!',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            NavigateToPage.navigateToPage(
                                widget: navigateToCalendar
                                    ? const CalendarHomeTabScreen()
                                    : const HomeTabDetailsScreen(),
                                context: context);
                          },
                          child: Text(
                            !navigateToCalendar
                                ? 'Más info >'
                                : 'Ver calendario >',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: colorP, fontFamily: 'QuicksandBold'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        SizedBox(
                          width: widthContainerCalendar,
                          child: const Text('Lun'),
                        ),
                        SizedBox(
                          width: widthContainerCalendar,
                          child: const Text('Mar'),
                        ),
                        SizedBox(
                          width: widthContainerCalendar,
                          child: const Text('Mie'),
                        ),
                        SizedBox(
                          width: widthContainerCalendar,
                          child: const Text('Jue'),
                        ),
                        SizedBox(
                          width: widthContainerCalendar,
                          child: const Text('Vie'),
                        ),
                        SizedBox(
                          width: widthContainerCalendar,
                          child: const Text('Sab'),
                        ),
                        SizedBox(
                          width: widthContainerCalendar,
                          child: const Text('Dom'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    child: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: widthContainerCalendar,
                              child: const Center(
                                child: Text(
                                  '30',
                                  style: fontBold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthContainerCalendar,
                              child: const Center(
                                child: Text(
                                  '31',
                                  style: fontBold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthContainerCalendar,
                              child: const Center(
                                child: Text(
                                  '1',
                                  style: fontBold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthContainerCalendar,
                              child: const Center(
                                child: Text(
                                  '2',
                                  style: fontBold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthContainerCalendar,
                              child: const Card(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Vie',
                                    style: fontBold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthContainerCalendar,
                              child: Card(
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    '4',
                                    style:
                                        fontBold.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: widthContainerCalendar,
                              child: Card(
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    '5',
                                    style:
                                        fontBold.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
