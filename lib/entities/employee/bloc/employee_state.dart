part of 'employee_bloc.dart';

enum EmployeeListStatusUI {init, loading, done}

class EmployeeState extends Equatable {
  final List<Employee> employees;
  final EmployeeListStatusUI employeeListStatusUI;

  final FirstnameInput firstname;
  final LastnameInput lastname;
  final EmailInput email;
  final PhoneNumberInput phoneNumber;
  final HireDateInput hireDate;
  final SalaryInput salary;
  final CommissionInput commission;
  final FormzStatus formStatus;
  final String generalNotificationKey;

  const EmployeeState({
    this.employees = const [],
    this.employeeListStatusUI = EmployeeListStatusUI.init,
    this.firstname = const FirstnameInput.pure(),
    this.lastname = const LastnameInput.pure(),
    this.email = const EmailInput.pure(),
    this.phoneNumber = const PhoneNumberInput.pure(),
    this.hireDate = const HireDateInput.pure(),
    this.salary = const SalaryInput.pure(),
    this.commission = const CommissionInput.pure(),
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = ''
  });

  EmployeeState copyWith({
    List<Employee> employees,
    EmployeeListStatusUI employeeStatusUI,
    FirstnameInput firstname,
    LastnameInput lastname,
    EmailInput email,
    PhoneNumberInput phoneNumber,
    HireDateInput hireDate,
    SalaryInput salary,
    CommissionInput commission,
    FormzStatus formStatus,
    String generalNotificationKey
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      employeeListStatusUI: employeeStatusUI ?? this.employeeListStatusUI,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      hireDate: hireDate ?? this.hireDate,
      salary: salary ?? this.salary,
      commission: commission ?? this.commission,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
    );
  }

  @override
  List<Object> get props => [employees, employeeListStatusUI, firstname, lastname,
    email, phoneNumber, hireDate, salary, commission, formStatus, generalNotificationKey];

  @override
  bool get stringify => true;
}
