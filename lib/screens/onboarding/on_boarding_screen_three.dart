import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/guide/guide_page.dart';
import 'package:pharaoh_quset/screens/login/login_screen.dart';
import 'package:pharaoh_quset/src/home_screen.dart';

// dih el hate3mel fiha comment w tektebha men el awel
class OnBoardingScreenThree extends StatelessWidget {
  const OnBoardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/3.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            // top: 170,
            right: 30,
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                "Egypt, where\nhistory meets\nadventure",
                style: TextStyle(
                  color: const Color(0xFFFFFFFF).withOpacity(0.8),
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "PharaohQuest",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Oswald",
                        fontStyle: FontStyle.normal,
                        height: 0,
                        letterSpacing: 8,
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                // 320
                height: 370,
              ),
              Row(
                children: [
                  const SizedBox(
                    // 260
                    width: 290,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () async {
                        if (FirebaseAuth.instance.currentUser == null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        } else {
                          final userDoc = await FirebaseFirestore.instance
                              .collection("Users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .get();
                          final userType = userDoc.data()!["Type"];
                          if (userType == "User") {
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyHomePage()));
                            }
                          } else {
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const GuidePage()));
                            }
                          }
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
