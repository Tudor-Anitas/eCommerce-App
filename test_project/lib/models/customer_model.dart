import 'package:test_project/models/credit_card_model.dart';

class CustomerModel {
  String? name;
  String? email;
  String? city;
  String? street;
  String? phoneNumber;
  CreditCardModel? creditCardModel;

  CustomerModel(
      {this.name,
      this.email,
      this.city,
      this.street,
      this.phoneNumber,
      this.creditCardModel});
}
