import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class Person {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'firstName')
  final String firstName;

  @JsonProperty(name: 'lastName')
  final String lastName;

  @JsonProperty(name: 'email')
  final String email;

  @JsonProperty(name: 'phoneNumber')
  final String phoneNumber;
        
 const Person (
     this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
    );

@override
String toString() {
    return 'Person{'+
    'id: $id,' +
        'firstName: $firstName,' +
        'lastName: $lastName,' +
        'email: $email,' +
        'phoneNumber: $phoneNumber,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Person &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


