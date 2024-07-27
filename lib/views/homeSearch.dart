import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zonajas/cards/card_suit.dart';
import 'package:zonajas/model/suit.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/detail.dart';

class HomeSearchView extends StatefulWidget {
  @override
  _HomeSearchView createState() => _HomeSearchView();
}

class _HomeSearchView extends State<HomeSearchView> {
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

  List allResults = [];
  List results = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getSuitStream();
    _searchController.addListener(onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.removeListener(onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getSuitStream();
    super.didChangeDependencies();
  }

  getSuitStream() async {
    var data = await FirebaseFirestore.instance
        .collection('suits')
        .orderBy('name')
        .get();

    setState(() {
      allResults = data.docs;
    });
    searchResults();
  }

  onSearchChanged() {
    print(_searchController.text.toString());
    searchResults();
  }

  searchResults() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var suitSnap in allResults) {
        var name = suitSnap.data()['name'].toString().toLowerCase();
        if (name.contains(_searchController.text.toString().toLowerCase())) {
          showResults.add(suitSnap);
        }
      }
    } else {
      showResults = List.empty();
    }

    setState(() {
      results = showResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: neutralWhite),
            expandedHeight: 86,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: primaryBlue,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 60, right: 20),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: neutralGrey),
                          prefixIcon: Icon(Icons.search, color: neutralGrey),
                          filled: true,
                          fillColor: neutralWhite,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  shrinkWrap: true,
                  children: results.map((e) {
                    final suit = Suit.fromJson(e.data());

                    if (results.isEmpty) {
                      return Container();
                    } else {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  settings: const RouteSettings(
                                      name: "HomeSearchView"),
                                  builder: ((context) =>
                                      DetailView(suit: suit))));
                        },
                        child: CardSuit(
                          image: suitPic[index++ % suitPic.length],
                          name: suit.name.toString(),
                          price: suit.price.toInt(),
                          sold: suit.sold.toInt(),
                          rating: suit.rating.toString(),
                        ),
                      );
                    }
                  }).toList(),
                ),
              );
            },
            childCount: 1,
          ))
        ],
      ),
    );
  }
}
