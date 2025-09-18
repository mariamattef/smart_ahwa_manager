import 'package:flutter/material.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {

  final List<String> _drinkOptions = [
    'Shai',
    'Turkish Coffee',
    'Hibiscus Tea',
    'Sahlab',
  ];

  
  String? _selectedDrink;

 
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF374151), // text-gray-700
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5, // Corresponds to shadow-sm
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF374151)),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: const Text(
          'New Order',
          style: TextStyle(
            color: Color(0xFF1F2937), // text-gray-800
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // The Expanded widget makes the SingleChildScrollView take up all available space
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0), // p-6
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customer Name Field
                  _buildLabel('Customer Name'),
                  const SizedBox(height: 4.0), // mb-1
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'e.g., Ahmed',
                    ),
                  ),
                  const SizedBox(height: 24.0), // space-y-6

                  // Drink Type Dropdown
                  _buildLabel('Drink Type'),
                  const SizedBox(height: 4.0),
                  DropdownButtonFormField<String>(
                    value: _selectedDrink,
                    // The icon for the dropdown
                    icon: const Icon(Icons.expand_more, color: Color(0xFF374151)),
                    hint: const Text('Select a drink'),
                    // Set the dropdown's background color
                    dropdownColor: Colors.white,
                    decoration: const InputDecoration(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDrink = newValue;
                      });
                    },
                    items: _drinkOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24.0), // space-y-6

                  // Special Instructions Text Area
                  _buildLabel('Special Instructions'),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    minLines: 4, // Sets the initial height
                    maxLines: null, // Allows the field to expand vertically
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'e.g., “extra mint, ya rais”',
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom "Add Order" Button Container
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Color(0xFFE5E7EB), width: 1.0), // border-t
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 48, // h-12
              child: ElevatedButton(
                onPressed: () {
                  // Handle add order action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF38e07b),
                  foregroundColor: Colors.white,
                  elevation: 2.0, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), 
                  ),
                ),
                child: const Text(
                  'Add Order',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5, 
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}