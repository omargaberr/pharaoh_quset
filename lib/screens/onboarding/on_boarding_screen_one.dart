import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/onboarding/on_boarding_screen_two.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:pharaoh_quset/src/image_strings.dart';
// import 'package:pharaoh_quset/src/text_strings.dart';

class OnBoardingScreenOne extends StatelessWidget {
  const OnBoardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1.jpeg"),
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
                height: 170,
              ),
              const Text(
                "Unlock the \nwonders of Egypt\nwith ease",
                style: TextStyle(
                  color: Color(0xBd363857),
                  fontSize: 29,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "PharaohQuest",
                    style: TextStyle(
                        color: Color(0xff92775d),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Oswald",
                        fontStyle: FontStyle.normal,
                        height: 0,
                        letterSpacing: 6,
                        fontSize: 25.0),
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
                              builder: (context) => const OnBoardingScreenTwo(),
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
// Positioned(

// SmoothPageIndicator(controller: PageController(), count: 3 ),
// )

// PageView(
//   children: [
//     Column(
//       children: [
//         const Expanded(
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: Image(image: AssetImage(tOnBoardingImage1)),
//           ),
//         ),
//         Text(
//           tOnBoardingTitle1,
//           style: Theme.of(context).textTheme.headlineMedium,
//           textAlign: TextAlign.left,
//         ),
//         const SizedBox(
//           width: 320,
//           height: 111,
//           child: Text(
//             'Unlock the \nwonders of Egypt with ease',
//             style: TextStyle(
//               color: Color(0xBC363857),
//               fontSize: 29,
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w900,
//               height: 0,
//             ),
//           ),
//         ),
//         // Text(
//         //   tOnBoardingSubTitle1,
//         //   style: Theme.of(context).textTheme.bodyMedium,
//         //   textAlign: TextAlign.end,
//         // ),
//       ],
//     )
//   ],
// ),

// LiquidSwipe(
//   pages: [
//     Container(color: Colors.white),
//     Container(color: Colors.black),
//     Container(color: Colors.white),
//   ],
// )
//         ],
//       ),
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       children: [
//         PageView(
//           children: [
//             Column(
//               children: [
//                 const Expanded(
//                   child: FittedBox(
//                     fit: BoxFit.cover,
//                     child: Image(image: AssetImage(tOnBoardingImage2)),
//                   ),
//                 ),
//                 Text(
//                   tOnBoardingTitle2,
//                   style: Theme.of(context).textTheme.headlineMedium,
//                   textAlign: TextAlign.left,
//                 ),
//                 const SizedBox(),
//                 Text(
//                   tOnBoardingSubTitle2,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                   textAlign: TextAlign.end,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ],
//     ),
//   );
// }

//       body: SafeArea(
//         child: Column(
//           children: [
//             const Spacer(),
//             Image.asset(
//               'assets/images/1.jpeg',
//             ),
//             const Spacer(),
//             Text("Unlock the wonders of Egypt with ease",
//                 textAlign: TextAlign.left,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineMedium!
//                     .copyWith(fontWeight: FontWeight.w500)),
//             const SizedBox(
//               width: 328,
//               height: 44,
//               child: Text(
//                 "PharaohQuest",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xFF92765D),
//                   fontSize: 25,
//                   fontFamily: 'Oswald',
//                   fontWeight: FontWeight.w400,
//                   height: 0,
//                   letterSpacing: 7.50,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
