import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          UserAccountsDrawerHeader(
            accountName: const Text("Omar Gaber"),
            accountEmail:const  Text("omargaber469@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child:Image.asset('assets/images/avatar.jpg') ,),
            ),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(image: AssetImage("assets/images/drawerBG.avif"), fit: BoxFit.cover)
            ),
          ),
          ListTile(leading: Icon(Icons.account_circle),
          title: Text("Profile"),
          onTap: () => print ("Profile tapped"),),

          ListTile(leading: Icon(Icons.message),
          title: Text("Messages"),
          onTap: () => print ("Messages tapped"),),

          ListTile(leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () => print ("Settings tapped"),),

          ListTile(leading: Icon(Icons.logout),
          title: Text("Log out"),
          onTap: () => print ("Logout tapped"),)
        ],
      ),
    );
  }
}
