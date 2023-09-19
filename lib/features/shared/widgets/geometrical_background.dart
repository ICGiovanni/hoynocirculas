//import 'dart:math' show pi;
import 'package:flutter/material.dart';

class GeometricalBackground extends StatelessWidget {
  final Widget child;
  const GeometricalBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final borderSize =
        size.width / 8; // Este es el tamaño para colocar 7 elementos

    Color colorL = const Color.fromARGB(26, 207, 201, 201).withOpacity(0.2);
    Color colorR = const Color.fromARGB(255, 242, 238, 238).withOpacity(0.8);

    final shapeWidgets = [
      _Diamond(borderSize, colorL),
      _Diamond(borderSize, colorR),
      _Diamond(borderSize, colorL),
      _Diamond(borderSize, colorR),
      _Diamond(borderSize, colorL),
      _Diamond(borderSize, colorR),
      _Diamond(borderSize, colorL),
      _Diamond(borderSize, colorR),
    ];

    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(child: Container(color: backgroundColor)),

          // Background with shapes
          Container(
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                  ShapeRow(shapeWidgets: shapeWidgets),
                  ShapeRow(shapeWidgets: List.from(shapeWidgets.reversed)),
                ],
              )),

          // Child widget
          child,
        ],
      ),
    );
  }
}

class ShapeRow extends StatefulWidget {
  const ShapeRow({
    super.key,
    required this.shapeWidgets,
  });

  final List<Widget> shapeWidgets;

  @override
  State<ShapeRow> createState() => _ShapeRowState();
}

class _ShapeRowState extends State<ShapeRow> {
  late List<Widget> shapeMixedUp;

  @override
  void initState() {
    super.initState();
    shapeMixedUp = [...widget.shapeWidgets];
    //shapeMixedUp.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: shapeMixedUp);
  }
}

class _Diamond extends StatelessWidget {
  final Color color;
  final double borderSize;

  const _Diamond(this.borderSize, this.color);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderSize,
      height: borderSize,
      child: CustomPaint(
        painter: _DiamondPainter(color: color),
      ),
    );
  }
}

class _DiamondPainter extends CustomPainter {
  final Color color;

  _DiamondPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DiamondPainter oldDelegate) => false;
}
