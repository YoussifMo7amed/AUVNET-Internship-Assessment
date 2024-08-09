import 'package:auvnet_store/core/common/widgets/custom_app_bar.dart';
import 'package:auvnet_store/features/cart/presentation/refactors/history_order_body.dart';
import 'package:flutter/material.dart';

class HistoryOrderScreen extends StatelessWidget {
  const HistoryOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Order History'),
      body: HistoryOrderBody(),
    );
  }
}
