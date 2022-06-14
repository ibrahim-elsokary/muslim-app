// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_model_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranModelAdapter extends TypeAdapter<QuranModel> {
  @override
  final int typeId = 0;

  @override
  QuranModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranModel()..data = fields[0] as QuranData;
  }

  @override
  void write(BinaryWriter writer, QuranModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuranDataAdapter extends TypeAdapter<QuranData> {
  @override
  final int typeId = 1;

  @override
  QuranData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranData()..surah = (fields[0] as List).cast<SurahData>();
  }

  @override
  void write(BinaryWriter writer, QuranData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.surah);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SurahDataAdapter extends TypeAdapter<SurahData> {
  @override
  final int typeId = 2;

  @override
  SurahData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahData()
      ..number = fields[0] as int
      ..arName = fields[1] as String
      ..enName = fields[2] as String
      ..enNameTranslation = fields[3] as String
      ..revelationType = fields[4] as String
      ..ayah = (fields[5] as List).cast<AyahData>();
  }

  @override
  void write(BinaryWriter writer, SurahData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.arName)
      ..writeByte(2)
      ..write(obj.enName)
      ..writeByte(3)
      ..write(obj.enNameTranslation)
      ..writeByte(4)
      ..write(obj.revelationType)
      ..writeByte(5)
      ..write(obj.ayah);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AyahDataAdapter extends TypeAdapter<AyahData> {
  @override
  final int typeId = 3;

  @override
  AyahData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AyahData()
      ..number = fields[0] as int
      ..text = fields[1] as String
      ..numberInSurah = fields[2] as int
      ..juz = fields[3] as int
      ..manzil = fields[4] as int
      ..page = fields[5] as int
      ..ruku = fields[6] as int
      ..hizbQuarter = fields[7] as int
      ..sajda = fields[8] as dynamic;
  }

  @override
  void write(BinaryWriter writer, AyahData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.numberInSurah)
      ..writeByte(3)
      ..write(obj.juz)
      ..writeByte(4)
      ..write(obj.manzil)
      ..writeByte(5)
      ..write(obj.page)
      ..writeByte(6)
      ..write(obj.ruku)
      ..writeByte(7)
      ..write(obj.hizbQuarter)
      ..writeByte(8)
      ..write(obj.sajda);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AyahDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
