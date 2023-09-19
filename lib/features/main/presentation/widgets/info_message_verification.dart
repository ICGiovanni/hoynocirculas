import 'package:flutter/material.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

class InfoMessageVerification extends StatelessWidget {
  final Estado isActive;
  final IconData icon;
  const InfoMessageVerification({
    super.key,
    required this.isActive,
    required this.icon,
  });

  Widget titleCard(Estado estado) {
    late String text;
    switch (estado.index) {
      case 0:
        text = 'Tu verificación esta al día';
        break;
      case 1:
        text = 'No olvides verificar tu vehículo';
        break;
      case 2:
        text = 'Periodo de verificación vencido';
        break;
    }

    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'QuicksandBold',
        fontSize: 17,
      ),
    );
  }

  Widget subTitleCard(Estado estado) {
    late String text;
    switch (estado.index) {
      case 0:
        text = 'El siguiente periodo es en Marzo y Abril';
        break;
      case 1:
        text = 'Quedan 3 días';
        break;
      case 2:
        text = 'Debes pagar multa antes de verificar';
        break;
    }

    return Text(
      text,
    );
  }

  List<Widget> linksCards(Estado estado, BuildContext context) {
    List<Widget> list = [];

    switch (estado.index) {
      case 0:
        list.add(const SizedBox());
        list.add(
          Text(
            'No he verificado >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );
        list.add(const SizedBox());
        list.add(const SizedBox());

        break;
      case 1:
        list.add(const SizedBox());
        list.add(const SizedBox());
        list.add(
          Text(
            'Encontrar verificentro >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );

        list.add(
          Text(
            'Ya verifiqué >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );
        break;
      case 2:
        list.add(
          Text(
            'Ver multa >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );

        list.add(
          Text(
            'Encontrar verificentro >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );

        list.add(
          Text(
            'Ya verifiqué >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );
        break;
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3.0,
              offset: Offset(
                0.0,
                2.0,
              ),
            ),
          ]),
      child: Stack(
        children: [
          Positioned(
            left: 80,
            top: 10,
            width: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleCard(isActive),
                const SizedBox(height: 5),
                subTitleCard(isActive),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 15,
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
            left: 42,
            top: 45,
            child: Container(
              child: widgetIcon(isActive, 25),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: linksCards(isActive, context),
            ),
          ),
        ],
      ),
    );
  }
}
