import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/features/order/presentation/screens/new_order_screen.dart';
import 'package:smart_ahwa_manager/features/order/presentation/screens/pending_order_screen.dart';
import 'package:smart_ahwa_manager/features/report/presentation/screens/report_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<BottomNavBar> {
  int _bottomNavIndex = 0;

  final List<Widget> _screens = [
    const PendingOrderScreen(),
    const NewOrderScreen(),
    const ReportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF38e07b);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // bg-gray-50
      body: _screens[_bottomNavIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:  0.05),
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.receipt_long),
                label: const Text('View Daily Summary'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: 5.0,
                  shadowColor: primaryColor.withValues(alpha:0.2),
                ),
              ),
            ),
            BottomNavigationBar(
              currentIndex: _bottomNavIndex,
              onTap: (index) {
                setState(() {
                  _bottomNavIndex = index;
                });
              },
              backgroundColor: Colors.white,
              selectedItemColor: Colors.green[600],
              unselectedItemColor: const Color(0xFF6B7280),
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.space_dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box),
                  label: 'New Order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assessment),
                  label: 'Reports',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 
}
