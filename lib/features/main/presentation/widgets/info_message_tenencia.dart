import 'package:flutter/material.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

class InfoMessageTenencia extends StatelessWidget {
  final Estado isActive;
  final IconData icon;
  const InfoMessageTenencia({
    super.key,
    required this.isActive,
    required this.icon,
  });

  Widget titleCard(Estado estado) {
    late String text;
    switch (estado.index) {
      case 0:
        text = 'Tu tenencia esta al corriente';
        break;
      case 1:
        text = 'Es momento de pagar tu tenencia';
        break;
      case 2:
        text = 'Pago de tenencia vencido';
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
        text = 'Todo en orden hasta el 2024';
        break;
      case 1:
        text = """Puedes pagar entre Enero y Marzo
"Quedan 4 dias para pagar con descuento" """;
        break;
      case 2:
        text = """Posiblemente debas pagar recargos
e intereses """;
        break;
    }

    return Text(
      text,
      style: const TextStyle(fontSize: 13),
    );
  }

  List<Widget> linksCards(Estado estado, BuildContext context) {
    List<Widget> list = [];

    switch (estado.index) {
      case 0:
        list.add(const SizedBox());

        break;
      case 1:
        list.add(const SizedBox());

        list.add(
          Text(
            'Calendario >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );

        list.add(
          Text(
            'Pagar ahora >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );
        break;
      case 2:
        list.add(const SizedBox());
        list.add(
          Text(
            'Más info >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );

        list.add(
          Text(
            'Pagar ahora >',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'QuicksandBold',
            ),
          ),
        );
        list.add(const SizedBox());

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
            left: 75,
            top: 10,
            width: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleCard(isActive),
                subTitleCard(isActive),
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
            bottom: 5,
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
