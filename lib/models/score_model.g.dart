// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScoreModelAdapter extends TypeAdapter<ScoreModel> {
  @override
  final int typeId = 2;

  @override
  ScoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScoreModel(
      id: fields[0] as int,
      name: fields[1] as String,
      categories: fields[2] as String,
      score: fields[3] as int,
      date: fields[4] as String,
      totalCorrectAnswer: fields[5] as int,
      totalQuestion: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ScoreModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.categories)
      ..writeByte(3)
      ..write(obj.score)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.totalCorrectAnswer)
      ..writeByte(6)
      ..write(obj.totalQuestion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
