import 'package:flutter/material.dart';

ExpansionPanel infoTabExpansion({
  required BuildContext context,
  required bool isOpen,
  required String title,
  required Widget body,
  required Widget to,
}) {
  return ExpansionPanel(
    canTapOnHeader: true,
    backgroundColor: Colors.grey[200],
    headerBuilder: (context, isExpanded) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: const TextStyle(
                  fontFamily: 'QuicksandBold',
                  fontSize: 17,
                )),
          ),
        ),
      );
    },
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          body,
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Más info',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'QuicksandBold',
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    ),
    isExpanded: isOpen,
  );
}
