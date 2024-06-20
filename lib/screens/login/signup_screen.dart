import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharaoh_quset/auth_service/auth_service.dart';
import 'package:pharaoh_quset/screens/guide/guide_page.dart';
import 'package:pharaoh_quset/src/home_screen.dart';
import 'package:pharaoh_quset/utils/utils.dart';
import 'dart:io';
import 'package:uuid/uuid.dart'; // Import the Uuid package

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Auth auth = Auth();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  File? _guideImage;

  final List<String> type = ["User", "Guide"];
  final List<String> guideLanguages = [
    "arabic",
    "English",
    "Spanish",
    "French",
    "German",
    "Italian",
  ];
  String? dropDownValue = 'User';
  String? guideLanguageValue;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _guideImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final fileName = Uuid().v4(); // Generate a unique filename using Uuid
      final ref = storage.ref().child('guideverify/$fileName.jpg');
      final uploadTask = ref.putFile(image);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      showSnackBar(context, "Failed to upload image: $e");
      return null;
    }
  }

  bool _validateForm(
      String email, String password, String name, String phoneNumber) {
    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        phoneNumber.isEmpty) {
      showSnackBar(context, "Some field(s) is empty");
      return false;
    }
    if (dropDownValue == "Guide" && _guideImage == null) {
      showSnackBar(context, "Please upload a guide verification image");
      return false;
    }
    return true;
  }

  void signUp(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final name = _nameController.text.trim();

    if (!_validateForm(email, password, name, phoneNumber)) {
      return;
    }

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String? imageUrl;
      if (dropDownValue == "Guide" && _guideImage != null) {
        imageUrl = await _uploadImage(_guideImage!);
      }

      final users = firestore.collection("Users");
      await users.doc(auth.currentUser!.uid).set({
        "Name": name,
        "Email": email,
        "PhoneNumber": phoneNumber,
        "Type": dropDownValue,
        if (dropDownValue == "User") "Bookings": [],
        if (dropDownValue == "Guide") "Language": guideLanguageValue,
        if (dropDownValue == "Guide" && imageUrl != null)
          "GuideImage": imageUrl,
      });

      if (dropDownValue == "User") {
        if (context.mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        }
      } else {
        if (context.mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => GuidePage()));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.01),
              const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: 180,
                      image: AssetImage("assets/images/logo3.jpg"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Get On Board!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Less rounded edges
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Less rounded edges
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Less rounded edges
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Phone Number",
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Less rounded edges
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Type:",
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton(
                      value: dropDownValue,
                      items: type.map((String e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value!;
                          if (dropDownValue == "User") {
                            guideLanguageValue = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (dropDownValue == "Guide")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Guide Language:",
                            style: TextStyle(fontSize: 16),
                          ),
                          DropdownButton(
                            value: guideLanguageValue,
                            items: guideLanguages.map((String e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                guideLanguageValue = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Upload Image:",
                            style: TextStyle(fontSize: 16),
                          ),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: const Text("Choose File"),
                          ),
                        ],
                      ),
                      if (_guideImage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.file(
                            _guideImage!,
                            height: 100,
                          ),
                        ),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => signUp(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 100),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}




 
 
 
 
 
 
 
 
 
 
 // // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pharaoh_quset/auth_service/auth_service.dart';
// import 'package:pharaoh_quset/screens/guide/guide_page.dart';
// import 'package:pharaoh_quset/src/home_screen.dart';
// import 'package:pharaoh_quset/utils/utils.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   Auth auth = Auth();
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _phoneNumberController = TextEditingController();

//   final List<String> type = ["User", "Guide"];
// // = "Choose type"
//   String? dropDownValue = 'User';

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     _phoneNumberController.dispose();
//     super.dispose();
//   }

//   bool _validateForm(
//       String email, String password, String name, String phoneNumber) {
//     if (email.isEmpty ||
//         password.isEmpty ||
//         name.isEmpty ||
//         phoneNumber.isEmpty) {
//       showSnackBar(context, "Some field(s) is empty");
//       return false;
//     }
//     return true;
//   }

//   void signUp(BuildContext context) async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();
//     final phoneNumber = _phoneNumberController.text.trim();
//     final name = _nameController.text.trim();

//     if (!_validateForm(email, password, name, phoneNumber)) {
//       return;
//     }

//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       final users = firestore.collection("Users");
//       await users.doc(auth.currentUser!.uid).set({
//         "Name": name,
//         "Email": email,
//         "PhoneNumber": phoneNumber,
//         "Type": dropDownValue,
//         if (dropDownValue == "User") "Bookings": [],
//       });

//       if (dropDownValue == "User") {
//         if (context.mounted) {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => const MyHomePage()));
//         }
//       } else {
//         if (context.mounted) {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => GuidePage()));
//         }
//       }
//     } on FirebaseAuthException catch (e) {
//       if (context.mounted) {
//         showSnackBar(context, e.message.toString());
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           width: size.width,
//           height: size.height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: size.height * 0.01),
//               const Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image(
//                       height: 180,
//                       image: AssetImage("assets/images/logo3.jpg"),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Get On Board!",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Less rounded edges
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       hintText: "Name",
//                       border: InputBorder.none,
//                     ),
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Less rounded edges
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(
//                       hintText: "Email",
//                       border: InputBorder.none,
//                     ),
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Less rounded edges
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextField(
//                     controller: _phoneNumberController,
//                     keyboardType: TextInputType.phone,
//                     decoration: const InputDecoration(
//                       hintText: "Phone Number",
//                       border: InputBorder.none,
//                     ),
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10), // Less rounded edges
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       hintText: "Password",
//                       border: InputBorder.none,
//                     ),
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Type:",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     DropdownButton(
//                       value: dropDownValue,
//                       items: type.map((String e) {
//                         return DropdownMenuItem(
//                           value: e,
//                           child: Text(e),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           dropDownValue = value!;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () => signUp(context),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 100),
//                   ),
//                   child: const Text(
//                     "Create Account",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
