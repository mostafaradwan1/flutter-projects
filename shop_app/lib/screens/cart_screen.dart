import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../providers/cart.dart' show Cart;

import '../widgets/cartItem.dart';
import 'orders_screen.dart';

class CartScreen extends StatelessWidget {
  static var routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Consumer<Cart>(
                    builder: (_, value, ch) => Chip(
                      label: Text(
                        "${value.totalAmount.toString()} \$",
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                      Navigator.pushNamed(
                        context,
                        OrdersScreen.routeName,
                      );
                    },
                    child: Text(
                      "Order Now",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
