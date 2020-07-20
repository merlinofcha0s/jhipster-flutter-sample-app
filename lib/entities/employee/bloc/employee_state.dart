part of 'employee_bloc.dart';

enum EmployeeStatusUI {init, loading, done}

class EmployeeState extends Equatable {
  final List<Employee> employees;
  final EmployeeStatusUI employeeStatusUI;

  const EmployeeState({
    this.employees = const [],
    this.employeeStatusUI = EmployeeStatusUI.init
  });

  EmployeeState copyWith({
    List<Employee> employees,
    EmployeeStatusUI employeeStatusUI
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      employeeStatusUI: employeeStatusUI ?? this.employeeStatusUI
    );
  }

  @override
  List<Object> get props => [employees, employeeStatusUI];

  @override
  bool get stringify => true;
}
