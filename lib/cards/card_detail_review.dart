import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zonajas/utils/colors.dart';

class CardDetailReview extends StatelessWidget {
  final String image;
  final String name;
  final String review;
  final int rating;

  const CardDetailReview({
    Key? key,
    required this.image,
    required this.name,
    required this.review,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 50,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          rating,
                          (index) => Image.asset(
                            'assets/images/detailProduk/icStar.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(rating.toString(),
                          style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 12,
                            color: textHead,
                          )),
                      Text('/5',
                          style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 10,
                            color: textHead,
                          ))
                    ],
                  ),
                  Text(name,
                      style: TextStyle(
                          fontFamily: "InterBold",
                          fontSize: 12,
                          color: textHead)),
                  SizedBox(
                    width: 260,
                    child: Text(review,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "InterRegular",
                          fontSize: 12,
                          color: textSubdued,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
