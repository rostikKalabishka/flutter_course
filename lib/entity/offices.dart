import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
part 'offices.g.dart';

@JsonSerializable()
class OfficesList {
  @JsonKey(name: 'offices')
  final List<Office> officesList;
  OfficesList({required this.officesList});

  // factory OfficesList.fromJson(Map<String, dynamic> json) {
  //   return OfficesList(
  //       officesList: (json['offices'] as List<dynamic>)
  //           .map((e) => Office.fromJson(e))
  //           .toList());
  // }
  factory OfficesList.fromJson(Map<String, dynamic> json) =>
      _$OfficesListFromJson(json);
  Map<String, dynamic> toJson() => _$OfficesListToJson(this);
}

@JsonSerializable()
class Office {
  final String name;
  final String image;
  final String address;

  Office({required this.name, required this.image, required this.address});

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);

  // factory Office.fromJson(Map<String, dynamic> json) {
  //   return Office(
  //       address: json['address'] as String,
  //       image: json['image'] as String,
  //       name: json['name'] as String);
  // }

  // Map<String, dynamic> toJson() {
  //   return {"address": address, 'image': image, 'name': num};
  // }
}

Future<OfficesList> getData() async {
  final Dio dio = Dio();
  const url = 'https://about.google/static/data/locations.json';
  final response = await dio.get(url);
  if (response.statusCode == 200) {
    final json = await response.data;
    final officesListResponse = OfficesList.fromJson(json);
    print(json);
    print(officesListResponse);
    return officesListResponse;
  } else {
    throw Exception('Error');
  }
}
