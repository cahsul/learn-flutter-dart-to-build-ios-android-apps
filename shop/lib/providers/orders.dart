import 'package:flutter/foundation.dart';

import './cart.dart';

class OrderItemProvider {
  final String id;
  final double amount;
  final List<CartItemProvider> products;
  final DateTime dateTime;

  OrderItemProvider({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItemProvider> _orders = [];

  List<OrderItemProvider> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItemProvider> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItemProvider(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
