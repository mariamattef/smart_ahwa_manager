import 'package:flutter/foundation.dart';
import 'package:smart_ahwa_manager/features/order/data/repo/iorder_repository.dart';
import '../../../order/data/models/order_view_model.dart';


// Single Responsibility Principle (SRP)
//  Dependency Inversion Principle (DIP)
/// abstraction, 


class DashboardViewModel extends ChangeNotifier {
  final IOrderRepository _orderRepository;

  DashboardViewModel(this._orderRepository);

  List<Order> _allOrders = [];
  List<Order> _orders = [];
  List<Order> get orders => _orders;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchPendingOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allOrders = await _orderRepository.getPendingOrders();
      _orders = List.from(_allOrders); // Initially, display all orders
    } catch (e) {
     
      debugPrint("Error fetching orders: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchOrders(String query) {
    if (query.isEmpty) {
      _orders = List.from(_allOrders);
    } else {
      final lowerCaseQuery = query.toLowerCase();
      _orders = _allOrders.where((order) {
        return order.customerName.toLowerCase().contains(lowerCaseQuery) ||
               order.drinkName.toLowerCase().contains(lowerCaseQuery);
      }).toList();
    }
    notifyListeners();
  }
  

  void completeOrder(String orderId) {

    _allOrders.removeWhere((order) => order.id == orderId);
    _orders.removeWhere((order) => order.id == orderId);
    
    notifyListeners();
  }
}