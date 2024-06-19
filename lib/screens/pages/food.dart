import 'package:flutter/material.dart';

void main() {
  runApp(FoodPage());
}

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodToursPage(),
    );
  }
}

class FoodToursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Venice Image and Title
            Stack(
              children: [
                Image.asset(
                    'assets/images/foodegy.png'), // Replace with your asset
                const Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dining',
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
              image: 'assets/images/qasrkabab.jpg', 
              title: "Qasr Elkababgi",
              description: 'Dining Place',
              price: 1000,
              timeSlots: const ['10:00 am', '3:00 am'],
            ),
            TourItem(
              image: 'assets/images/abotarek.jpeg', 
              title: 'Koshary Abou Tarek',
              description: 'Dining Place',
              price: 100,
              timeSlots: const ['7:00 am', '12:00 am'],
            ),
            TourItem(
              image: 'assets/images/tantfood.jpg', 
              title: 'Tant',
              description: 'Dining Place',
              price: 1000,
              timeSlots: const ['9:00 am', '1:00 am'],
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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(description),
                  const SizedBox(height: 8),
                  Text('\EGP $price per person'),
                  const SizedBox(height: 8),
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
