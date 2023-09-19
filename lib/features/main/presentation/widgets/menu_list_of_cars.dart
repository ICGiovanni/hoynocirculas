import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/home_tab_screen.dart';

class MenuListOfCarsHomeTab extends ConsumerWidget {
  const MenuListOfCarsHomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(listIsOpenExpansionPanel);

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          elevation: 0,
          children: [
            ExpansionPanel(
              canTapOnHeader: true,
              backgroundColor: Colors.grey[200],
              headerBuilder: (context, isExpanded) {
                return const Center(
                  child: Text('Toyota Aqua',
                      style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 17,
                      )),
                );
              },
              body: const Column(
                children: [
                  AddVehicle(),
                ],
              ),
              isExpanded: isOpen[0],
            ),
            ExpansionPanel(
              canTapOnHeader: true,
              backgroundColor: Colors.grey[200],
              headerBuilder: (context, isExpanded) {
                return const Center(
                  child: Text('Mazda CX5',
                      style: TextStyle(
                        fontFamily: 'QuicksandBold',
                        fontSize: 17,
                      )),
                );
              },
              body: const Column(
                children: [
                  AddVehicle(),
                ],
              ),
              isExpanded: isOpen[1],
            ),
          ],
          expandIconColor: Theme.of(context).primaryColor,
          expansionCallback: (panelIndex, isExpanded) {
            ref.read(listIsOpenExpansionPanel.notifier).update((state) {
              final newList = List.of(ref.read(listIsOpenExpansionPanel));
              newList[panelIndex] = !isExpanded;
              return newList;
            });
          },
        ),
      ),
    );
  }
}
