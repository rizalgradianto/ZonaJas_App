import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zonajas/utils/colors.dart';

class CardSuit extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final int sold;
  final String rating;

  const CardSuit({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.sold,
    required this.rating,
  }) : super(key: key);

  String formatPrice(int price) {
    final formatPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatPrice.format(price);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: neutralWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            const SizedBox(height: 10),
            Text(name,
                style: const TextStyle(fontFamily: "InterBold", fontSize: 12)),
            Text(formatPrice(price),
                style: TextStyle(
                    fontFamily: "InterBold",
                    fontSize: 12,
                    color: secondaryDark)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${sold.toString()} Terjual',
                    style: TextStyle(
                        fontFamily: "InterRegular",
                        fontSize: 10,
                        color: textSubdued)),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text('|',
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 10,
                            color: textSubdued))),
                Image.asset('assets/images/detailProduk/icStar.png',
                    width: 10, height: 10),
                const SizedBox(
                  width: 4,
                ),
                Text(rating,
                    style: TextStyle(
                        fontFamily: "InterRegular",
                        fontSize: 10,
                        color: textSubdued))
              ],
            )
          ],
        ),
      ),
    );
  }
}
