import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zonajas/cards/card_suit.dart';
import 'package:zonajas/model/suit.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/detail.dart';

class FavoriteView extends StatefulWidget {
  @override
  _FavoriteView createState() => _FavoriteView();
}

class _FavoriteView extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return const Scaffold(
        body: Center(
          child: Text('No user found'),
        ),
      );
    }

    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
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
            child: Text("No data found"),
          );
        }

        List<dynamic> bookmarks =
            (snapshot.data!.data() as Map<String, dynamic>)['bookmarks'] ?? [];
        List<String> bookmarksId = bookmarks.cast<String>();

        var suits = bookmarksId.map((id) {
          return FirebaseFirestore.instance.collection('suits').doc(id).get();
        });

        return FutureBuilder<List<DocumentSnapshot>>(
          future: Future.wait(suits),
          builder: (context, snapshot) {
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

            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
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
                          child: Text('Produk Favorit',
                              style: TextStyle(
                                  fontFamily: "InterBold",
                                  fontSize: 18,
                                  color: textWhite)),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 0.7,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      padding: const EdgeInsets.all(10),
                      children: snapshot.data!.map((e) {
                        final suit =
                            Suit.fromJson(e.data() as Map<String, dynamic>);
                        return InkWell(
                            onTap: () async {
                              final refresh = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      settings: const RouteSettings(
                                          name: "FavoriteView"),
                                      builder: (context) =>
                                          DetailView(suit: suit)));

                              if (refresh) {
                                setState(() {});
                              }
                            },
                            child: CardSuit(
                              image: 'assets/images/beranda/Jas1.jpg',
                              name: suit.name.toString(),
                              price: suit.price,
                              sold: suit.sold,
                              rating: suit.rating.toString(),
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ));
          },
        );
      }),
    ));
  }
}
