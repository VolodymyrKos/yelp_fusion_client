import 'dart:convert';

import 'package:collection/collection.dart';

/// The location of a business, including address, city, state, zip code and country.
class Location {
  /// Street address of a business.
  final String address1;

  /// Street address of a business, continued.
  final String address2;

  /// Street address of a business, continued.
  final String address3;

  /// City of a business.
  final String city;

  /// ISO 3166-1 alpha-2 country code of a business.
  final String country;

  /// Cross streets for a business.
  final String crossStreets;

  /// Array of strings that if organized vertically give an address that is in the standard address format for the business's country.
  final List<String> displayAddress;

  /// ISO 3166-2 (with a few exceptions) state code of a business.
  final String state;

  /// Zip code of a business.
  final String zipCode;

  Location({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.country,
    this.crossStreets,
    this.displayAddress,
    this.state,
    this.zipCode,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Location(
      address1: map['address1'],
      address2: map['address2'],
      address3: map['address3'],
      city: map['city'],
      country: map['country'],
      crossStreets: map['cross_streets'] ?? null,
      displayAddress: List<String>.from(map['display_address']),
      state: map['state'],
      zipCode: map['zip_code'],
    );
  }

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Location(address1: $address1, address2: $address2, address3: $address3, city: $city, country: $country, crossStreets: $crossStreets, displayAddress: $displayAddress, state: $state, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Location &&
      o.address1 == address1 &&
      o.address2 == address2 &&
      o.address3 == address3 &&
      o.city == city &&
      o.country == country &&
      o.crossStreets == crossStreets &&
      listEquals(o.displayAddress, displayAddress) &&
      o.state == state &&
      o.zipCode == zipCode;
  }
}
