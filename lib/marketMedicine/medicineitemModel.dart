class  Medicine {
  final String name;
  final String phone;
  final String price;
  final String quantity;
  final String productName;


  Medicine(this.name, this.phone, this.price, this.quantity, this.productName);

  factory Medicine.fromJson(jsonData) {
    return Medicine(
      jsonData['name'],
      jsonData['phone'],
      jsonData['price'],
      jsonData['quantity'],
      jsonData['productName'],

    );
  }
}
