import 'package:flutter/material.dart';
import 'package:zonajas/cards/card_suit.dart';
import 'package:zonajas/utils/colors.dart';

class HomeCategoryView extends StatefulWidget {
  final String category;

  const HomeCategoryView({Key? key, required this.category});

  @override
  _HomeCategoryView createState() => _HomeCategoryView();
}

class _HomeCategoryView extends State<HomeCategoryView> {
  List listSuit = [
    {
      'image': 'assets/images/beranda/Jas1.jpg',
      'name': 'Jas Slim Navy',
      'price': 1500000,
      'sold': 80,
      'rating': '4.2'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: neutralWhite,
        ),
        titleTextStyle: TextStyle(
            fontFamily: 'InterBold', fontSize: 18, color: neutralWhite),
        backgroundColor: primaryBlue,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        children: listSuit.map((e) {
          return CardSuit(
            image: e['image'],
            name: e['name'],
            price: e['price'],
            sold: e['sold'],
            rating: e['rating'],
          );
        }).toList(),
      ),
    );
  }
}
