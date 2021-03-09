part of 'employee_bloc.dart';

enum EmployeeStatusUI {init, loading, error, done}
enum EmployeeDeleteStatus {ok, ko, none}

class EmployeeState extends Equatable {
  final List<Employee> employees;
  final Employee loadedEmployee;
  final bool editMode;
  final EmployeeDeleteStatus deleteStatus;
  final EmployeeStatusUI employeeStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final HireDateInput hireDate;
  final SalaryInput salary;
  final CommissionPctInput commissionPct;

  
  EmployeeState(
HireDateInput hireDate,{
    this.employees = const [],
    this.employeeStatusUI = EmployeeStatusUI.init,
    this.loadedEmployee = const Employee(0,null,0,0,null,null,),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = EmployeeDeleteStatus.none,
    this.salary = const SalaryInput.pure(),
    this.commissionPct = const CommissionPctInput.pure(),
  }):this.hireDate = hireDate ?? HireDateInput.pure()
;

  EmployeeState copyWith({
    List<Employee> employees,
    EmployeeStatusUI employeeStatusUI,
    bool editMode,
    EmployeeDeleteStatus deleteStatus,
    Employee loadedEmployee,
    FormzStatus formStatus,
    String generalNotificationKey,
    HireDateInput hireDate,
    SalaryInput salary,
    CommissionPctInput commissionPct,
  }) {
    return EmployeeState(
        hireDate,
      employees: employees ?? this.employees,
      employeeStatusUI: employeeStatusUI ?? this.employeeStatusUI,
      loadedEmployee: loadedEmployee ?? this.loadedEmployee,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      salary: salary ?? this.salary,
      commissionPct: commissionPct ?? this.commissionPct,
    );
  }

  @override
  List<Object> get props => [employees, employeeStatusUI,
     loadedEmployee, editMode, deleteStatus, formStatus, generalNotificationKey, 
hireDate,salary,commissionPct,];

  @override
  bool get stringify => true;
}
