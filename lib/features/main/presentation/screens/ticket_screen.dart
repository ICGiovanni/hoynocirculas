import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Tus multas'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'POR PAGAR',
                style: TextStyle(
                  fontFamily: 'QuicksandBold',
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              CardTicket(
                title: 'Exceso de velocidad',
                recibo: '24151',
                hour: '09:20',
                date: '02/07/2023',
                cost: 140.0,
              ),
              CardTicket(
                title: 'Pasar por alto',
                recibo: '24152',
                hour: '15:20',
                date: '03/07/2023',
                cost: 210.0,
              ),
              CardTicket(
                title: 'No verificar',
                recibo: '24153',
                hour: '12:20',
                date: '04/07/2023',
                cost: 90.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTicket extends StatelessWidget {
  final String title;
  final String recibo;
  final String date;
  final String hour;
  final double cost;
  const CardTicket({
    super.key,
    required this.title,
    required this.recibo,
    required this.date,
    required this.cost,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    double cardRadius = 10.0;
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 1,
        radius: Radius.circular(cardRadius),
        dashPattern: const [10, 5],
        customPath: (size) {
          return Path()
            ..moveTo(cardRadius, 0)
            ..lineTo(size.width - cardRadius, 0)
            ..arcToPoint(Offset(size.width, cardRadius),
                radius: Radius.circular(cardRadius))
            ..lineTo(size.width, size.height - cardRadius)
            ..arcToPoint(Offset(size.width - cardRadius, size.height),
                radius: Radius.circular(cardRadius))
            ..lineTo(cardRadius, size.height)
            ..arcToPoint(Offset(0, size.height - cardRadius),
                radius: Radius.circular(cardRadius))
            ..lineTo(0, cardRadius)
            ..arcToPoint(Offset(cardRadius, 0),
                radius: Radius.circular(cardRadius));
        },
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.23,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.file,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontFamily: 'QuicksandBold',
                                fontSize: 17,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const Text('Multa'),
                          ],
                        )
                      ],
                    ),
                    Column(children: [
                      Text('Recibo#$recibo'),
                      Text('$hour $date'),
                    ]),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Por pagar', style: TextStyle(fontSize: 17)),
                    Text(
                      ' \$${cost.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'QuicksandBold',
                        color: Colors.green,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                          color: color,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        color,
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                        color,
                      ),
                      shadowColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      surfaceTintColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {},
                    child: const Center(
                      child: Text(
                        'Pagar ahora',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
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
