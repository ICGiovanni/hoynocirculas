import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/main/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/maps/presentation/screens/screens.dart';

class MapTabScreen extends ConsumerWidget {
  const MapTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocGps = ref.watch(gpsProvider);

    Widget redirectWidget(GpsState blocGps) {
      if (!blocGps.isGpsEnabled) {
        return const _EnableGpsMessage();
      } else if (!blocGps.isGpsPermissionGranted) {
        return const _AccessButton();
      } else {
        return const MapHomeTabScreen();
      }
    }

    return redirectWidget(blocGps);
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
        const Text('Es necesario el acceso al GPS'),
        MaterialButton(
          color: Theme.of(context).primaryColor,
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
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Debe de habilitar el GPS',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
