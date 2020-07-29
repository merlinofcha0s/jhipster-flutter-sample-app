part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitList extends EmployeeEvent {}


class FirstnameChanged extends EmployeeEvent {
  final String firstname;

  const FirstnameChanged({@required this.firstname});

  @override
  List<Object> get props => [firstname];
}

class LastnameChanged extends EmployeeEvent {
  final String lastname;

  const LastnameChanged({@required this.lastname});

  @override
  List<Object> get props => [lastname];
}

class EmailChanged extends EmployeeEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends EmployeeEvent {
  final String phoneNumber;

  const PhoneNumberChanged({@required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class HireDateChanged extends EmployeeEvent {
  final String hireDate;

  const HireDateChanged({@required this.hireDate});

  @override
  List<Object> get props => [hireDate];
}

class SalaryChanged extends EmployeeEvent {
  final int salary;

  const SalaryChanged({@required this.salary});

  @override
  List<Object> get props => [salary];
}

class CommissionChanged extends EmployeeEvent {
  final int commission;

  const CommissionChanged({@required this.commission});

  @override
  List<Object> get props => [commission];
}

class EmployeeFormCreateSubmitted extends EmployeeEvent {}
