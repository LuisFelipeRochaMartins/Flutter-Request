import 'package:intl/intl.dart';

class Games {

  String? name;
  String? review;
  String? price;


  Games({
    this.name,
    this.review,
    this.price
  });

  factory Games.fromJson(Map<String, dynamic> json) {
    String? priceString = json['subs']?.isNotEmpty == true ? json['subs']![0]['price'] : null;
    double? price;

    if (priceString != null) {
      try {
        price = double.parse(priceString);
      } catch (e) {
        print("Erro ao converter preço para double: $e");
      }
    }

    return Games(
      name: json['name'],
      review: json['review_desc'],
      price: price != null ? formatPrice(price) : "0.0",
    );
  }

  static String formatPrice(double price) {
    final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return currencyFormat.format(price / 100);
  }
}