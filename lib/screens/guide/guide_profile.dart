import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharaoh_quset/screens/login/login_screen.dart';

class GuideProfilePage extends StatefulWidget {
  @override
  _GuideProfilePageState createState() => _GuideProfilePageState();
}

class _GuideProfilePageState extends State<GuideProfilePage> {
  User? user;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .get();
      setState(() {
        userData = userDoc.data() as Map<String, dynamic>?;
      });
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(userData!['profilePictureUrl'] ?? ''),
                  ),
                  SizedBox(height: 16),
                  Text(
                    userData!['Name'] ?? 'Name not available',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(userData!['Email'] ?? 'Email not available'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(userData!['PhoneNumber'] ??
                        'Phone number not available'),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => signOut(context),
                    child: Text('Sign Out'),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 16),
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white.withOpacity(0.10),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
