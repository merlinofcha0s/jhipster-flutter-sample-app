import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Employee {

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

  @JsonProperty(name: 'hireDate', converterParams: {'format': 'yyyy-MM-dd\'T\'HH:mm:ss\'Z\''})
  final DateTime hireDate;

  @JsonProperty(name: 'salary')
  final int salary;

  @JsonProperty(name: 'commissionPct')
  final int commissionPct;

  @JsonProperty(name: 'language')
  final Language language;

  const Employee(this.id, this.firstName, this.lastName, this.email, this.phoneNumber,
      this.hireDate, this.salary, this.commissionPct, this.language);

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
          id == other.id;

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      hireDate.hashCode ^
      salary.hashCode ^
      commissionPct.hashCode;
}

@jsonSerializable
@Json(enumValues: Language.values)
enum Language {
  FRENCH ,
  ENGLISH ,
  SPANISH
}
