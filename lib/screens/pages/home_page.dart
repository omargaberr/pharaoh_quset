import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharaoh_quset/screens/pages/cart.dart';
import 'package:pharaoh_quset/screens/pages/cruise_detail.dart';
import 'package:pharaoh_quset/screens/pages/dahab_detail.dart';
import 'package:pharaoh_quset/screens/pages/djoser_detail.dart';
import 'package:pharaoh_quset/screens/pages/exhibition_detail.dart';
import 'package:pharaoh_quset/screens/pages/kingtut_detail.dart';
import 'package:pharaoh_quset/screens/pages/luxor_detail.dart';
import 'package:pharaoh_quset/screens/pages/museum_detail.dart';
import 'package:pharaoh_quset/screens/pages/party_detail.dart';
import 'package:pharaoh_quset/screens/pages/pyramid_detail.dart';
import 'package:pharaoh_quset/screens/pages/temples.dart'; // Import the temple page
import 'package:pharaoh_quset/screens/pages/riding.dart'; // Import the riding page
import 'package:pharaoh_quset/screens/pages/diving.dart'; // Import the diving page
import 'package:pharaoh_quset/screens/pages/food.dart'; // Import the food page
import 'package:pharaoh_quset/widgets/drawer.dart'; // Import the NavBar class

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var images = {
    "temple.jpg": "Temples",
    "riding.webp": "Riding",
    "Diving.jpg": "Diving",
    "food.jpg": "Food"
  };

  // List of pyramid images
  var pyramidImages = ["pyramid1.jpg", "pyramid4.jpg", "pyramid3.jpg"];

  // List of event images
  var eventImages = ["event1.jpg", "event2.jpg", "event3.webp"];

  // List of trip images
  var tripImages = ["trip1.webp", "trip2.jpeg", "trip3.jpg"];

  void _navigateToDetailPage(BuildContext context, String image) {
    Widget page;
    switch (image) {
      case "pyramid1.jpg":
        page = PyramidDetailPage();
        break;
      case "pyramid4.jpg":
        page = MuseumDetailPage();
        break;
      case "pyramid3.jpg":
        page = DjoserDetailPage();
        break;

      case "event1.jpg":
        page = KingTutDetailPage();
        break;
      case "event2.jpg":
        page = PartyDetailPage();
        break;
      case "event3.webp":
        page = ExhibitionDetailPage();
        break;

      case "trip1.webp":
        page = CruiseDetailPage();
        break;
      case "trip2.jpeg":
        page = LuxorDetailPage();
        break;
      case "trip3.jpg":
        page = DahabDetailPage();
        break;

      default:
        page = PyramidDetailPage(); // Default case, you can handle it as needed
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // Function to handle navigation to other pages from the bottom containers
  void _navigateToOtherPage(BuildContext context, String image) {
    Widget page;
    switch (image) {
      case "temple.jpg":
        page = TemplePage();
        break;
      case "riding.webp":
        page = RidingPage();
        break;
      case "Diving.jpg":
        page = DivingPage();
        break;
      case "food.jpg":
        page = FoodPage();
        break;
      default:
        page = TemplePage(); // Default case, you can handle it as needed
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavBar(), // Use NavBar as the drawer
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 45, left: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, size: 30, color: Colors.black54),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                Expanded(child: Container()),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  color: Colors.grey.withOpacity(0.5),
                  iconSize: 50,
                  padding: const EdgeInsets.only(right: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "Discover",
              style: GoogleFonts.bebasNeue(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 10, right: 20),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: CircleTabIndicator(color: Colors.black, radius: 4),
              tabs: const [
                Tab(text: "Places"),
                Tab(text: "Events"),
                Tab(text: "Trips"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: pyramidImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToDetailPage(context, pyramidImages[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/${pyramidImages[index]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: eventImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToDetailPage(context, eventImages[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/${eventImages[index]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: tripImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToDetailPage(context, tripImages[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/${tripImages[index]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore more",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 92,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToOtherPage(context, images.keys.elementAt(index));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/${images.keys.elementAt(index)}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                          child: Text(
                            images.values.elementAt(index),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

































// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pharaoh_quset/src/home_screen.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   var images = {
//     "temple.jpg": "Temples",
//     "riding.webp": "Riding",
//     "Diving.jpg": "Diving",
//     "food.jpg": "Food"
//   };
//   var image = {"pyramid1.jpg", "pyramid2.jpg", "pyramid3"};
 

//   @override
//   Widget build(BuildContext context) {
//     TabController _tabController = TabController(length: 3, vsync: this);
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 45, left: 20),
//             child: Row(
//               children: [
//                 const Icon(Icons.menu, size: 30, color: Colors.black54),
//                 Expanded(child: Container()),
//                 Container(
//                   margin: const EdgeInsets.only(right: 20),
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey.withOpacity(0.5),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             // supposed to be 40 height
//             height: 20,
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 20),
//             child: (Text(
//               "Discover",
//               style: GoogleFonts.bebasNeue(
//                 fontSize: 35,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             )),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: TabBar(
//                 labelPadding: const EdgeInsets.only(left: 10, right: 20),
//                 controller: _tabController,
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.grey,
//                 isScrollable: true,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 indicator: CircleTabIndicator(color: Colors.black, radius: 4),
//                 tabs: [
//                   Tab(text: "Places"),
//                   Tab(text: "Events"),
//                   Tab(text: "Trips"),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(left: 20),
//             height: 300,
//             width: double.maxFinite,
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 ListView.builder(
//                   itemCount: 3,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       margin: const EdgeInsets.only(right: 15, top: 10),
//                       width: 200,
//                       height: 300,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                           image: const DecorationImage(
//                             image: AssetImage("assets/images/pyramid1.jpg"),
//                             fit: BoxFit.cover,
//                           )),
//                     );
//                   },
//                 ),
//                 Text("Farida"),
//                 Text("MOe"),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Explore more",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "See all",
//                   style: TextStyle(color: Colors.black54),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(
//             height: 92,
//             width: double.maxFinite,
//             margin: const EdgeInsets.only(left: 20),
//             child: ListView.builder(
//                 itemCount: 4,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (_, index) {
//                   return Container(
//                     margin: const EdgeInsets.only(right: 30),
//                     child: Column(
//                       children: [
//                         Container(
//                           // margin: const EdgeInsets.only(right: 50),
//                           width: 70,
//                           height: 70,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.white,
//                               image: DecorationImage(
//                                 image: AssetImage("assets/images/" +
//                                     images.keys.elementAt(index)),
//                                 fit: BoxFit.cover,
//                               )),
//                         ),
//                         SizedBox(
//                           height: 22,
//                           child: Container(
//                             child: Text(
//                               images.values.elementAt(index),
//                               style: TextStyle(
//                                   color: Colors.black87, fontSize: 13),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CircleTabIndicator extends Decoration {
//   final Color color;
//   double radius;
//   CircleTabIndicator({required this.color, required this.radius});

//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     // TODO: implement createBoxPainter
//     return _CirclePainter(color: color, radius: radius);
//   }
// }

// class _CirclePainter extends BoxPainter {
//   final Color color;
//   double radius;
//   _CirclePainter({required this.color, required this.radius});

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     Paint _paint = Paint();
//     _paint.color = color;
//     _paint.isAntiAlias = true;
//     final Offset circleOffset = Offset(
//         configuration.size!.width / 2 - radius / 2,
//         configuration.size!.height - radius);
//     canvas.drawCircle(offset + circleOffset, radius, _paint);
//   }
// }
