import 'package:hive_flutter/hive_flutter.dart';

part 'credit_card_model.g.dart';

@HiveType(typeId: 1)
class CreditCardModel{
  @HiveField(0)
  String? cardNumber;
  @HiveField(1)
  String? expirationDate;
  @HiveField(2)
  String? cvv;
  @HiveField(3)
  String? cardHolderName;

  CreditCardModel({this.cardHolderName, this.cardNumber, this.cvv, this.expirationDate});
}