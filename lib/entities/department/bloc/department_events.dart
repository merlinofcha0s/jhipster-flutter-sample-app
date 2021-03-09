part of 'department_bloc.dart';

abstract class DepartmentEvent extends Equatable {
  const DepartmentEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class InitDepartmentList extends DepartmentEvent {}

class DepartmentNameChanged extends DepartmentEvent {
  final String departmentName;
  
  const DepartmentNameChanged({@required this.departmentName});
  
  @override
  List<Object> get props => [departmentName];
}

class DepartmentFormSubmitted extends DepartmentEvent {}

class LoadDepartmentByIdForEdit extends DepartmentEvent {
  final int id;

  const LoadDepartmentByIdForEdit({@required this.id});

  @override
  List<Object> get props => [id];
}

class DeleteDepartmentById extends DepartmentEvent {
  final int id;

  const DeleteDepartmentById({@required this.id});

  @override
  List<Object> get props => [id];
}

class LoadDepartmentByIdForView extends DepartmentEvent {
  final int id;

  const LoadDepartmentByIdForView({@required this.id});

  @override
  List<Object> get props => [id];
}
