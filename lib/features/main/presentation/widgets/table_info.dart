import 'package:flutter/material.dart';

class TableInfo extends StatelessWidget {
  const TableInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const double heightBox = 60;
    const fontBold = TextStyle(fontFamily: 'QuicksandBold');
    Color? colorCell = Colors.grey[200];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        children: [
          TableRow(
            children: [
              Container(
                height: heightBox,
                decoration: BoxDecoration(
                  color: colorCell,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Engomado',
                    style: fontBold.copyWith(fontSize: 16),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  height: heightBox,
                  width: 32,
                  decoration: BoxDecoration(
                    color: colorCell,
                    border: Border(
                      left: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Terminación placa',
                      style: fontBold.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Container(
                height: heightBox,
                decoration: BoxDecoration(
                  color: colorCell,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Periodo',
                    style: fontBold.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                height: heightBox,
                color: Colors.yellow,
                child: const Center(
                  child: Text(
                    'Amarillo',
                    style: fontBold,
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  height: heightBox,
                  width: 32,
                  decoration: BoxDecoration(
                    color: colorCell,
                    border: Border(
                      right: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '5 o 6',
                      style: fontBold,
                    ),
                  ),
                ),
              ),
              Container(
                height: heightBox,
                color: colorCell,
                child: const Center(
                  child: Text(
                    'Julio y Agosto',
                    style: fontBold,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                height: heightBox,
                color: Colors.pinkAccent,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Rosa',
                        style: fontBold.copyWith(color: Colors.white),
                      ),
                      Chip(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.white.withOpacity(0.8),
                        label: const Text('Mi engomado',
                            style: TextStyle(fontSize: 12)),
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  height: heightBox,
                  width: 32,
                  decoration: BoxDecoration(
                    color: colorCell,
                    border: Border(
                      right: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '7 o 8',
                      style: fontBold,
                    ),
                  ),
                ),
              ),
              Container(
                height: heightBox,
                color: colorCell,
                child: const Center(
                  child: Text(
                    'Agosto y Septiembre',
                    style: fontBold,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                height: heightBox,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Rojo',
                    style: fontBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  height: heightBox,
                  width: 32,
                  decoration: BoxDecoration(
                    color: colorCell,
                    border: Border(
                      right: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '3 o 4',
                      style: fontBold,
                    ),
                  ),
                ),
              ),
              Container(
                height: heightBox,
                color: colorCell,
                child: const Center(
                  child: Text(
                    'Septiembre y Octubre',
                    style: fontBold,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                height: heightBox,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Verde',
                    style: fontBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  height: heightBox,
                  width: 32,
                  decoration: BoxDecoration(
                    color: colorCell,
                    border: Border(
                      right: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '1 o 2',
                      style: fontBold,
                    ),
                  ),
                ),
              ),
              Container(
                height: heightBox,
                color: colorCell,
                child: const Center(
                  child: Text(
                    'Octubre y Noviembre',
                    style: fontBold,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                height: heightBox,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Azul',
                    style: fontBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  height: heightBox,
                  width: 32,
                  decoration: BoxDecoration(
                    color: colorCell,
                    border: Border(
                      right: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '9 o 0',
                      style: fontBold,
                    ),
                  ),
                ),
              ),
              Container(
                height: heightBox,
                color: colorCell,
                child: const Center(
                  child: Text(
                    'Noviembre y Diciembre',
                    style: fontBold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
