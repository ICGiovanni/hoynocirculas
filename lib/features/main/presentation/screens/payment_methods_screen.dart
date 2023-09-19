import 'package:flutter/material.dart';

class PaymentsMethodsScreen extends StatelessWidget {
  const PaymentsMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> myMethods = ['123456425', '11111813', '22222980'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Métodos de pago'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final numberCard = myMethods[index]; //•
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  "••• ${numberCard.substring(numberCard.length - 3)}",
                  style: const TextStyle(
                    fontFamily: 'QuicksandBold',
                    fontSize: 17,
                  ),
                ),
                trailing: Text(
                  'Editar >',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 17,
                    fontFamily: 'QuicksandBold',
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: myMethods.length,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '+ Añadir método de pago',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 17,
                fontFamily: 'QuicksandBold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
