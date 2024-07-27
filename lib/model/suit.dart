class Suit {
  final String? id;
  final String? name;
  final int price;
  final String detail;
  final List<String> materials;
  final double rating;
  final int sold;
  final String? arUrl;

  Suit({
    required this.id,
    required this.name,
    required this.price,
    required this.detail,
    required this.materials,
    required this.rating,
    required this.sold,
    required this.arUrl,
  });

  factory Suit.fromJson(Map<String, dynamic> json) {
    return Suit(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'],
      detail: json['detail'],
      materials: List<String>.from(json['materials']),
      rating: json['rating'],
      sold: json['sold'],
      arUrl: json['arUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'detail': detail,
      'materials': materials,
      'rating': rating,
      'sold': sold,
      'arUrl': arUrl,
    };
  }
}
