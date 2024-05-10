import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharaoh_quset/screens/onboarding/on_boarding_screen_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const OnBoardingScreen(),
  //         ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/images/Pharoahvid8.mp4.lottie.json',
            fit: BoxFit.cover),
      ),
      nextScreen: const OnBoardingScreenOne(),
      duration: 3000,
      backgroundColor: const Color(0xffff5f45),
      splashIconSize: 20000,
    );
  }
}





// import 'package:video_player/video_player.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//       '\assests\images\Pharoahvid.mp4.lottie.json'
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setVolume(0.0);
//     _playvideo();
//   }

//   void _playvideo() async {
//     _controller.play();
//     await Future.delayed(const Duration(seconds: 2));
//     Navigator.pushNamed(context, '/');
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ));
//   }
// }
