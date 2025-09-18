/// Represents the status of an order. Using an enum improves type safety.
enum OrderStatus {
  pending,
  completed,
  cancelled,
}

   //Single Responsibility Principle 
class Order {
  final String id;
  final String customerName;
  final String drinkName;
  final String details;
  final String imageUrl; 
  OrderStatus status;

  Order({
    required this.id,
    required this.customerName,
    required this.drinkName,
    required this.details,
    required this.imageUrl,
    this.status = OrderStatus.pending,
  });
}