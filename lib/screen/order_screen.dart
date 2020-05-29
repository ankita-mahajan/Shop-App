import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/order';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  

  @override
  void didChangeDependencies() {
       Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
   
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItems(
          order: orderData.orders[i],
        ),
      ),
    );
  }
}
