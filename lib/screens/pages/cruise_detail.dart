// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pharaoh_quset/screens/pages/cart.dart';
// import 'package:pharaoh_quset/screens/pages/cart_items.dart';
// import 'package:pharaoh_quset/widgets/app_button.dart';
// import 'package:pharaoh_quset/widgets/responsive_button.dart';
// import 'package:provider/provider.dart';

// class CruiseDetailPage extends StatefulWidget {
//   const CruiseDetailPage({super.key});

//   @override
//   State<CruiseDetailPage> createState() => _CruiseDetailPageState();
// }

// class _CruiseDetailPageState extends State<CruiseDetailPage> {
//   int gottenStars = 4;
//   int selectedIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.maxFinite,
//         height: double.maxFinite,
//         child: Stack(
//           children: [
//             Positioned(
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   width: double.maxFinite,
//                   height: 300,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                     image: AssetImage("assets/images/trip1.webp"),
//                     fit: BoxFit.cover,
//                   )),
//                 )),
//             Positioned(
//                 left: 20,
//                 top: 40,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.menu),
//                     )
//                   ],
//                 )),
//             Positioned(
//                 top: 280,
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
//                   width: MediaQuery.of(context).size.width,
//                   height: 500,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                       )),
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 80),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Nile Cruise",
//                                 style: GoogleFonts.ebGaramond(fontSize: 20),
//                               ),
//                               const Text(
//                                 "10000 EGP",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 15),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Egypt,Giza",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             children: [
//                               Wrap(
//                                 children: List.generate(5, (index) {
//                                   return Icon(
//                                     Icons.star,
//                                     color: index < gottenStars
//                                         ? Colors.yellow
//                                         : Colors.grey,
//                                   );
//                                 }),
//                               ),
//                               Text(
//                                 "(4.0)",
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             "People",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 21),
//                           ),
//                           Text(
//                             "Number of people",
//                             style: TextStyle(color: Colors.grey, fontSize: 15),
//                           ),
//                           SizedBox(height: 10),
//                           Wrap(
//                               children: List.generate(5, (index) {
//                             return InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   selectedIndex = index;
//                                 });
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.only(right: 10),
//                                 child: AppButtons(
//                                   size: 50,
//                                   color: selectedIndex == index
//                                       ? Colors.white
//                                       : Colors.black,
//                                   backgroundColor: selectedIndex == index
//                                       ? Colors.black
//                                       : Colors.grey.withOpacity(0.2),
//                                   borderColor: selectedIndex == index
//                                       ? Colors.black
//                                       : Colors.grey.withOpacity(0.2),
//                                   text: (index + 1).toString(),
//                                 ),
//                               ),
//                             );
//                           })),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             "Description",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                           Text(
//                             "Discover Egypt’s timeless highlights with our exciting Egypt tour across the country. This is the most suitable trip if you’re looking for a tailored-made tour over the Nile River and railways.",
//                             style: GoogleFonts.robotoCondensed(
//                                 color: const Color.fromARGB(255, 95, 95, 95)),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 )),
//             Positioned(
//               bottom: 40,
//               left: 20,
//               right: 20,
//               child: Row(
//                 children: [
//                   AppButtons(
//                     size: 60,
//                     color: Colors.grey,
//                     backgroundColor: Colors.white,
//                     borderColor: Colors.grey,
//                     isIcon: true,
//                     icon: Icons.favorite_border,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   ResponsiveButton(
//                     isResponsive: true,
//                     onPressed: () {
//                       Provider.of<Cart>(context, listen: false).add(Item(
//                           "Nile Cruise", 10000, "assets/images/trip1.webp"));
//                     },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
