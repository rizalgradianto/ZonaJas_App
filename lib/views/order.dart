import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderView createState() => _OrderView();
}

class _OrderView extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/HeaderHome.png',
              height: 116,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Pesanan',
                      style: TextStyle(
                          fontFamily: "InterBold",
                          fontSize: 18,
                          color: textWhite)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
