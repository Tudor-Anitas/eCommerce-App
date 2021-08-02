
import 'package:hive_flutter/adapters.dart';
import 'package:test_project/models/credit_card_model.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 0)
class CustomerModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? password;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? city;
  @HiveField(4)
  String? street;
  @HiveField(5)
  String? phoneNumber;
  @HiveField(6)
  CreditCardModel? creditCardModel;

  CustomerModel(
      {this.name,
      this.password,
      this.email,
      this.city,
      this.street,
      this.phoneNumber,
      this.creditCardModel});
}

