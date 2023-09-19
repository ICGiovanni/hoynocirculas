import 'package:flutter/material.dart';
import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';
import 'package:hoy_no_circulas/features/vehicule/presentation/screens/screens.dart';

class MyVechiclesScreen extends StatelessWidget {
  const MyVechiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Vehículos')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardMyVechicles(
              make: 'Toyota',
              model: 'Acqua',
              city: 'Estade de Mexico',
              placa: 'HAL2145',
              hologram: '00',
              year: 2021,
            ),
            const CardMyVechicles(
              make: 'Mazda',
              model: 'CX7',
              city: 'Estade de Mexico',
              placa: 'PAE7163',
              hologram: '2',
              year: 2021,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
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
            )
          ],
        ),
      ),
    );
  }
}

class CardMyVechicles extends StatelessWidget {
  final String make;
  final String model;
  final String city;
  final String placa;
  final String hologram;
  final int year;
  const CardMyVechicles({
    super.key,
    required this.make,
    required this.model,
    required this.city,
    required this.placa,
    required this.hologram,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    const fontBold = TextStyle(fontFamily: 'QuicksandBold', fontSize: 20);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Row(
              children: [
                Text(
                  make,
                  style: fontBold,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  model,
                  style: fontBold,
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 0,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      NavigateToPage.navigateToPage(
                        widget: const EditVehicleScreen(),
                        context: context,
                      );
                    },
                    child: Text(
                      'Editar >',
                      style: fontBold.copyWith(
                        color: Colors.orange,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Text(
                    'Eliminar >',
                    style: fontBold.copyWith(
                      color: Colors.red,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$make  $model  $year",
                  ),
                  Text(
                    city,
                  ),
                  Text(
                    placa,
                  ),
                  Text(
                    'Holograma $hologram',
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
