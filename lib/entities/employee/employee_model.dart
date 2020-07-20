import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Employee {

  @JsonProperty(name: 'firstName')
  final String firstName;

  @JsonProperty(name: 'lastName')
  final String lastName;

  @JsonProperty(name: 'email')
  final String email;

  @JsonProperty(name: 'phoneNumber')
  final String phoneNumber;

  @JsonProperty(name: 'hireDate')
  final DateTime hireDate;

  @JsonProperty(name: 'salary')
  final int salary;

  @JsonProperty(name: 'commissionPct')
  final int commissionPct;

  const Employee(this.firstName, this.lastName, this.email, this.phoneNumber,
      this.hireDate, this.salary, this.commissionPct);

  @override
  String toString() {
    return 'Employee{firstName: $firstName, lastName: $lastName, email: $email, '
        'phoneNumber: $phoneNumber, hireDate: $hireDate, salary: $salary, '
        'commissionPct: $commissionPct}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          hireDate == other.hireDate &&
          salary == other.salary &&
          commissionPct == other.commissionPct;

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      hireDate.hashCode ^
      salary.hashCode ^
      commissionPct.hashCode;
}
