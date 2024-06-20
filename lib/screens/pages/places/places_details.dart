import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharaoh_quset/screens/pages/cart.dart';
import 'package:pharaoh_quset/screens/pages/cart_items.dart';
import 'package:pharaoh_quset/widgets/app_button.dart';
import 'package:pharaoh_quset/widgets/responsive_button.dart';
import 'package:provider/provider.dart';

class PlacesDetails extends StatefulWidget {
  final Map<String, dynamic> args;
  const PlacesDetails({super.key, required this.args});

  @override
  State<PlacesDetails> createState() => _PlacesDetailsState();
}

class _PlacesDetailsState extends State<PlacesDetails> {
  final _auth = FirebaseAuth.instance;
  late String name;
  late String description;
  late String location;
  late String imageUrl;
  int gottenStars = 4;
  int selectedIndex = -1;
  int numOfPeople = 1;
  int price = 0;
  int totalPrice = 0;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final List<String> language = [
    "English",
    "French",
    "German",
    "Italian",
    "Spanish"
  ];

  String? dropDownValue = 'English';

  @override
  void initState() {
    super.initState();
    name = widget.args["Name"]!;
    description = widget.args["Description"]!;
    location = widget.args["Location"]!;
    price = int.parse(widget.args["Price"]!);
    totalPrice = price;
    imageUrl = widget.args["imageUrl"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )),
                )),
            Positioned(
                left: 20,
                top: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    )
                  ],
                )),
            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: GoogleFonts.ebGaramond(fontSize: 20),
                            ),
                            Text(
                              "$totalPrice EGP",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              location,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Color(0xffd9d9d9),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (numOfPeople > 1) {
                                        numOfPeople--;
                                        totalPrice = price * numOfPeople;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 15,
                                  ),
                                ),
                              ),
                              Text(
                                numOfPeople.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Color(0xffd9d9d9),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      numOfPeople++;
                                      totalPrice = price * numOfPeople;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Wrap(
                        //     children: List.generate(5, (index) {
                        //   return InkWell(
                        //     onTap: () {
                        //       setState(() {
                        //         selectedIndex = index;
                        //       });
                        //     },
                        //     child: Container(
                        //       margin: const EdgeInsets.only(right: 10),
                        //       child: AppButtons(
                        //         size: 50,
                        //         color: selectedIndex == index
                        //             ? Colors.white
                        //             : Colors.black,
                        //         backgroundColor: selectedIndex == index
                        //             ? Colors.black
                        //             : Colors.grey.withOpacity(0.2),
                        //         borderColor: selectedIndex == index
                        //             ? Colors.black
                        //             : Colors.grey.withOpacity(0.2),
                        //         text: (index + 1).toString(),
                        //       ),
                        //     ),
                        //   );
                        // })),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Color(0xffd9d9d9),
                                    ),
                                  ),
                                  onPressed: () => _selectDate(context),
                                  child: const Text(
                                    'Select date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  selectedTime.format(context),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Color(0xffd9d9d9),
                                    ),
                                  ),
                                  onPressed: () => _selectTime(context),
                                  child: const Text(
                                    'Select Time',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Select tour language:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              DropdownButton(
                                value: dropDownValue,
                                items: language.map((String e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropDownValue = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          description,
                          style: GoogleFonts.robotoCondensed(
                            color: const Color.fromARGB(255, 95, 95, 95),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
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
                  const SizedBox(
                    width: 20,
                  ),
                  ResponsiveButton(
                    isResponsive: true,
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false).add(
                        Item(
                          _auth.currentUser!.uid,
                          name,
                          totalPrice.toDouble(),
                          imageUrl,
                          selectedDate,
                          selectedTime,
                          dropDownValue,
                          "Booked",
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}
