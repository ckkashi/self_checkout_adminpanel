import 'package:flutter/material.dart';
import 'package:self_checkout_adminpanel/api_service.dart';
import 'package:self_checkout_adminpanel/models/history.dart';

class OrderProvider with ChangeNotifier {
  List<History> _orders = [];
  bool _isLoading = false;

  List<History> get orders => _orders;
  bool get isLoading => _isLoading;

  void fetchOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      _orders = await ApiService().fetchOrders();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  int get totalOrders => _orders.length;

  int get todayOrders => _orders.where((order) {
        return order.createdAt.day == DateTime.now().day &&
            order.createdAt.month == DateTime.now().month &&
            order.createdAt.year == DateTime.now().year;
      }).length;
}
