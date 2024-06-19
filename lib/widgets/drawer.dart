import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharaoh_quset/screens/login/login_screen.dart';
import 'package:pharaoh_quset/screens/pages/profile_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  Future<Map<String, dynamic>?> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();
      return userDoc.data() as Map<String, dynamic>?;
    }
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<Map<String, dynamic>?>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading user data'));
          }
          var userData = snapshot.data;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(userData?['Name'] ?? 'Name not available'),
                accountEmail: Text(userData?['Email'] ?? 'Email not available'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset('assets/images/avatar.jpg'),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  image: DecorationImage(
                    image: AssetImage("assets/images/drawerBG.avif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Profile"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Messages"),
                onTap: () => print("Messages tapped"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () => print("Settings tapped"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log out"),
                onTap: () => signOut(context),
              ),
            ],
          );
        },
      ),
    );
  }
}



































// import 'package:flutter/material.dart';

// class NavBar extends StatelessWidget {
//   const NavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children:  [
//           UserAccountsDrawerHeader(
//             accountName: const Text("Omar Gaber"),
//             accountEmail:const  Text("omargaber469@gmail.com"),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(child:Image.asset('assets/images/avatar.jpg') ,),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.pinkAccent,
//               image: DecorationImage(image: AssetImage("assets/images/drawerBG.avif"), fit: BoxFit.cover)
//             ),
//           ),
//           ListTile(leading: Icon(Icons.account_circle),
//           title: Text("Profile"),
//           onTap: () => print ("Profile tapped"),),

//           ListTile(leading: Icon(Icons.message),
//           title: Text("Messages"),
//           onTap: () => print ("Messages tapped"),),

//           ListTile(leading: Icon(Icons.settings),
//           title: Text("Settings"),
//           onTap: () => print ("Settings tapped"),),

//           ListTile(leading: Icon(Icons.logout),
//           title: Text("Log out"),
//           onTap: () => print ("Logout tapped"),)
//         ],
//       ),
//     );
//   }
// }
