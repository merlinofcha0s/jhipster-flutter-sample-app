part of 'employee_bloc.dart';

enum EmployeeListStatusUI {init, loading, done}
enum EmployeeDeleteStatus {ok, ko, none}

class EmployeeState extends Equatable {
  final List<Employee> employees;
  final Employee loadedEmployee;
  final bool editMode;
  final EmployeeDeleteStatus deleteStatus;
  final EmployeeListStatusUI employeeListStatusUI;

  final FirstnameInput firstname;
  final LastnameInput lastname;
  final EmailInput email;
  final PhoneNumberInput phoneNumber;
  final HireDateInput hireDate;
  final SalaryInput salary;
  final CommissionPctInput commissionPct;
  final FormzStatus formStatus;
  final String generalNotificationKey;

  const EmployeeState({
    this.employees = const [],
    this.loadedEmployee = const Employee(0, '', '', '', '', null, 0, 0),
    this.editMode = false,
    this.employeeListStatusUI = EmployeeListStatusUI.init,
    this.firstname = const FirstnameInput.pure(),
    this.lastname = const LastnameInput.pure(),
    this.email = const EmailInput.pure(),
    this.phoneNumber = const PhoneNumberInput.pure(),
    this.hireDate = const HireDateInput.pure(),
    this.salary = const SalaryInput.pure(),
    this.commissionPct = const CommissionPctInput.pure(),
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = EmployeeDeleteStatus.none
  });

  EmployeeState copyWith({
    List<Employee> employees,
    Employee loadedEmployee,
    bool editMode,
    EmployeeListStatusUI employeeStatusUI,
    FirstnameInput firstname,
    LastnameInput lastname,
    EmailInput email,
    PhoneNumberInput phoneNumber,
    HireDateInput hireDate,
    SalaryInput salary,
    CommissionPctInput commissionPct,
    FormzStatus formStatus,
    String generalNotificationKey,
    EmployeeDeleteStatus deleteStatus
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      loadedEmployee: loadedEmployee ?? this.loadedEmployee,
      editMode: editMode ?? this.editMode,
      employeeListStatusUI: employeeStatusUI ?? this.employeeListStatusUI,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      hireDate: hireDate ?? this.hireDate,
      salary: salary ?? this.salary,
      commissionPct: commissionPct ?? this.commissionPct,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus
    );
  }

  @override
  List<Object> get props => [employees, employeeListStatusUI, firstname, lastname,
    email, phoneNumber, hireDate, salary, commissionPct, formStatus, generalNotificationKey,
    loadedEmployee, editMode, deleteStatus];

  @override
  bool get stringify => true;
}
