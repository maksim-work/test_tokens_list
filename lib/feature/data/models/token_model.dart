class TokenModel {
  final String id;
  final String? name;
  final double? price;

  TokenModel({
    required this.id,
    this.name,
    this.price,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      id: json['id'],
      name: json['symbol'],
      price: double.tryParse(json['priceUsd']),
    );
  }
}
