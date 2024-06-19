import 'package:flutter/material.dart';

void main() {
  runApp(DivingPage());
}

class DivingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DivingToursPage(),
    );
  }
}

class DivingToursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riding'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Stack(
              children: [
                Image.asset(
                    'assets/images/egydiv.webp'), 
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diving',
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
            
            TourItem(
              image: 'assets/images/bluediv.jpg', 
              title: "Dahab Diving",
              description: 'Diving Tour',
              price: 200,
              timeSlots: ['7:00 am', '7:00 pm'],
            ),
            TourItem(
              image: 'assets/images/sharmdiv.jpg', 
              title: 'Sharm el-Sheikh Diving',
              description: 'Diving Tour',
              price: 250,
              timeSlots: ['7:00 am', '7:00 pm'],
            ),
            TourItem(
              image: 'assets/images/hurgh.jpg', 
              title: 'Hurghada Diving',
              description: 'Diving Tour',
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
            Image.asset(image), 
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
