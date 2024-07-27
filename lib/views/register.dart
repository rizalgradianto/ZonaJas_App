import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zonajas/utils/colors.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> register(
    String email, String phone, String pass, String name) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );

    User? user = userCredential.user;
    String uid = user!.uid;

    try {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'phone': phone,
        'bookmarks': [],
      });
    } catch (e) {
      // Handle the error specific to the Firestore write operation
      print('Error writing to Firestore: $e');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      throw 'The account already exists for that email.';
    }
  } catch (e) {
    print(e);
    throw e;
  }
}

class RegisterView extends StatefulWidget {
  @override
  _RegisterView createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
  final nameCon = TextEditingController();
  final emailCon = TextEditingController();
  final phoneCon = TextEditingController();
  final passCon = TextEditingController();
  final confirmPassCon = TextEditingController();

  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/HeaderRegis.png"),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Nama Lengkap",
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
                        controller: nameCon,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: "Nama Lengkap",
                          hintStyle: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 14,
                              color: textDisable),
                          filled: true,
                          fillColor: greyForm,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Alamat Email",
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
                        controller: emailCon,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: "Alamat Email",
                          hintStyle: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 14,
                              color: textDisable),
                          filled: true,
                          fillColor: greyForm,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "No Telpon",
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
                        controller: phoneCon,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: "No Telepon",
                          hintStyle: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 14,
                              color: textDisable),
                          filled: true,
                          fillColor: greyForm,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Kata Sandi",
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
                        controller: passCon,
                        obscureText: true,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: "Kata Sandi",
                          hintStyle: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 14,
                              color: textDisable),
                          filled: true,
                          fillColor: greyForm,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Kata Sandi",
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
                        controller: confirmPassCon,
                        obscureText: true,
                        style: TextStyle(
                            fontFamily: "InterRegular",
                            fontSize: 14,
                            color: textHead),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: "Konfirmasi Kata Sandi",
                          hintStyle: TextStyle(
                              fontFamily: "InterRegular",
                              fontSize: 14,
                              color: textDisable),
                          filled: true,
                          fillColor: greyForm,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: BorderSide(color: primaryBlue)),
                              side: BorderSide(color: textSubdued),
                              activeColor: Colors.green,
                              value: isConfirmed,
                              onChanged: (bool? value) {
                                setState(() {
                                  isConfirmed = value!;
                                });
                              }),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Dengan mendaftar, anda berarti menyetujui',
                                  style: TextStyle(
                                      fontFamily: "InterRegular",
                                      fontSize: 12,
                                      color: textHead)),
                              Row(
                                children: [
                                  Text('kebijakan ketentuan layanan ',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textSubdued)),
                                  Text('dan',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textHead)),
                                  Text('kebijakan privasi',
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          color: textSubdued))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: GestureDetector(
                        onTap: () async {
                          if (isConfirmed) {
                            if (passCon.text != confirmPassCon.text ||
                                passCon.text.isEmpty ||
                                confirmPassCon.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Kata sandi tidak sesuai'),
                                ),
                              );
                            } else {
                              register(emailCon.text, phoneCon.text,
                                      passCon.text, nameCon.text)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Registrasi berhasil'),
                                  ),
                                );
                                Navigator.pop(context);
                              }).catchError((e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.toString()),
                                  ),
                                );
                              });
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Anda harus menyetujui syarat dan ketentuan'),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Daftar Sekarang",
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
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sudah memiliki akun? ",
                style: TextStyle(fontFamily: "InterRegular", color: textBody),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Login",
                  style:
                      TextStyle(fontFamily: "InterSemiBold", color: textLink),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

// Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//               controller: nameCon,
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//               controller: emailCon,
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Phone',
//               ),
//               controller: phoneCon,
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//               controller: passCon,
//             ),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Confirm Password',
//               ),
//               obscureText: true,
//               controller: confirmPassCon,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
                // if (passCon.text != confirmPassCon.text) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Password does not match'),
                //     ),
                //   );
                // } else {
                //   register(emailCon.text, phoneCon.text, passCon.text,
                //           nameCon.text)
                //       .then((value) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         content: Text('Register success'),
                //       ),
                //     );
                //     Navigator.pop(context);
                //   }).catchError((e) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         content: Text(e.toString()),
                //       ),
                //     );
                //   });
                // }
//               },
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),