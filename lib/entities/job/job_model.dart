import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../employee/employee_model.dart';

@jsonSerializable
class Job {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'jobTitle')
  final String jobTitle;

  @JsonProperty(name: 'minSalary')
  final int minSalary;

  @JsonProperty(name: 'maxSalary')
  final int maxSalary;

  @JsonProperty(name: 'employee')
  final Employee employee;
        
 const Job (
     this.id,
        this.jobTitle,
        this.minSalary,
        this.maxSalary,
        this.employee,
    );

@override
String toString() {
    return 'Job{'+
    'id: $id,' +
        'jobTitle: $jobTitle,' +
        'minSalary: $minSalary,' +
        'maxSalary: $maxSalary,' +
        'employee: $employee,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Job &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


