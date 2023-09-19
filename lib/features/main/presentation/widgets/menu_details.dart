import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

class MenuDetails extends ConsumerWidget {
  const MenuDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(listIsOpenExpansionDetails);
    return ExpansionPanelList(
      elevation: 0,
      children: [
        infoTabExpansion(
          isOpen: isOpen[0],
          context: context,
          title: 'Básicos del hoy No Circula',
          body: const Text("""
El hoy no circula es un protocolo que prohibe ciertos coches circular ciertos días de la semana, su principal razón es ayudar a mejorar la calidad del aire y hacer de el DF y alrededores un lugar más ecológico."""),
          to: Container(),
        ),
        infoTabExpansion(
          isOpen: isOpen[1],
          context: context,
          title: 'Vehículos Foráneos',
          body: const Text("""
El hoy no circula es un protocolo que prohibe ciertos coches circular ciertos días de la semana, su principal razón es ayudar a mejorar la calidad del aire y hacer de el DF y alrededores un lugar más ecológico."""),
          to: Container(),
        ),
        infoTabExpansion(
          isOpen: isOpen[2],
          context: context,
          title: 'Vehículos Eléctricos',
          body: const Text("""
El hoy no circula es un protocolo que prohibe ciertos coches circular ciertos días de la semana, su principal razón es ayudar a mejorar la calidad del aire y hacer de el DF y alrededores un lugar más ecológico."""),
          to: Container(),
        ),
      ],
      expandIconColor: Theme.of(context).primaryColor,
      expansionCallback: (panelIndex, isExpanded) {
        ref.read(listIsOpenExpansionDetails.notifier).update((state) {
          final newList = List.of(ref.read(listIsOpenExpansionDetails));
          newList[panelIndex] = !isExpanded;
          return newList;
        });
      },
    );
  }
}
