import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class Region {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'regionName')
  final String regionName;
        
 const Region (
     this.id,
        this.regionName,
    );

@override
String toString() {
    return 'Region{'+
    'id: $id,' +
        'regionName: $regionName,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Region &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


