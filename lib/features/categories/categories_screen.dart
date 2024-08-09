import 'package:auvnet_store/features/cart/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CatgeoriesScreen extends StatelessWidget {
  const CatgeoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Box<OrderModel>>(
        future: Hive.openBox<OrderModel>('order_box'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found.'));
          }

          final orders = snapshot.data!.values.toList();

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                title: Text('Order ${index + 1}'),
                subtitle: Text('Total: \$${order.total.toStringAsFixed(2)}'),
                onTap: () {
                  // Show order details
                },
              );
            },
          );
        },
      ),
    );
  }
}
