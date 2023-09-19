import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

class VerificationScreen extends ConsumerWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideTableInfo = ref.watch(hideTableInfoProvider);
    const estado = Estado.ok;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Verificación'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/verification.jpg',
                  ),
                  Positioned(
                    right: 25,
                    top: 40,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 19,
                      child: Container(
                        child: widgetIcon(estado, 30),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 125,
                    left: 126,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          widgetIcon(estado, 15),
                          widgetText(estado),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const InfoMessageVerification(
                  isActive: estado, icon: Icons.security),
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
