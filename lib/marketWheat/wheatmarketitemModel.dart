class WheatItem {
  final String name;
  final String phone;
  final String price;
  final String quantity;

  WheatItem(this.name, this.phone, this.price, this.quantity);

  factory WheatItem.fromJson(jsonData) {
    return WheatItem(
      jsonData['name'],
      jsonData['phone'],
      jsonData['price'],
      jsonData['quantity'],
    );
  }
}
