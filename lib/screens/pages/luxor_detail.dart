import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharaoh_quset/screens/pages/cart.dart';
import 'package:pharaoh_quset/screens/pages/cart_items.dart';
import 'package:pharaoh_quset/widgets/app_button.dart';
import 'package:pharaoh_quset/widgets/responsive_button.dart';
import 'package:provider/provider.dart';

class LuxorDetailPage extends StatefulWidget {
  const LuxorDetailPage({super.key});

  @override
  State<LuxorDetailPage> createState() => _LuxorDetailPageState();
}

class _LuxorDetailPageState extends State<LuxorDetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/trip2.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    280, // Adjust height to allow scrolling
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom:
                            80), // Add padding to avoid overlap with buttons
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Luxor",
                              style: GoogleFonts.ebGaramond(fontSize: 20),
                            ),
                            const Text(
                              "6000 EGP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Egypt, Giza",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < gottenStars
                                      ? Colors.yellow
                                      : Colors.grey,
                                );
                              }),
                            ),
                            const Text(
                              "(4.0)",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "People",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                        const Text(
                          "Number of people",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.2),
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.2),
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Day 1\nEnjoy your breakfast. Nile Empire’s Egyptologist guide will pick you up from the hotel to visit the East Bank in Luxor. Start your tour by visiting The Karnak Temples on the East bank, which was dedicated to God Amon, which has the largest place of worship ever built\nThen proceed to visit the Luxor Temple of King Amenhotep III, which has one of the tallest obelisks in the world. Then you will be driven to Luxor airport for your flight to Cairo and you will be met at the airport and taken to your hotel. Overnight in Cairo.\n",
                          style: GoogleFonts.robotoCondensed(
                              color: const Color.fromARGB(255, 95, 95, 95)),
                        ),
                        // Additional description content
                        Text(
                          "Day2\n Once you arrive in Luxor city, the driver will be waiting for you to assist you and transfer you to your hotel in Luxor and check-in easily.\nProceed to visit the royal cemetery for 62 Pharaohs, Valley of the Kings, then to the mortuary Temple of Queen Hatshepsut, which was built by the architects of the New Kingdom Pharaoh Hatshepsut approximately in the 15th century BC. Proceeding to the Colossi of Memnon. Later you will be transferred to your hotel in Luxor. Overnight in Luxor.\n",
                          style: GoogleFonts.robotoCondensed(
                              color: const Color.fromARGB(255, 95, 95, 95)),
                        ),
                        Text(
                          "Day3\nAt the hotel, you will have breakfast before being transferred to the Cairo International Airport to depart.\n",
                          style: GoogleFonts.robotoCondensed(
                              color: const Color.fromARGB(255, 95, 95, 95)),
                        ),
                        Text(
                          "Included",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "\u2022 Pickup and drop off service by our representatives at airports.\n\u2022 All transfers by a private air-conditioned vehicle.\n\u2022 Accommodation in Luxor for 3 nights including daily breakfast 4-stars hotel.\n\u2022 All sightseeing tours as mentioned in the itinerary (Private Tours).\n\u2022 English speaking tour guide.\n\n\n"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    size: 60,
                    color: Colors.grey,
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(width: 20),
                  ResponsiveButton(
                    isResponsive: true,
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .add(Item("Luxor", 8000, "assets/images/trip2.jpeg"));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
