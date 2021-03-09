import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../location/location_model.dart';

@jsonSerializable
class Department {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'departmentName')
  final String departmentName;

  @JsonProperty(name: 'location')
  final Location location;
        
 const Department (
     this.id,
        this.departmentName,
        this.location,
    );

@override
String toString() {
    return 'Department{'+
    'id: $id,' +
        'departmentName: $departmentName,' +
        'location: $location,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Department &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


