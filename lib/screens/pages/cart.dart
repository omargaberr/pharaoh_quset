import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/pages/cart_items.dart';
import 'package:pharaoh_quset/screens/pages/checkout_page.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _totalPrice = 0.0;

  void add(Item item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Item> get basketItems {
    return _items;
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
  // final List<Item> items = [
  //   Item("Luxor Trip", 4000, "assets/images/trip1.jpg"),
  //   Item("Dahab Trip", 3000, "assets/images/trip1.jpg"),
  //   Item("Cruise Trip", 6000, "assets/images/trip1.jpg")
  // ];
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutPage(),
                        ));
                      },
                    ),
                    Text(cart.count.toString())
                  ],
                ),
              )
            ],
            centerTitle: true,
          ),
          body: ListView.builder(
            // itemcount:items.length
            itemCount: cart.basketItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                // title text (items[index].title),
                title: Text(cart.basketItems[index].title),
                // items[index]
                subtitle: Text(cart.basketItems[index].price.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cart.remove(cart.basketItems[index]);
                  },
                ),
                // trailing: Icon(Icons.add),
                // onTap: () {
                //   cart.add(items[index]);
              );
            },
          ),
        );
      },
    );
  }
}
