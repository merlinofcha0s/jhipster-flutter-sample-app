import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../country/country_model.dart';

@jsonSerializable
class Location {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'streetAddress')
  final String streetAddress;

  @JsonProperty(name: 'postalCode')
  final String postalCode;

  @JsonProperty(name: 'city')
  final String city;

  @JsonProperty(name: 'stateProvince')
  final String stateProvince;

  @JsonProperty(name: 'country')
  final Country country;
        
 const Location (
     this.id,
        this.streetAddress,
        this.postalCode,
        this.city,
        this.stateProvince,
        this.country,
    );

@override
String toString() {
    return 'Location{'+
    'id: $id,' +
        'streetAddress: $streetAddress,' +
        'postalCode: $postalCode,' +
        'city: $city,' +
        'stateProvince: $stateProvince,' +
        'country: $country,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Location &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


