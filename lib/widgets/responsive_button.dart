import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  final VoidCallback? onPressed;  // Added onPressed callback

  ResponsiveButton({Key? key, this.width = 130, this.isResponsive = false, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onPressed,  // Handle tap
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text("Book Trip now", style: TextStyle(color: Colors.white)))
                  : Container(),
              Image.asset(
                "assets/images/button5.png",
              )
            ],
          ),
        ),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';

// class ResponsiveButton extends StatelessWidget {
//   bool? isResponsive;
//   double? width;
//   ResponsiveButton({key, this.width = 130, this.isResponsive = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Container(
//         width: isResponsive == true ? double.maxFinite : width,
//         height: 60,
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.black),
//         child: Row(
//           mainAxisAlignment: isResponsive == true
//               ? MainAxisAlignment.spaceBetween
//               : MainAxisAlignment.center,
//           children: [
//             isResponsive == true
//                 ? Container(
//                     margin: const EdgeInsets.only(left: 20),
//                     child: Text("Book Trip now",
//                         style: TextStyle(color: Colors.white)))
//                 : Container(),
//             Image.asset(
//               "assets/images/button5.png",
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
