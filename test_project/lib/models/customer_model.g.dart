// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerModelAdapter extends TypeAdapter<CustomerModel> {
  @override
  final int typeId = 0;

  @override
  CustomerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerModel(
      name: fields[0] as String?,
      password: fields[1] as String?,
      email: fields[2] as String?,
      city: fields[3] as String?,
      street: fields[4] as String?,
      phoneNumber: fields[5] as String?,
      creditCardModel: fields[6] as CreditCardModel?,
      orderHistory: (fields[7] as Map?)?.cast<ItemModel, List>(),
    );
  }

  @override
  void write(BinaryWriter writer, CustomerModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.street)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.creditCardModel)
      ..writeByte(7)
      ..write(obj.orderHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
