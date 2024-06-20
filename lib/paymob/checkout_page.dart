import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharaoh_quset/paymob/paymob_manager.dart';
import 'package:pharaoh_quset/screens/pages/cart.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Checkout Page [\$ ${cart.totalPrice}]"),
          ),
          body: cart.basketItems.isEmpty
              ? const Text("No items in your cart")
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.basketItems.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(cart.basketItems[index].title),
                              subtitle: Text(
                                  cart.basketItems[index].price.toString()),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  cart.remove(cart.basketItems[index]);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20), // Add some vertical space
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total: \$${cart.totalPrice}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          InkWell(
                            onTap: () async {
                              // _pay(cart.totalPrice.toInt());
                              DocumentSnapshot userDoc = await _firestore
                                  .collection("Users")
                                  .doc(_auth.currentUser!.uid)
                                  .get();

                              List<Map<String, dynamic>> newBooking = cart
                                  .basketItems
                                  .map((item) => item.toMap())
                                  .toList();

                              List<dynamic> bookings =
                                  userDoc.get("Bookings") ?? [];

                              for (var item in newBooking) {
                                bookings.add(item);
                              }

                              await _firestore
                                  .collection("Users")
                                  .doc(_auth.currentUser!.uid)
                                  .update({"Bookings": bookings});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(color: Colors.black38),
                              ),
                              child: const Text(
                                "Pay Now",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
        );
      },
    );
  }

  Future<void> _pay(int amount) async {
    PaymobManager().getPaymentKey(amount, "EGP").then((String paymentKey) {
      launchUrl(
        Uri.parse(
            "https://accept.paymob.com/api/acceptance/iframes/851718?payment_token=$paymentKey"),
      );
    });
  }
}
