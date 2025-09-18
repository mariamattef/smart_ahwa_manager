
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/features/order/data/models/top_selling_item.dart';
import 'package:smart_ahwa_manager/features/order/data/repo/iorder_repository.dart';

class ReportViewModel extends ChangeNotifier {
  final ReportRepository _reportRepository;

  int _selectedDateRangeIndex = 0;
  String _selectedDrinkFilter = 'All Drinks';
  List<TopSellingItem> _topSellingItems = [];
  bool _isLoading = false;

  int get selectedDateRangeIndex => _selectedDateRangeIndex;
  String get selectedDrinkFilter => _selectedDrinkFilter;
  List<String> get dateRangeOptions => ['Daily', 'Weekly', 'Monthly'];
  List<String> get drinkFilterOptions =>
      ['All Drinks', 'Shai', 'Turkish Coffee', 'Karkadeh', 'Sahlab'];
  List<TopSellingItem> get topSellingItems => _topSellingItems;
  bool get isLoading => _isLoading;

  ReportViewModel({required ReportRepository reportRepository})
      : _reportRepository = reportRepository {
    fetchTopSellingItems();
  }

  Future<void> fetchTopSellingItems() async {
    _isLoading = true;
    notifyListeners();
    _topSellingItems = await _reportRepository.getTopSellingItems();
    _isLoading = false;
    notifyListeners();
  }

  void onDateRangeChanged(int index) {
    _selectedDateRangeIndex = index;
    notifyListeners();
  }

  void onDrinkFilterChanged(String? newValue) {
    if (newValue != null) {
      _selectedDrinkFilter = newValue;
      notifyListeners();
    }
  }
}

