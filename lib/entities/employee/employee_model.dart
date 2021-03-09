import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../employee/employee_model.dart';
import '../department/department_model.dart';

@jsonSerializable
class Employee {

  @JsonProperty(name: 'id')
  final int id;

  @JsonProperty(name: 'hireDate', converterParams: {'format': 'yyyy-MM-dd\'T\'HH:mm:ss\'Z\''})
  final DateTime hireDate;

  @JsonProperty(name: 'salary')
  final int salary;

  @JsonProperty(name: 'commissionPct')
  final int commissionPct;

  @JsonProperty(name: 'manager')
  final Employee manager;

  @JsonProperty(name: 'department')
  final Department department;
        
 const Employee (
     this.id,
        this.hireDate,
        this.salary,
        this.commissionPct,
        this.manager,
        this.department,
    );

@override
String toString() {
    return 'Employee{'+
    'id: $id,' +
        'hireDate: $hireDate,' +
        'salary: $salary,' +
        'commissionPct: $commissionPct,' +
        'manager: $manager,' +
        'department: $department,' +
    '}';
   }

@override
bool operator == (Object other) => 
    identical(this, other) ||
    other is Employee &&
    id == other.id ;


@override
int get hashCode => 
    id.hashCode ;
}


