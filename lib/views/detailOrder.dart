import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/detailPayment.dart';

const List<String> materials = <String>[
  'Lokal',
  'Polyester',
  'Semi Wool',
];

class DetailOrder extends StatefulWidget {
  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  String dropdownValue = materials.first;

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
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Nama Barang",
                          style:
                              TextStyle(fontFamily: "InterBold", fontSize: 14)),
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
                          children: [
                            Image.asset('assets/images/beranda/Jas1.jpg',
                                width: 50, height: 50),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Jas Slim Navy',
                                      style: TextStyle(
                                          fontFamily: "InterBold",
                                          fontSize: 16)),
                                  Text('Rp 1.500.000',
                                      style: TextStyle(
                                          fontFamily: "InterBold",
                                          fontSize: 14,
                                          color: secondaryDark)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Ukuran Jas',
                          style:
                              TextStyle(fontFamily: "InterBold", fontSize: 14)),
                    ),
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: borderNormal)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('A. ',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: primaryBlue)),
                                      Text('50 cm',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: textSubdued)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('E. ',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: primaryBlue)),
                                      Text('50 cm',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: textSubdued)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('B. ',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: primaryBlue)),
                                      Text('50 cm',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: textSubdued)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('F. ',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: primaryBlue)),
                                      Text('42 cm',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: textSubdued)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('C. ',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: primaryBlue)),
                                      Text('57 cm',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: textSubdued)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('G. ',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: primaryBlue)),
                                      Text('36 cm',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: textSubdued)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('D. ',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: primaryBlue)),
                                      Text('50 cm',
                                          style: TextStyle(
                                              fontFamily: "InterRegular",
                                              fontSize: 12,
                                              color: textSubdued)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Pilih Bahan Jas',
                          style:
                              TextStyle(fontFamily: "InterBold", fontSize: 14)),
                    ),
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: borderNormal)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: DropdownMenu<String>(
                          textStyle: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 12,
                              color: textBody),
                          trailingIcon: RotatedBox(
                              quarterTurns: 1,
                              child: Image.asset(
                                  'assets/images/profil/icArrow.png',
                                  width: 50,
                                  height: 50)),
                          inputDecorationTheme: InputDecorationTheme(
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            constraints:
                                BoxConstraints.tight(const Size.fromHeight(40)),
                            border: InputBorder.none,
                          ),
                          width: 340,
                          initialSelection: materials[0],
                          onSelected: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          dropdownMenuEntries: materials
                              .map<DropdownMenuEntry<String>>((String item) {
                            return DropdownMenuEntry(value: item, label: item);
                          }).toList(),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Alamat Pengiriman',
                          style:
                              TextStyle(fontFamily: "InterBold", fontSize: 14)),
                    ),
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: borderNormal)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Perumahan Midtown Residence No. F3, Karang \nBawang, Grendeng, Purwokerto Utara, Banyumas \nRegency, Central Java 12345',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textSubdued)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Pilih Kurir',
                          style:
                              TextStyle(fontFamily: "InterBold", fontSize: 14)),
                    ),
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: borderNormal)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: 1,
                                        onChanged: (value) {},
                                        activeColor: Colors.green,
                                      ),
                                      Image.asset(
                                        'assets/images/detailProduk/jne.png',
                                        width: 50,
                                      )
                                    ],
                                  ),
                                  Text('Rp 20.000',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: secondaryDark))
                                ],
                              ),
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 0,
                                        groupValue: 1,
                                        onChanged: (value) {},
                                        activeColor: Colors.green,
                                      ),
                                      Image.asset(
                                        'assets/images/detailProduk/jnt.png',
                                        width: 50,
                                      )
                                    ],
                                  ),
                                  Text('Rp 19.000',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: secondaryDark))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Pilih Metode Pembayaran',
                          style:
                              TextStyle(fontFamily: "InterBold", fontSize: 14)),
                    ),
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: borderNormal)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: 1,
                                        onChanged: (value) {},
                                        activeColor: Colors.green,
                                      ),
                                      Image.asset(
                                        'assets/images/detailProduk/bca.png',
                                        width: 50,
                                      )
                                    ],
                                  ),
                                  Text('Bank BCA',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textBody))
                                ],
                              ),
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 0,
                                        groupValue: 1,
                                        onChanged: (value) {},
                                        activeColor: Colors.green,
                                      ),
                                      Image.asset(
                                        'assets/images/detailProduk/mandiri.png',
                                        width: 50,
                                      )
                                    ],
                                  ),
                                  Text('Bank Mandiri',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textBody))
                                ],
                              ),
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
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 0,
                                        groupValue: 1,
                                        onChanged: (value) {},
                                        activeColor: Colors.green,
                                      ),
                                      Image.asset(
                                        'assets/images/detailProduk/bni.png',
                                        width: 50,
                                      )
                                    ],
                                  ),
                                  Text('Bank BNI',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textBody))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Rincian Belanja',
                          style:
                              TextStyle(fontFamily: "InterBold", fontSize: 14)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Barang',
                            style: TextStyle(
                                fontFamily: "InterRegular",
                                fontSize: 14,
                                color: textSubdued)),
                        Text('Rp 1.500.000',
                            style: TextStyle(
                                fontFamily: "InterRegular",
                                fontSize: 14,
                                color: textSubdued)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ongkos Kirim',
                            style: TextStyle(
                                fontFamily: "InterRegular",
                                fontSize: 14,
                                color: textSubdued)),
                        Text('Rp 20.000',
                            style: TextStyle(
                                fontFamily: "InterRegular",
                                fontSize: 14,
                                color: textSubdued)),
                      ],
                    ),
                    Divider(
                      color: borderNormal,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Harga',
                            style: TextStyle(
                                fontFamily: "InterRegular",
                                fontSize: 14,
                                color: textHead)),
                        Text('Rp 1.520.000',
                            style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 14,
                                color: secondaryDark)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailPayment())));
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Bayar Sekarang",
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
