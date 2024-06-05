import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/pages/cart.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
                : ListView.builder(
                    itemCount: cart.basketItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(cart.basketItems[index].title),
                          subtitle:
                              Text(cart.basketItems[index].price.toString()),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              cart.remove(cart.basketItems[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
