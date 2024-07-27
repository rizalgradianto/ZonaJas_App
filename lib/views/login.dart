import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/main_container.dart';
import 'package:zonajas/views/register.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailCon = TextEditingController();
  final passCon = TextEditingController();

  Future<void> login(String email, String pass) async {
    try {
      final creds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainContainerView()));
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An error occurred. Please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/HeaderLogin.png"),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "InterMedium",
                    color: textBody,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 20, left: 20),
                child: TextFormField(
                  controller: emailCon,
                  style: TextStyle(
                      fontFamily: "InterRegular",
                      fontSize: 14,
                      color: textHead),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    hintText: "Masukkan alamat email Anda",
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
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "InterMedium",
                    color: textBody,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 20, left: 20),
                child: TextFormField(
                  controller: passCon,
                  obscureText: true,
                  style: TextStyle(
                      fontFamily: "InterRegular",
                      fontSize: 14,
                      color: textHead),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    hintText: "Masukkan password Anda",
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
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: GestureDetector(
                  onTap: () async {
                    await login(emailCon.text, passCon.text);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "InterBold",
                          fontSize: 16,
                          color: textWhite),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum memiliki akun? ",
                      style: TextStyle(fontFamily: "InterRegular", color: textBody),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterView()));
                      },
                      child: Text(
                        "Daftar Sekarang",
                        style:
                            TextStyle(fontFamily: "InterSemiBold", color: textLink),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
