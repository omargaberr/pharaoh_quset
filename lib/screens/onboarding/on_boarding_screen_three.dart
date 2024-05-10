import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/onboarding/on_boarding_screen_one.dart';

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
                height: 320,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 260,
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
                              builder: (context) => const OnBoardingScreenOne(),
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
      ),
    );
  }
}
