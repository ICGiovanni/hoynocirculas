import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';

import '../screens/home_tab_screen.dart';

class MyCarsList extends ConsumerWidget {
  const MyCarsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData iconRight = Icons.arrow_right_outlined;
    IconData iconDown = Icons.arrow_drop_down_outlined;

    final myCars = ref.watch(myCarsProvider);
    final flag = ref.watch(flagCarsProvider);
    final heightItem = ref.watch(heightItemCarsProvider);
    final heightContainer = ref.watch(heightContainerCarsProvider);
    final selectedCarIndex = ref.watch(selectedCarIndexProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: flag ? heightItem : heightContainer,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(flagCarsProvider.notifier).state = !flag;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: flag
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      myCars[selectedCarIndex],
                      style: const TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 17,
                      ),
                    ),
                    Icon(
                      flag ? iconRight : iconDown,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
              if (!flag) const Divider(),
              if (!flag)
                ListView.builder(
                  itemCount: myCars.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (index == selectedCarIndex) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref.read(flagCarsProvider.notifier).state = !flag;
                            ref.read(selectedCarIndexProvider.notifier).state =
                                index;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: flag
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                myCars[index],
                                style: const TextStyle(
                                  fontFamily: 'QuicksandBold',
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              if (!flag) const AddVehicle(),
            ],
          ),
        ),
      ),
    );
  }
}
