import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class Task {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'title')
  final String title;

  @JsonProperty(name: 'description')
  final String description;
        
 const Task (
     this.id,
        this.title,
        this.description,
    );

@override
String toString() {
    return 'Task{'+
    'id: $id,' +
        'title: $title,' +
        'description: $description,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Task &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


