import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/pages/home_page.dart';
import 'package:pharaoh_quset/screens/pages/profile_page.dart';
import 'package:pharaoh_quset/screens/pages/search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  // Define the pages for each bottom navigation bar item
  final List<Widget> pages = [
    HomePage(),
    Searchpage(),
    ProfilePage(), // Replace MyProfilePage() with your profile page widget
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex], // Use the selected page based on currentIndex
      bottomNavigationBar: BottomNavigationBar(
        // either shifting to the left and right or fixed
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
