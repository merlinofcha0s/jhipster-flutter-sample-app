part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitList extends EmployeeEvent {}
