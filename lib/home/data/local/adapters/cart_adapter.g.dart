// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartAdapterAdapter extends TypeAdapter<CartAdapter> {
  @override
  final int typeId = 2;

  @override
  CartAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartAdapter(
      productsModel: (fields[0] as List).cast<ProductModel>(),
      dateTime: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CartAdapter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.productsModel)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
