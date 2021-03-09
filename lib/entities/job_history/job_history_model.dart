import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../job/job_model.dart';
import '../department/department_model.dart';
import '../employee/employee_model.dart';

@jsonSerializable
class JobHistory {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'startDate', converterParams: {'format': 'yyyy-MM-dd\'T\'HH:mm:ss\'Z\''})
  final DateTime startDate;

  @JsonProperty(name: 'endDate', converterParams: {'format': 'yyyy-MM-dd\'T\'HH:mm:ss\'Z\''})
  final DateTime endDate;

  @JsonProperty(name: 'language', enumValues: Language.values)
  final Language language;

  @JsonProperty(name: 'job')
  final Job job;

  @JsonProperty(name: 'department')
  final Department department;

  @JsonProperty(name: 'employee')
  final Employee employee;
        
 const JobHistory (
     this.id,
        this.startDate,
        this.endDate,
        this.language,
        this.job,
        this.department,
        this.employee,
    );

@override
String toString() {
    return 'JobHistory{'+
    'id: $id,' +
        'startDate: $startDate,' +
        'endDate: $endDate,' +
        'language: $language,' +
        'job: $job,' +
        'department: $department,' +
        'employee: $employee,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is JobHistory &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


@jsonSerializable
@Json(enumValues: Language.values)
enum Language {
    FRENCH ,
    ENGLISH ,
    SPANISH 
}