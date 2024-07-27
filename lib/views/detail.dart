import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zonajas/cards/card_detail_materials.dart';
import 'package:zonajas/cards/card_detail_review.dart';
import 'package:zonajas/model/suit.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/detailSizing.dart';

List imageList = [
  "assets/images/detailProduk/Jas1slide1.png",
  "assets/images/detailProduk/Jas1slide2.png",
  "assets/images/detailProduk/Jas1slide3.png",
  "assets/images/detailProduk/Jas1slide4.png",
];

List imageMaterialList = [
  "assets/images/detailProduk/kainLokal.png",
  "assets/images/detailProduk/kainPoly.png",
  "assets/images/detailProduk/kainSemi.png",
];

List reviewList = [
  {
    "image": "assets/images/detailProduk/Person1.png",
    "name": "John Andrean",
    "review": "Proses pengiriman sangat cepat dan bahan kursi sangat bagus",
    "rating": 5
  },
  {
    "image": "assets/images/detailProduk/Person2.png",
    "name": "Muhammad Salman",
    "review": "Proses pengiriman sangat cepat dan bahan kursi sangat bagus",
    "rating": 5
  },
  {
    "image": "assets/images/detailProduk/Person3.png",
    "name": "Rizal Gradian",
    "review": "Proses pengiriman sangat cepat dan bahan kursi sangat bagus",
    "rating": 5
  },
];

String formatPrice(int price) {
  final formatPrice =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return formatPrice.format(price);
}

class DetailView extends StatefulWidget {
  final Suit suit;

  const DetailView({Key? key, required this.suit});

  @override
  _DetailView createState() => _DetailView();
}

class _DetailView extends State<DetailView> {
  static const AR_URL =
      'https://www.snapchat.com/unlock/?type=SNAPCODE&uuid=b43fce91d21b470bbdd527a20fe6c7e3&metadata=01';

  Future<void> launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  void addFavorite() async {
    List bookmarks =
        await users.doc(uid).get().then((value) => value.get('bookmarks'));
    if (!bookmarks.contains(widget.suit.id)) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
            'bookmarks': FieldValue.arrayUnion([widget.suit.id ?? ''])
          })
          .then((value) => print("Bookmark added"))
          .catchError((error) => print("Failed to add bookmark: $error"));
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
            'bookmarks': FieldValue.arrayRemove([widget.suit.id ?? ''])
          })
          .then((value) => print("Bookmark removed"))
          .catchError((error) => print("Failed to remove bookmark: $error"));
    }

    final route = ModalRoute.of(context);
    if (route?.settings.name == "FavoriteView") {
      Navigator.pop(context, true);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: neutralWhite),
              expandedHeight: 260.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                ),
                items: imageList
                    .map((item) => Container(
                          child: Center(
                              child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          )),
                        ))
                    .toList(),
              )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return FutureBuilder<DocumentSnapshot>(
                    future: users.doc(uid).get(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No data found'),
                        );
                      }

                      List bookmarks = snapshot.data!.get('bookmarks');
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        '${widget.suit.sold.toString()} Terjual' ??
                                            "0 Terjual",
                                        style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 12,
                                            color: textSubdued),
                                      ),
                                    ),
                                    Text(
                                      '|',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textSubdued),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/detailProduk/icStar.png',
                                              width: 20,
                                              height: 20),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Text(
                                              widget.suit.rating.toString() ??
                                                  "0.0",
                                              style: TextStyle(
                                                  fontFamily: "InterRegular",
                                                  fontSize: 12,
                                                  color: textSubdued),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    addFavorite();
                                  },
                                  child: Image.asset(
                                      bookmarks.contains(widget.suit.id)
                                          ? 'assets/images/detailProduk/lovesOn.png'
                                          : 'assets/images/detailProduk/lovesOff.png',
                                      width: 54,
                                      height: 54),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.suit.name ?? "",
                                    style: TextStyle(
                                        fontFamily: "InterBold",
                                        fontSize: 16,
                                        color: textHead),
                                  ),
                                  Text(
                                      formatPrice(widget.suit.price.toInt()) ??
                                          "",
                                      style: TextStyle(
                                          fontFamily: "InterBold",
                                          fontSize: 20,
                                          color: secondaryDark)),
                                ],
                              ),
                            ),
                            Divider(
                              color: borderDark,
                              thickness: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Detail Produk',
                                      style: TextStyle(
                                          fontFamily: "InterBold",
                                          fontSize: 14,
                                          color: textHead)),
                                  Text(widget.suit.detail.toString() ?? "",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 14,
                                          color: textSubdued)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bahan',
                                      style: TextStyle(
                                          fontFamily: "InterBold",
                                          fontSize: 14,
                                          color: textHead)),
                                  Column(
                                    children: widget.suit.materials
                                        .map((e) => CardDetailMaterials(
                                              imageMaterial: imageMaterialList[
                                                  widget.suit.materials
                                                      .indexOf(e)],
                                              material: 'Bahan kain ${e}',
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: borderDark,
                              thickness: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ulasan (${reviewList.length})',
                                      style: TextStyle(
                                          fontFamily: "InterBold",
                                          fontSize: 14,
                                          color: textHead)),
                                  Column(
                                      children: reviewList
                                          .map((e) => CardDetailReview(
                                                image: e['image'],
                                                name: e['name'],
                                                review: e['review'],
                                                rating: e['rating'],
                                              ))
                                          .toList()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10.0),
                          ),
                        ),
                        backgroundColor: neutralWhite,
                        elevation: 0.0,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: SizedBox(
                              height: 600,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'Ukuran dalam Model adalah representasi\nuntuk berat badan 65-70kg',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "InterBold",
                                          fontSize: 16,
                                          color: textHead)),
                                  const SizedBox(height: 22),
                                  Image.asset(
                                    'assets/images/detailProduk/sketsaJas.png',
                                    width: 320,
                                  ),
                                  Card(
                                    elevation: 0.0,
                                    color: neutralWhite,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.transparent)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 66, vertical: 32),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('A. ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                primaryBlue)),
                                                    Text('50 cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                textSubdued)),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('E. ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                primaryBlue)),
                                                    Text('50 cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                textSubdued)),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('B. ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                primaryBlue)),
                                                    Text('50 cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                textSubdued)),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('F. ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                primaryBlue)),
                                                    Text('42 cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                textSubdued)),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('C. ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                primaryBlue)),
                                                    Text('57 cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                textSubdued)),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('G. ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                primaryBlue)),
                                                    Text('36 cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                textSubdued)),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('D. ',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                primaryBlue)),
                                                    Text('50 cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "InterRegular",
                                                            fontSize: 12,
                                                            color:
                                                                textSubdued)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchURL(
                                          widget.suit.arUrl.toString() ??
                                              AR_URL);
                                    },
                                    child: Container(
                                      height: 56,
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: primaryBlue),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/detailProduk/icARWhite.png',
                                              width: 24,
                                              height: 24),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Coba Mode AR',
                                            style: TextStyle(
                                                fontFamily: "InterBold",
                                                fontSize: 14,
                                                color: textWhite),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.all(10), // Mengurangi padding
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderDark)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/detailProduk/icAR.png',
                            width: 24, height: 24),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Coba Mode AR',
                            style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 14,
                                color: textHead),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // Mengurangi jarak antar tombol
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailSizing()));
                  },
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(vertical: 10), // Mengurangi padding
                    decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text('Beli Langsung',
                          style: TextStyle(
                              fontFamily: "InterBold",
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
