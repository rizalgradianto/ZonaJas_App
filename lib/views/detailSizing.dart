import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/detailOrder.dart';

class DetailSizing extends StatelessWidget {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'bRoBewfVYDU',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: neutralWhite),
            expandedHeight: 64.0,
            pinned: true,
            title: Text('Pembelian Jas',
                style: TextStyle(
                    fontFamily: "InterBold", fontSize: 18, color: textWhite)),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/HeaderHome.png',
                  fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Text('Cara mengukur jas',
                            style: TextStyle(
                                fontFamily: "InterBold", fontSize: 18)),
                        const SizedBox(height: 10),
                        YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        const Text('Isikan Ukuran Tubuh Anda',
                            style: TextStyle(
                                fontFamily: "InterBold", fontSize: 18)),
                        const SizedBox(height: 10),
                        Image.asset('assets/images/pembelian/sizeChart.png'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 20),
                      child: Text(
                        "A. Lebar Dada",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "InterMedium",
                          color: textBody,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("cm",
                                  style: TextStyle(
                                      fontFamily: "InterBold",
                                      fontSize: 14,
                                      color: textHead)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 20),
                      child: Text(
                        "B. Lebar Pinggang",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "InterMedium",
                          color: textBody,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("cm",
                                  style: TextStyle(
                                      fontFamily: "InterBold",
                                      fontSize: 14,
                                      color: textHead)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 20),
                      child: Text(
                        "C. Lebar Bahu",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "InterMedium",
                          color: textBody,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("cm",
                                  style: TextStyle(
                                      fontFamily: "InterBold",
                                      fontSize: 14,
                                      color: textHead)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 20),
                      child: Text(
                        "D. Panjang Badan",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "InterMedium",
                          color: textBody,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("cm",
                                  style: TextStyle(
                                      fontFamily: "InterBold",
                                      fontSize: 14,
                                      color: textHead)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 20),
                      child: Text(
                        "E. Lebar Bawah",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "InterMedium",
                          color: textBody,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("cm",
                                  style: TextStyle(
                                      fontFamily: "InterBold",
                                      fontSize: 14,
                                      color: textHead)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 20),
                      child: Text(
                        "F. Panjang Lengan",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "InterMedium",
                          color: textBody,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("cm",
                                  style: TextStyle(
                                      fontFamily: "InterBold",
                                      fontSize: 14,
                                      color: textHead)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 20),
                      child: Text(
                        "G. Lingkar Ketiak",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "InterMedium",
                          color: textBody,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("cm",
                                  style: TextStyle(
                                      fontFamily: "InterBold",
                                      fontSize: 14,
                                      color: textHead)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: borderDark),
                            ),
                            filled: true,
                            fillColor: Colors.transparent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailOrder()));
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Lanjutkan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 16,
                                color: textWhite),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
