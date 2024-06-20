import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharaoh_quset/screens/pages/Events/events_details.dart';
import 'package:pharaoh_quset/screens/pages/cart.dart';
import 'package:pharaoh_quset/screens/pages/places/places_details.dart';
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
  final _firestore = FirebaseFirestore.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> events = {};
  Map<String, dynamic> places = {};
  Map<String, dynamic> trips = {};

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  var images = {
    "temple.jpg": "Temples",
    "riding.webp": "Riding",
    "Diving.jpg": "Diving",
    "food.jpg": "Food"
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
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
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
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
              controller: tabController,
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
              controller: tabController,
              children: [
                ListView.builder(
                  itemCount: places.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final key = places.keys.elementAt(index);
                    final data = places[key];
                    return getItems(data, true);
                  },
                ),
                ListView.builder(
                  itemCount: events.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final key = events.keys.elementAt(index);
                    final data = events[key];
                    return getItems(data, false);
                  },
                ),
                ListView.builder(
                  itemCount: trips.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final key = trips.keys.elementAt(index);
                    final data = trips[key];
                    return getItems(data, false);
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

  // Function to handle navigation to other pages from the bottom containers
  void _navigateToOtherPage(BuildContext context, String image) {
    Widget page;
    switch (image) {
      case "temple.jpg":
        page = TemplesPage();
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
        page = TemplesPage(); // Default case, you can handle it as needed
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<void> _fetchData() async {
    final eventsCollection = _firestore.collection("Events");
    final placesCollection = _firestore.collection("Places");
    final tripsCollection = _firestore.collection("Trips");

    final eventsSnapshot = await eventsCollection.get();
    final placesSnapshot = await placesCollection.get();
    final tripsSnapshot = await tripsCollection.get();

    setState(() {
      for (var doc in eventsSnapshot.docs) {
        events[doc.id] = doc.data();
      }

      for (var doc in placesSnapshot.docs) {
        places[doc.id] = doc.data();
      }

      for (var doc in tripsSnapshot.docs) {
        trips[doc.id] = doc.data();
      }
    });
  }

  Widget getItems(Map<String, dynamic> itemData, bool isPlaces) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => isPlaces
                ? PlacesDetails(args: itemData)
                : EventsDetails(args: itemData),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15, top: 10),
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            itemData["imageUrl"]!,
            fit: BoxFit.cover,
          ),
        ),
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
