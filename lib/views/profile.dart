import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/login.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileView createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  List profileMenus = [
    {
      'icon': 'assets/images/profil/icTentang.png',
      'title': 'Tentang Kami',
    },
    {
      'icon': 'assets/images/profil/icKebijakan.png',
      'title': 'Kebijakan Privasi',
    },
    {
      'icon': 'assets/images/profil/icKetentuan.png',
      'title': 'Ketentuan Layanan',
    },
    {
      'icon': 'assets/images/profil/icPengaturan.png',
      'title': 'Pengaturan Akun',
    },
    {
      'icon': 'assets/images/profil/icNotif.png',
      'title': 'Notifikasi',
    },
    {
      'icon': 'assets/images/profil/icKeamanan.png',
      'title': 'Keamanan Akun',
    },
    {
      'icon': 'assets/images/profil/icBantuan.png',
      'title': 'Bantuan dan Laporan',
    },
    {
      'icon': 'assets/images/profil/icBeriNilai.png',
      'title': 'Beri Kami Nilai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
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

          if (!snapshot.hasData) {
            return const Center(
              child: Text('No data found'),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return Column(
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
                        child: Text('Profil',
                            style: TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 18,
                                color: textWhite)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 54, right: 20),
                    child: Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () async {
                            // try {
                            //   final User? firebaseUser =
                            //       await FirebaseAuth.instance.currentUser;

                            //   if (firebaseUser != null) {
                            //     FirebaseAuth.instance
                            //         .signOut()
                            //         .then((value) => {
                            //               Navigator.pushAndRemoveUntil(
                            //                   context,
                            //                   MaterialPageRoute(
                            //                       builder: (context) =>
                            //                           const LoginView()),
                            //                   (route) => false)
                            //             });
                            //   }
                            // } catch (e) {
                            //   print(e);
                            // }
                            showModalBottomSheet<void>(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10.0),
                                  ),
                                ),
                                backgroundColor: neutralWhite,
                                elevation: 0.0,
                                builder: ((BuildContext context) {
                                  return SizedBox(
                                    height: 240,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(30),
                                          child: Image.asset(
                                            'assets/images/profil/Logout.png',
                                            height: 52,
                                            width: 52,
                                          ),
                                        ),
                                        Text(
                                            'Apakah anda yakin untuk keluar\ndari akun?',
                                            style: TextStyle(
                                                fontFamily: "InterBold",
                                                fontSize: 16,
                                                color: textHead),
                                            textAlign: TextAlign.center),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Card(
                                                elevation: 0.0,
                                                color: neutralWhite,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: BorderSide(
                                                        color: borderDarkest)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 12,
                                                      horizontal: 64),
                                                  child: Text('Kembali',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "InterBold",
                                                          fontSize: 14,
                                                          color: textHead)),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                try {
                                                  final User? firebaseUser =
                                                      await FirebaseAuth
                                                          .instance.currentUser;

                                                  if (firebaseUser != null) {
                                                    FirebaseAuth.instance
                                                        .signOut()
                                                        .then((value) => {
                                                              Navigator.pushAndRemoveUntil(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const LoginView()),
                                                                  (route) =>
                                                                      false)
                                                            });
                                                  }
                                                } catch (e) {
                                                  print(e);
                                                }
                                              },
                                              child: Card(
                                                elevation: 0.0,
                                                color: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 12,
                                                      horizontal: 64),
                                                  child: Text('Keluar',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "InterBold",
                                                          fontSize: 14,
                                                          color: textWhite)),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }));
                          },
                          child: Image.asset(
                              'assets/images/profil/icLogout.png',
                              height: 38,
                              width: 38),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Card(
                      elevation: 0.0,
                      color: neutralWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/profil/avatar.png',
                              height: 70,
                              width: 70,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data['name']}',
                                    style: TextStyle(
                                        fontFamily: "InterBold",
                                        fontSize: 16,
                                        color: textHead)),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/profil/icPhone.png',
                                      width: 14,
                                    ),
                                    Text('${data['phone']}',
                                        style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 12,
                                            color: textSubdued)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/profil/icEmail.png',
                                      width: 14,
                                    ),
                                    Text('${data['email']}',
                                        style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 12,
                                            color: textSubdued)),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/profil/icEdit.png',
                                      width: 14,
                                    ),
                                    Text('Edit',
                                        style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 12,
                                            color: textLink)),
                                  ],
                                ),
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
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Use this to fit content in the Column
                          children: profileMenus.map((menu) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      menu['icon'],
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      menu['title'],
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          color: textHead),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/images/profil/icArrow.png',
                                      width: 24,
                                    )
                                  ],
                                ),
                                Divider(
                                  color: borderNormal,
                                  height: 20,
                                  thickness: 1,
                                  indent: 36,
                                  endIndent: 36,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
