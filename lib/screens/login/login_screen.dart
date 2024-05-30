import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharaoh_quset/auth_service/auth_service.dart';
import 'package:pharaoh_quset/screens/login/forgot_password_screen.dart';
import 'package:pharaoh_quset/screens/login/signup_screen.dart';
import 'package:pharaoh_quset/src/home_screen.dart';
import 'package:pharaoh_quset/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Auth auth = Auth();
  String? errorMessage = '';
  bool isLogin = true;
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  bool _validateForm(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      showSnackBar(context, "Email or Password are Empty");
      return false;
    }
    return true;
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    final email = _controllerEmail.text.trim();
    final password = _controllerPassword.text.trim();

    if (!_validateForm(email, password)) {
      return;
    }

    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
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
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
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
                      "Hello,",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Welcome Back",
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
                    controller: _controllerEmail,
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
                    controller: _controllerPassword,
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
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  ),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => signInWithEmailAndPassword(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 100),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Image(
                  width: 30,
                  image: AssetImage('assets/images/google-icon.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




















  

 






























































































































































































// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 56, left: 24, bottom: 24, right: 24),
//           child: Column(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Image(
//                     height: 250,
//                     image: AssetImage("assets/images/logo3.jpg"),
//                   ),
//                   Text(TTexts.loginTitle,
//                       style: Theme.of(context).textTheme.headlineMedium),
//                   const SizedBox(height: TSizes.sm),
//                   Text(TTexts.loginSubTitle,
//                       style: Theme.of(context).textTheme.bodyMedium),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: TSizes.spaceBtwSections),
//                 child: Form(
//                     child: Column(
//                   children: [
//                     // Email
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.email),
//                         labelText: TTexts.email,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(40)),
//                           gapPadding: 10,
//                           borderSide: BorderSide(
//                             style: BorderStyle.solid,
//                             color: Color.fromARGB(255, 160, 1, 1),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: TSizes.spaceBtwInputFields,
//                     ),
//                     // Password
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.lock_outline_rounded),
//                         labelText: TTexts.password,
//                         suffixIcon: Icon(Icons.remove_red_eye_rounded),
//                       ),
//                     ),
//                     const SizedBox(height: TSizes.spaceBtwInputFields / 2),
//                     // Remember me + Forget Password
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             // Remember me
//                             Checkbox(value: true, onChanged: (value) {}),
//                             const Text(TTexts.rememberMe),
//                           ],
//                         ),
//                         // Forget Password
//                         TextButton(
//                             onPressed: () {},
//                             child: const Text(TTexts.forgetPassword)),
//                       ],
//                     ),
//                     const SizedBox(height: 32),
//                     // Sign in button
//                     SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                             onPressed: () {},
//                             child: const Text(TTexts.signIn))),
//                     const SizedBox(height: 16),
//                     //  Create Account Button

//                     SizedBox(
//                         width: double.infinity,
//                         child: OutlinedButton(
//                             onPressed: () {},
//                             child: const Text(TTexts.createAccount))),
//                     const SizedBox(height: 32),
//                   ],
//                 )),
//               ),
//               const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Flexible(
//                   child: Divider(
//                       color: TColors.darkGrey,
//                       thickness: 0.5,
//                       indent: 60,
//                       endIndent: 5),
//                 ),
//               ]),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(color: TColors.grey),
//                         borderRadius: BorderRadius.circular(100)),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Image(
//                         width: TSizes.iconMd,
//                         height: TSizes.iconMd,
//                         image: AssetImage("assets/images/google-icon.png"),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
