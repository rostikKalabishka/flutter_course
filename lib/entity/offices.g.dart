// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficesList _$OfficesListFromJson(Map<String, dynamic> json) => OfficesList(
      officesList: (json['offices'] as List<dynamic>)
          .map((e) => Office.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfficesListToJson(OfficesList instance) =>
    <String, dynamic>{
      'offices': instance.officesList,
    };

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
      name: json['name'] as String,
      image: json['image'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'address': instance.address,
    };
