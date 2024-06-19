import 'package:flutter/material.dart';

void main() {
  runApp(RidingPage());
}

class RidingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RidingToursPage(),
    );
  }
}

class RidingToursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riding'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Venice Image and Title
            Stack(
              children: [
                Image.asset(
                    'assets/images/rideov2.jpg'), // Replace with your asset
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Riding',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Egypt',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Tour Items
            TourItem(
              image: 'assets/images/rideov.jpg', // Replace with your asset
              title: "Horse Ride at the Pyramids of Giza",
              description: 'Sightseeing Tour',
              price: 200,
              timeSlots: ['7:00 am', '7:00 pm'],
            ),
            TourItem(
              image: 'assets/images/camelride.jpg', // Replace with your asset
              title: 'Camel Ride at the Pyramids of Giza',
              description: 'Sightseeing Tour',
              price: 250,
              timeSlots: ['7:00 am', '7:00 pm'],
            ),
            TourItem(
              image: 'assets/images/quadride.jpg', // Replace with your asset
              title: 'Pyramids Quad Bike Adventure',
              description: 'Sightseeing Tour',
              price: 400,
              timeSlots: ['7:00 am', '6:00 pm'],
            ),
          ],
        ),
      ),
    );
  }
}

class TourItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int price;
  final List<String> timeSlots;

  TourItem({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.timeSlots,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image), // Tour image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(description),
                  SizedBox(height: 8),
                  Text('\EGP $price per person'),
                  SizedBox(height: 8),
                  Row(
                    children: timeSlots
                        .map((time) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Chip(
                                label: Text(time),
                              ),
                            ))
                        .toList(),
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
