import 'package:flutter/material.dart';
import 'package:zonajas/utils/colors.dart';
import 'package:zonajas/views/login.dart';

List onboardingData = [
  {
    "image": "assets/images/Onboarding1.png",
    "title": "Temukan Berbagai Jenis Jas \nyang Cocok Denganmu",
    "desc":
        "Kami menyediakan berbagai pilihan untuk memastikan Anda tampil memukau di setiap kesempatan",
  },
  {
    "image": "assets/images/Onboarding2.png",
    "title": "Fitur Augmented Reality untuk Melihat Jas Lebih Nyata",
    "desc":
        "Rasakan pengalaman berbelanja yang revolusioner dengan fitur Augmented Reality kami.",
  },
];

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingView();
}

class _OnboardingView extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (_, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(onboardingData[i]['image']),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              onboardingData[i]['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "InterBold",
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              onboardingData[i]['desc'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "InterRegular",
                                fontSize: 16,
                                color: textSubdued,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Column(
            children: [
              Wrap(
                spacing: 8,
                children: List.generate(onboardingData.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color:
                          currentPage == index ? primaryLight : neutralGreyDark,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    width: currentPage == index ? 30 : 10,
                    height: 10,
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (currentPage == onboardingData.length - 1) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LoginView(),
                        ),
                      );
                    } else {
                      pageController.animateToPage(
                        currentPage + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut,
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      currentPage == onboardingData.length - 1
                          ? "Mulai Sekarang"
                          : "Lanjutkan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "InterBold",
                        fontSize: 16,
                        color: textWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
