import 'package:flutter/material.dart';

void main() {
  runApp(TemplesPage());
}

class TemplesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TempleToursPage(),
    );
  }
}

class TempleToursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temples'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Venice Image and Title
            Stack(
              children: [
                Image.asset(
                    'assets/images/templesov.webp'), // Replace with your asset
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temples',
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
              image:
                  'assets/images/luxor temple.jpeg', // Replace with your asset
              title: "Luxor Temple",
              description: 'Sightseeing Tour',
              price: 30,
              timeSlots: ['7:00 am', '5:00 pm'],
            ),
            TourItem(
              image: 'assets/images/edfu.jpg', // Replace with your asset
              title: 'Edfu Temple',
              description: 'Sightseeing Tour',
              price: 210,
              timeSlots: ['11:00 am', '1:00 pm'],
            ),
            TourItem(
              image: 'assets/images/kalabsha.jpg', // Replace with your asset
              title: 'Kalabsha Temple',
              description: 'Sightseeing Tour',
              price: 150,
              timeSlots: ['7:00 am', '4:00 pm'],
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
