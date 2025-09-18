import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/features/order/data/models/order_view_model.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  bool _isDialogVisible = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         
          _buildMainContent(),

          if (_isDialogVisible) _buildConfirmationDialog(),
        ],
      ),
    );
  }

  // Builds the main screen layout with AppBar, content, and bottom button
  Widget _buildMainContent() {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: const Text(
                  'Order Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                centerTitle: true,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildOrderInfoCard(),
                    _buildItemsSection(),
                    _buildSpecialInstructions(),
                    _buildPriceSummary(),
                    const SizedBox(height: 120), // Space for the floating button
                  ],
                ),
              ),
            ],
          ),
        ),
        _buildBottomButton(),
      ],
    );
  }
  
  
  Widget _buildOrderInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC), // bg-slate-50
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color(0xFFE2E8F0)), // border-slate-200
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Order #${widget.order.id}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const Text(
                  '2 mins ago',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Customer:', widget.order.customerName),
            _buildInfoRow('Table:', '5'),
          ],
        ),
      ),
    );
  }

  // Helper for a single row in the info card
  Widget _buildInfoRow(String title, String value) {
    return Text.rich(
      TextSpan(
        text: title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF334155),
        ),
        children: [
          TextSpan(
            text: ' $value',
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
  
  // Section containing the list of ordered items
  Widget _buildItemsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Items',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          _buildOrderItem(
            icon: Icons.coffee,
            iconBgColor: const Color(0xFFECFDF5),
            iconColor: const Color(0xFF10B981),
            title: widget.order.drinkName,
            quantity: 'x 1',
            price: 'EGP 20.00',
          ),
        ],
      ),
    );
  }
  
  // Reusable widget for a single item in the order list
  Widget _buildOrderItem({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String quantity,
    required String price,
  }) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                quantity,
                style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
  
  // Section for special instructions
  Widget _buildSpecialInstructions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Special Instructions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.order.details,
            style: const TextStyle(fontSize: 16, color: Color(0xFF475569)),
          ),
        ],
      ),
    );
  }
  
  // The final price calculation section
  Widget _buildPriceSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal', 'EGP 20.00', isBold: false),
          const SizedBox(height: 4),
          _buildSummaryRow('Service (12%)', 'EGP 2.4', isBold: false),
          const SizedBox(height: 16),
          _buildSummaryRow('Total', 'EGP 22.4', isBold: true),
        ],
      ),
    );
  }

  // Reusable widget for a single row in the price summary
  Widget _buildSummaryRow(String title, String amount, {bool isBold = false}) {
    final style = TextStyle(
      fontSize: isBold ? 18 : 16,
      fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
      color: isBold ? const Color(0xFF0F172A) : const Color(0xFF334155),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: style),
        Text(amount, style: style),
      ],
    );
  }

  
  Widget _buildBottomButton() {
   
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white.withValues(alpha: 0.8),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isDialogVisible = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38e07b),
                foregroundColor: const Color(0xFF0F172A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4.0,
                shadowColor: const Color(0xFF38e07b).withValues(alpha: 0.4),
              ),
              child: const Text(
                'Mark as Completed',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  // The confirmation dialog overlay
  Widget _buildConfirmationDialog() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Container(
        color: Colors.black.withValues(alpha: .3),
        child: Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Confirm Completion',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Are you sure you want to mark this order as completed?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xFF475569)),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: _buildDialogButton(
                        text: 'No',
                        isPrimary: false,
                        onPressed: () {
                          setState(() {
                            _isDialogVisible = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDialogButton(
                        text: 'Yes',
                        isPrimary: true,
                        onPressed: () {
                          // Add completion logic here
                          setState(() {
                            _isDialogVisible = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable widget for the buttons inside the dialog
  Widget _buildDialogButton({
    required String text,
    required bool isPrimary,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? const Color(0xFF38e07b) : const Color(0xFFF1F5F9),
          foregroundColor: isPrimary ? const Color(0xFF0F172A) : const Color(0xFF334155),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
