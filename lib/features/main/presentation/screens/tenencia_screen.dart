import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

class TenenciaScreen extends ConsumerWidget {
  const TenenciaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideTableInfo = ref.watch(hideTableInfoProvider);
    const estado = Estado.warning;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tenencia'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  if (estado == Estado.ok)
                    Image.asset(
                      'assets/images/tenencia_ok.jpg',
                    ),
                  if (estado == Estado.warning)
                    Image.asset(
                      'assets/images/tenencia_warning.jpg',
                    ),
                  if (estado == Estado.danger)
                    Image.asset(
                      'assets/images/tenencia_danger.jpg',
                    ),
                ],
              ),
              const InfoMessageTenencia(
                isActive: estado,
                icon: Icons.calendar_month_outlined,
              ),
              const SizedBox(height: 20),
              Row(
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
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: !hideTableInfo ? 1.0 : 0.0,
                curve: Curves.bounceOut,
                child: !hideTableInfo ? const TableInfo() : Container(),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 15),
              const MenuDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
