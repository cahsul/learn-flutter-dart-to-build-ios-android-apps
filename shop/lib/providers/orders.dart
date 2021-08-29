import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop/widgets/cart_item.dart';


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

  void addOrderz(List<CartItemProvider> cartProducts, double total) {
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

  Future<void> addOrder(List<CartItemProvider> cartProducts, double total) async {
    final url = Uri.https('udemy-flutter-db630-default-rtdb.firebaseio.com', '/orders.json');
    final timestamp = DateTime.now();

    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
          'id': cp.id,
          'title': cp.title,
          'quantity': cp.quantity,
          'price': cp.price,
        })
            .toList(),
      }),
    );
    _orders.insert(
      0,
      OrderItemProvider(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }


}

