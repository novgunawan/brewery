// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breweries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreweriesResponse _$BreweriesResponseFromJson(Map<String, dynamic> json) =>
    BreweriesResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['brewery_type'] as String?,
      json['address_1'] as String?,
      json['city'] as String?,
      json['country'] as String?,
      json['website_url'] as String?,
      json['phone'] as String?,
    );

Map<String, dynamic> _$BreweriesResponseToJson(BreweriesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brewery_type': instance.breweryType,
      'address_1': instance.address,
      'city': instance.city,
      'country': instance.country,
      'website_url': instance.url,
      'phone': instance.phone,
    };
