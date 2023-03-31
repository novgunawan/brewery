import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'breweries_response.g.dart';

@JsonSerializable()
class BreweriesResponse extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'brewery_type')
  final String? breweryType;

  @JsonKey(name: 'address_1')
  final String? address;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'website_url')
  final String? url;

  @JsonKey(name: 'phone')
  final String? phone;

  const BreweriesResponse(this.id, this.name, this.breweryType, this.address,
      this.city, this.country, this.url, this.phone);

  factory BreweriesResponse.fromJson(Map<String, dynamic> json) =>
      _$BreweriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BreweriesResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
