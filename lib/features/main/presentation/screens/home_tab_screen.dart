import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoy_no_circulas/features/auth/presentation/providers/providers.dart';
import 'package:hoy_no_circulas/features/main/presentation/screens/screens.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';
import 'package:hoy_no_circulas/features/vehicule/presentation/screens/screens.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyCarsList(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final userName =
                          ref.read(authProvider).user?.fullName.split(' ')[0];
                      return Text(
                        'Bienvenid@, $userName',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 26),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ),
              ),
              const Information(),
              const AddVehicleLabel(),
              const InfoCalendarHomeTab(),
              const CardInfoHomeTab(
                icon: Icons.security,
                isActive: Estado.ok,
                title: 'Tu verificación esta al día',
                subtitle: 'La siguiente es en Marzo-Abril',
                to: VerificationScreen(),
              ),
              const CardInfoHomeTab(
                icon: Icons.calendar_month_outlined,
                isActive: Estado.warning,
                title: 'Es momento de pagar tu tenencia',
                subtitle: 'Con descuento',
                to: TenenciaScreen(),
              ),
              const CardInfoHomeTab(
                icon: Icons.check_circle,
                isActive: Estado.danger,
                title: 'Varias multas',
                subtitle: '10 multas pendientes de pago',
                to: TicketScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Estado {
  ok,
  warning,
  danger,
}

class CardInfoHomeTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Estado isActive;
  final Widget to;
  const CardInfoHomeTab({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    Icon? widgetIcon(Estado valor) {
      if (valor.index == 2) return null;

      return Icon(
        valor.index == 0 ? Icons.check_circle : Icons.warning,
        color: valor.index == 0 ? Colors.green : Colors.yellow,
      );
    }

    Color? widgetBackground(Estado valor) {
      return valor.index == 0 || valor.index == 1
          ? Colors.grey[300]
          : Colors.red;
    }

    Color? widgetTextColor(Estado valor) {
      return valor.index == 0 || valor.index == 1
          ? Colors.grey[600]
          : Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'QuicksandBold',
                          fontSize: 17,
                        ),
                      ),
                      Text(subtitle),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigateToPage.navigateToPage(
                              widget: to, context: context);
                        },
                        child: Text(
                          textAlign: TextAlign.right,
                          'Más info >',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'QuicksandBold'),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    backgroundColor: widgetBackground(isActive),
                    radius: 25,
                    child: Icon(
                      icon,
                      size: 30,
                      color: widgetTextColor(isActive),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 33,
                  child: Container(
                    child: widgetIcon(isActive),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddVehicleLabel extends StatelessWidget {
  const AddVehicleLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('TU VEHICULO'),
          GestureDetector(
            onTap: () {
              NavigateToPage.navigateToPage(
                  widget: const NewVehicleScreen(), context: context);
            },
            child: Text(
              '+ Añadir vehículo',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'QuicksandBold',
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Card(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 5,
              left: 45,
              child: Text(
                'Avisos Importantes',
                style: TextStyle(
                  fontFamily: 'QuicksandBold',
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 43,
              right: 0,
              height: 100,
              child: Scrollbar(
                thickness: 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("• "),
                          Expanded(
                            child: Text(
                                'Cuidado. Entramos en fase 2 desde el 2 de junio'),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: <Widget>[
                          Text("• "),
                          Expanded(
                            child: Text('Hoy, Hidalgo y Toluca no circulan'),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: <Widget>[
                          Text("• "),
                          Expanded(
                            child: Text(
                                'Inició el periodo de verificación de tu vehículo'),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddVehicle extends StatelessWidget {
  const AddVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                NavigateToPage.navigateToPage(
                    widget: const NewVehicleScreen(), context: context);
              },
              child: Text(
                '+ Añadir vehículo',
                style: TextStyle(
                  color: color,
                  fontFamily: 'QuicksandBold',
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
