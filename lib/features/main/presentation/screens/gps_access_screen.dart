import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';

import '../providers/providers.dart';

class GpsAccessScreen extends ConsumerWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocGps = ref.watch(gpsProvider);

    Widget redirectWidget(GpsState blocGps) {
      if (!blocGps.isGpsEnabled) {
        return const _EnableGpsMessage();
      } else if (!blocGps.isGpsPermissionGranted) {
        return const _AccessButton();
      } else {
        return const HomeScreen();
      }
    }

    return Scaffold(
      body: Center(
        child: redirectWidget(blocGps),
      ),
    );
  }
}

class _AccessButton extends ConsumerWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso a GPS'),
        MaterialButton(
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          splashColor: Colors.transparent,
          onPressed: () {
            ref.read(gpsProvider.notifier).askGpsAccess();
            //askGpsAccess();
          },
          child: const Text('Solicitar Acceso',
              style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe de habilitar el GPS',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
