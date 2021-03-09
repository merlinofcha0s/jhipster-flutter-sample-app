import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../region/region_model.dart';

@jsonSerializable
class Country {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'countryName')
  final String countryName;

  @JsonProperty(name: 'region')
  final Region region;
        
 const Country (
     this.id,
        this.countryName,
        this.region,
    );

@override
String toString() {
    return 'Country{'+
    'id: $id,' +
        'countryName: $countryName,' +
        'region: $region,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Country &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


