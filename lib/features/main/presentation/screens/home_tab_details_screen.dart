import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

class HomeTabDetailsScreen extends ConsumerStatefulWidget {
  const HomeTabDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  HomeTabDetailsScreenState createState() => HomeTabDetailsScreenState();
}

class HomeTabDetailsScreenState extends ConsumerState<HomeTabDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final hideTableInfo = ref.watch(hideTableInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoy circulas'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/hot_tab_details.jpg',
            ),
            const InfoCalendarHomeTab(
              navigateToCalendar: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('INFORMACION GENERAL'),
                  GestureDetector(
                    onTap: () {
                      ref.read(hideTableInfoProvider.notifier).state =
                          !hideTableInfo;
                    },
                    child: Text(
                      !hideTableInfo ? 'Ocultar' : 'Mostrar',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'QuicksandBold',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: !hideTableInfo ? 1.0 : 0.0,
              curve: Curves.bounceOut,
              child: !hideTableInfo ? const TableInfo() : Container(),
            ),
            const SizedBox(
              height: 10,
            ),
            const MenuDetails(),
          ],
        ),
      ),
    );
  }
}
