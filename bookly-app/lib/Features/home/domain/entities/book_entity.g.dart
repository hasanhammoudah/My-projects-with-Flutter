// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      categories: (fields[7] as List).cast<String>(),
      image: fields[2] as String,
      title: fields[3] as String,
      authorName: fields[4] as String?,
      price: fields[5] as num?,
      rating: fields[6] as num?,
      bookId: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.bookId)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.authorName)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
