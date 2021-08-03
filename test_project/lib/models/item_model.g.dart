// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 2;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      id: fields[0] as int?,
      uid: fields[1] as String?,
      color: fields[2] as String?,
      department: fields[3] as String?,
      material: fields[4] as String?,
      productName: fields[5] as String?,
      price: fields[6] as double?,
      priceString: fields[7] as String?,
      promoCode: fields[8] as String?,
      image: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.department)
      ..writeByte(4)
      ..write(obj.material)
      ..writeByte(5)
      ..write(obj.productName)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.priceString)
      ..writeByte(8)
      ..write(obj.promoCode)
      ..writeByte(9)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
