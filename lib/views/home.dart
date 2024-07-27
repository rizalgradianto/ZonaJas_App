import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zonajas/cards/card_suit.dart';
import 'package:zonajas/model/suit.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/detail.dart';
import 'package:zonajas/views/homeCategory.dart';
import 'package:zonajas/views/homeSearch.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  List suitPic = [
    "assets/images/beranda/Jas1.jpg",
    "assets/images/beranda/Jas2.jpg",
    "assets/images/beranda/Jas3.jpg",
    "assets/images/beranda/Jas4.jpg",
    "assets/images/beranda/Jas5.png",
    "assets/images/beranda/Jas6.png",
    "assets/images/beranda/Jas7.png",
    "assets/images/beranda/Jas8.png",
    "assets/images/beranda/Jas9.png",
    "assets/images/beranda/Jas10.png",
  ];
  int index = 0;

  bool filter = false;

  @override
  void initState() {
    // TODO: implement initState
    index = 0;
    super.initState();
  }

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

    final CollectionReference suits =
        FirebaseFirestore.instance.collection('suits');

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
              child: Text('No data found'),
            );
          }

          if (snapshot.data!.data() == null) {
            print(uid);
            return const Center(
              child: Text('No data found'),
            );
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/HeaderHome.png",
                      height: 203,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/beranda/avatar.png",
                                width: 45,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Halo, ${data['name']} 👋",
                                    style: TextStyle(
                                        fontFamily: "InterBold",
                                        fontSize: 18,
                                        color: textWhite),
                                  ),
                                  Text('Ayo cari jas favoritmu di sini!',
                                      style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        color: textWhite,
                                      ))
                                ],
                              ),
                              const Spacer(),
                              Image.asset(
                                "assets/images/beranda/icNotif2.png",
                                width: 45,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeSearchView()));
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: blueForm,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 4,
                                      right: 14,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/beranda/icSearch.png",
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Cari jas menarik disini...",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 14,
                                            color: textWhite,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Kategori',
                      style: TextStyle(
                        fontFamily: "InterBold",
                        fontSize: 18,
                        color: textHead,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HomeCategoryView(category: "Slim")));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/beranda/catSlim.png",
                            width: 45,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Slim",
                            style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 12,
                              color: textHead,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeCategoryView(
                                    category: "Slim Fit")));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/beranda/catSlimfit.png",
                            width: 45,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Slim Fit",
                            style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 12,
                              color: textHead,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeCategoryView(
                                    category: "Tuxedo")));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/beranda/catTuxedo.png",
                            width: 45,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Tuxedo",
                            style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 12,
                              color: textHead,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeCategoryView(
                                    category: "Classic")));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/beranda/catClassic.png",
                            width: 45,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Classic",
                            style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 12,
                              color: textHead,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeCategoryView(
                                    category: "Breasted")));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/beranda/catBreasted.png",
                            width: 45,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Breasted",
                            style: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 12,
                              color: textHead,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Rekomendasi Jas',
                      style: TextStyle(
                        fontFamily: "InterBold",
                        fontSize: 18,
                        color: textHead,
                      )),
                ),
                FutureBuilder<QuerySnapshot>(
                  future: suits.get(),
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

                    final suitData = snapshot.data!.docs
                        .asMap()
                        .map((key, value) => MapEntry(key, value.data()))
                        .map((key, value) =>
                            MapEntry(key, value as Map<String, dynamic>));

                    return SizedBox(
                      child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          children: filter
                              ? suitData.entries.take(1).map((e) {
                                  final suit = Suit.fromJson(e.value);
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              settings: const RouteSettings(
                                                  name: "HomeView"),
                                              builder: (context) =>
                                                  DetailView(suit: suit)));
                                    },
                                    child: CardSuit(
                                      image: suitPic[0],
                                      name: suit.name.toString(),
                                      price: suit.price.toInt(),
                                      sold: suit.sold.toInt(),
                                      rating: suit.rating.toString(),
                                    ),
                                  );
                                }).toList()
                              : suitData.entries.map((e) {
                                  final suit = Suit.fromJson(e.value);
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              settings: const RouteSettings(
                                                  name: "HomeView"),
                                              builder: (context) =>
                                                  DetailView(suit: suit)));
                                    },
                                    child: CardSuit(
                                      image: suitPic[index++ % suitPic.length],
                                      name: suit.name.toString(),
                                      price: suit.price.toInt(),
                                      sold: suit.sold.toInt(),
                                      rating: suit.rating.toString(),
                                    ),
                                  );
                                }).toList()),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
