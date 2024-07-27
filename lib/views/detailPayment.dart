import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';

class DetailPayment extends StatelessWidget {
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
            title: Text('Pembayaran',
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
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Card(
                      elevation: 0.0,
                      color: primaryLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Batas Akhir Pembayaran',
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        color: neutralWhite)),
                                Text('Senin, 25 Maret 2024, 20:49 WIB',
                                    style: TextStyle(
                                        fontFamily: "InterBold",
                                        fontSize: 16,
                                        color: neutralWhite)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: borderNormal)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('BCA Virtual Account',
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 14,
                                        color: textHead)),
                                Image.asset(
                                  'assets/images/detailProduk/bca.png',
                                  width: 50,
                                )
                              ],
                            ),
                            Card(
                              elevation: 0.0,
                              color: neutralWhite,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: borderNormal)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Nomor Virtual Account',
                                            style: TextStyle(
                                                fontFamily: "InterRegular",
                                                fontSize: 12,
                                                color: textSubdued)),
                                        Text('1234567890',
                                            style: TextStyle(
                                                fontFamily: "InterRegular",
                                                fontSize: 14,
                                                color: textHead)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                            'assets/images/detailProduk/icCopy.png',
                                            width: 16),
                                        const SizedBox(width: 5),
                                        Text('Salin',
                                            style: TextStyle(
                                                fontFamily: "InterRegular",
                                                fontSize: 12,
                                                color: textLink)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 0.0,
                              color: neutralWhite,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: borderNormal)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Total Pembayaran',
                                            style: TextStyle(
                                                fontFamily: "InterRegular",
                                                fontSize: 12,
                                                color: textSubdued)),
                                        Text('Rp 214.000',
                                            style: TextStyle(
                                                fontFamily: "InterRegular",
                                                fontSize: 14,
                                                color: textHead)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: borderNormal)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Pesananmu baru diteruskan ke penjual\nsetelah pembayaran terverivikasi',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "InterRegular",
                                      fontSize: 12,
                                      color: textHead),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    NavigatorState nav = Navigator.of(context);
                                    nav.pop();
                                    nav.pop();
                                    nav.pop();
                                    nav.pop();
                                  },
                                  child: Card(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: textHead)),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text('Kembali ke Beranda',
                                          style: TextStyle(
                                              fontFamily: "InterBold",
                                              fontSize: 14,
                                              color: textHead)),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
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
