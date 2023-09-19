import 'package:flutter/material.dart';

class CardCar extends StatelessWidget {
  final String carModel;
  final bool isActive;
  const CardCar({
    super.key,
    required this.carModel,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            spreadRadius: 3.4,
            blurRadius: 2.0,
            offset: const Offset(0.0, 0.4),
          )
        ],
      ),
      width: double.infinity,
      height: 50,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              carModel,
              style: const TextStyle(
                fontFamily: 'QuicksandBold',
                fontSize: 17,
              ),
            ),
            isActive
                ? Icon(
                    Icons.arrow_left_sharp,
                    color: color,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
