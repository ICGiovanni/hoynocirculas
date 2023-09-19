import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hoy_no_circulas/features/shared/widgets/widgets.dart';

import '../../domain/entities/entities.dart';
import '../providers/make_provider.dart';

class NewVehicleScreen extends StatelessWidget {
  const NewVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<CarMake?> make = ValueNotifier<CarMake?>(null);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Añadir vehículo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/3339154.jpg'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Proporciona detalles de tu vehículo. Te tomará unos minutos y te ahorrará horas.',
                    style: TextStyle(fontFamily: 'QuicksandBold'),
                  ),
                  const SizedBox(height: 30),
                  Consumer(
                    builder: (context, ref, child) {
                      final listCarMakes = ref.watch(carMakes);

                      return listCarMakes.when(
                        data: (data) {
                          return ValueListenableBuilder(
                            valueListenable: make,
                            builder: (context, value, child) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                    top: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                    left: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                    right: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                ),
                                child: DropdownButton<CarMake>(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  value: make.value,
                                  elevation: 0,
                                  underline: Container(),
                                  isExpanded: true,
                                  hint: const Text('Selecciona la marca'),
                                  alignment: Alignment.centerLeft,
                                  items: data.map((CarMake carMake) {
                                    return DropdownMenuItem<CarMake>(
                                      value: carMake,
                                      alignment: Alignment.centerLeft,
                                      child: Text(carMake.name),
                                    );
                                  }).toList(),
                                  onChanged: (CarMake? newValue) {
                                    make.value = newValue!;
                                  },
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        error: (_, __) => throw UnimplementedError(),
                        loading: () => const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                            top: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                            left: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                            right: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                        ),
                        child: DropdownButton(
                          hint: const Text('Modelo'),
                          value: null,
                          items: const [
                            DropdownMenuItem(
                              value: 'Aveo',
                              child: Text('Aveo'),
                            ),
                          ],
                          onChanged: (value) {},
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          underline: Container(),
                          isExpanded: true,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                            top: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                            left: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                            right: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                        ),
                        child: DropdownButton(
                          hint: const Text('Año'),
                          value: null,
                          items: const [
                            DropdownMenuItem(
                              value: '2012',
                              child: Text('2012'),
                            ),
                          ],
                          onChanged: (value) {},
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          underline: Container(),
                          isExpanded: true,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Holograma',
                    style: TextStyle(fontFamily: 'QuicksandBold'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: Chip(
                          backgroundColor: Theme.of(context).primaryColor,
                          label: const Text(
                            '0',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: const StadiumBorder(),
                          side: BorderSide.none,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: Chip(
                          backgroundColor: Theme.of(context).disabledColor,
                          label: const Text(
                            '00',
                          ),
                          shape: const StadiumBorder(),
                          side: BorderSide.none,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: Chip(
                          backgroundColor: Theme.of(context).disabledColor,
                          label: const Text('1'),
                          shape: const StadiumBorder(),
                          side: BorderSide.none,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: Chip(
                          backgroundColor: Theme.of(context).disabledColor,
                          label: const Text('2'),
                          shape: const StadiumBorder(),
                          side: BorderSide.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CustomTextFormField(
                    label: 'Matrícula',
                    onChanged: null,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextFormField(
                    label: 'Estado',
                    onChanged: null,
                  ),
                  const SizedBox(height: 10),
                  const CustomTextFormField(
                    label: 'Alias (Ej: Mi Bochito)',
                    onChanged: null,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'Realicé la última verificación',
                          style: TextStyle(
                            fontFamily: 'QuicksandBold',
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          activeColor: Theme.of(context).primaryColor,
                          value: true,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'Pagué mi última tenencia',
                          style: TextStyle(
                            fontFamily: 'QuicksandBold',
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          activeColor: Theme.of(context).primaryColor,
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'Notificarme cuando sea necesario',
                          style: TextStyle(
                            fontFamily: 'QuicksandBold',
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          activeColor: Theme.of(context).primaryColor,
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: CustomFilledButton(
                      text: 'Add',
                      buttonColor: Theme.of(context).primaryColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
