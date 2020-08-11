import 'package:flutter/material.dart';
import '../widgets/orderItem.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static var routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("your Orders"),
      ),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: (context, index) => OrderItem(orders.orders[index]),
      ),
    );
  }
}
