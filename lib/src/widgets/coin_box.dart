import 'package:flutter/material.dart';

class CoinBox extends StatelessWidget {
  const CoinBox(
      {super.key,
      required this.height,
      required this.width,
      required this.img,
      required this.price,
      required this.name,
      required this.priceChangePercentage24h});

  final double height;
  final double width;
  final String img;
  final String price;
  final String name;
  final double priceChangePercentage24h;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(65, 72, 70, 1),
                    Color.fromRGBO(84, 82, 80, 1),
                  ])),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                Text(
                  " ${priceChangePercentage24h.toStringAsFixed(2)} %",
                  style: TextStyle(color: getColer()),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(name),
                const SizedBox(
                  height: 10,
                ),
                Text("\$ $price"),
              ],
            ),
          ]),
        ),
        Positioned(
          top: 0,
          left: 0,
          height: 70,
          width: 70,
          child: Hero(
            tag: "m",
            child: Image.network(
              img,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  getColer() {
    if (priceChangePercentage24h > 0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
