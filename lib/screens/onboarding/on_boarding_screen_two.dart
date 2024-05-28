import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/onboarding/on_boarding_screen_three.dart';

class OnBoardingScreenTwo extends StatelessWidget {
  const OnBoardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          right: 30,
          left: 15,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/2.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              // 430
              height: 490,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "PharaohQuest",
                  style: TextStyle(
                      color: (Color(0xFF363857)),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Oswald",
                      fontStyle: FontStyle.normal,
                      letterSpacing: 8,
                      fontSize: 23),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              // 50
              height: 50,
            ),
            Text(
              "Book your whole\ntrip and activities\nnow",
              style: TextStyle(
                color: const Color(0xFFFFFFFF).withOpacity(0.8),
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  // 260
                  width: 295,
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
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnBoardingScreenThree(),
                          ));
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
    );
  }
}
