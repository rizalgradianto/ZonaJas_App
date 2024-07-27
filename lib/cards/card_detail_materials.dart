import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';

class CardDetailMaterials extends StatelessWidget {
  final String material;
  final String imageMaterial;

  const CardDetailMaterials({
    Key? key,
    required this.imageMaterial,
    required this.material,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.white,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: neutralGrey,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              imageMaterial,
              width: 100,
              height: 59,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(material,
                      style: TextStyle(
                        fontFamily: "InterRegular",
                        fontSize: 14,
                        color: textHead,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
