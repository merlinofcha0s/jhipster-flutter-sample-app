import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:jhipsterfluttersample/entities/employee/bloc/employee_form_model.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_model.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_repository.dart';
import 'package:jhipsterfluttersample/generated/l10n.dart';
import 'package:jhipsterfluttersample/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'employee_events.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final hireDateController = TextEditingController();
  final salaryController = TextEditingController();
  final commissionController = TextEditingController();


  EmployeeBloc({@required EmployeeRepository employeeRepository}) : assert(employeeRepository != null),
        _employeeRepository = employeeRepository, super(EmployeeState(null));

  @override
  void onTransition(Transition<EmployeeEvent, EmployeeState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {
    if (event is InitList) {
      yield* onInitList(event);
    } else if (event is FirstnameChanged) {
      yield* onFirstnameChange(event);
    } else if (event is LastnameChanged) {
      yield* onLastnameChange(event);
    } else if (event is EmailChanged) {
      yield* onEmailChange(event);
    } else if (event is PhoneNumberChanged) {
      yield* onPhoneNumberChange(event);
    } else if (event is HireDateChanged) {
      yield* onHireDateChange(event);
    } else if (event is SalaryChanged) {
      yield* onSalaryChange(event);
    } else if (event is CommissionPctChanged) {
      yield* onCommissionChange(event);
    } else if (event is LanguageChanged) {
      yield* onLanguageChange(event);
    } else if (event is EmployeeFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadEmployeeByIdForEdit) {
      yield* onLoadEmployeeIdForEdit(event);
    } else if (event is DeleteEmployeeById) {
      yield* onDeleteEmployeeId(event);
    } else if (event is LoadEmployeeByIdForView) {
      yield* onLoadEmployeeIdForView(event);
    }
  }

  Stream<EmployeeState> onInitList(InitList event) async* {
    yield state.copyWith(employeeStatusUI: EmployeeStatusUI.loading);
    List<Employee> employees = await _employeeRepository.getAllEmployees();
    yield state.copyWith(employees: employees, employeeStatusUI: EmployeeStatusUI.done);
  }

  Stream<EmployeeState> onFirstnameChange(FirstnameChanged event) async* {
    final firstname = FirstnameInput.dirty(event.firstname);
    yield state.copyWith(
      firstname: firstname,
      formStatus: Formz.validate([firstname, state.lastname, state.email, state.commissionPct,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onLastnameChange(LastnameChanged event) async* {
    final lastname = LastnameInput.dirty(event.lastname);
    yield state.copyWith(
      lastname: lastname,
      formStatus: Formz.validate([state.firstname, lastname, state.email, state.commissionPct,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onEmailChange(EmailChanged event) async* {
    final email = EmailInput.dirty(event.email);
    yield state.copyWith(
      email: email,
      formStatus: Formz.validate([state.firstname, state.lastname, email, state.commissionPct,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onPhoneNumberChange(PhoneNumberChanged event) async* {
    final phoneNumber = PhoneNumberInput.dirty(event.phoneNumber);
    yield state.copyWith(
      phoneNumber: phoneNumber,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, state.commissionPct,
        state.salary, phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onHireDateChange(HireDateChanged event) async* {
    final hireDate = HireDateInput.dirty(event.hireDate);
    yield state.copyWith(
      hireDate: hireDate,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, state.commissionPct,
        state.salary, state.phoneNumber, hireDate]),
    );
  }

  Stream<EmployeeState> onSalaryChange(SalaryChanged event) async* {
    final salary = SalaryInput.dirty(event.salary);
    yield state.copyWith(
      salary: salary,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, state.commissionPct,
        salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onCommissionChange(CommissionPctChanged event) async* {
    final commissionPct = CommissionPctInput.dirty(event.commissionPct);
    yield state.copyWith(
      commissionPct: commissionPct,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, commissionPct,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onLanguageChange(LanguageChanged event) async* {
    final language = LanguageInput.dirty(event.language);
    yield state.copyWith(
      language: language,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, state.commissionPct,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onSubmit() async* {
    if (state.formStatus.isValidated) {
      yield state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Employee result;
        if(state.editMode) {
          Employee newEmployee = Employee(state.loadedEmployee.id, state.firstname.value, state.lastname.value,
              state.email.value, state.phoneNumber.value, state.hireDate.value, state.salary.value,
              state.commissionPct.value, state.language.value);

          result = await _employeeRepository.update(newEmployee);
        } else {
          Employee newEmployee = Employee(null, state.firstname.value, state.lastname.value,
              state.email.value, state.phoneNumber.value, state.hireDate.value, state.salary.value,
              state.commissionPct.value, state.language.value);

          result = await _employeeRepository.create(newEmployee);
        }

        if (result == null) {
          yield state.copyWith(formStatus: FormzStatus.submissionFailure,
              generalNotificationKey: HttpUtils.badRequestServerKey);
        } else {
          yield state.copyWith(formStatus: FormzStatus.submissionSuccess,
              generalNotificationKey: HttpUtils.successResult);
        }
      } catch (e) {
        yield state.copyWith(formStatus: FormzStatus.submissionFailure,
            generalNotificationKey: HttpUtils.errorServerKey);
      }
    }
  }

  Stream<EmployeeState> onLoadEmployeeIdForEdit(LoadEmployeeByIdForEdit event) async* {
    yield state.copyWith(employeeStatusUI: EmployeeStatusUI.loading);
    Employee loadedEmployee = await _employeeRepository.getEmployee(event.id);

    final firstname = FirstnameInput.dirty(loadedEmployee?.firstName != null ? loadedEmployee.firstName: '');
    final lastname = LastnameInput.dirty(loadedEmployee?.lastName != null ? loadedEmployee.lastName: '');
    final email = EmailInput.dirty(loadedEmployee?.email != null ? loadedEmployee.email: '');
    final phoneNumber = PhoneNumberInput.dirty(loadedEmployee?.phoneNumber != null ? loadedEmployee.phoneNumber: '');
    final hireDate = HireDateInput.dirty(loadedEmployee?.hireDate != null ? loadedEmployee?.hireDate : DateTime.now());
    final salary = SalaryInput.dirty(loadedEmployee?.salary != null ? loadedEmployee.salary: 0);
    final commissionPct = CommissionPctInput.dirty(loadedEmployee?.commissionPct != null ? loadedEmployee.commissionPct: 0);

    yield state.copyWith(loadedEmployee: loadedEmployee, editMode: true,
        firstname: firstname, lastname: lastname, email: email,
        phoneNumber: phoneNumber, hireDate: hireDate, salary: salary,
        commissionPct: commissionPct, employeeStatusUI: EmployeeStatusUI.done);

    emailController.text = loadedEmployee.email;
    lastNameController.text = loadedEmployee.lastName;
    firstNameController.text = loadedEmployee.firstName;
    phoneNumberController.text = loadedEmployee.phoneNumber;
    hireDateController.text = DateFormat.yMMMMd(S.current.locale).format(loadedEmployee?.hireDate);
    salaryController.text = loadedEmployee.salary.toString();
    commissionController.text = loadedEmployee.commissionPct.toString();
  }

  Stream<EmployeeState> onDeleteEmployeeId(DeleteEmployeeById event) async* {
    try {
      await _employeeRepository.delete(event.id);
      this.add(InitList());
      yield state.copyWith(deleteStatus: EmployeeDeleteStatus.ok);
    } catch (e) {
      yield state.copyWith(deleteStatus: EmployeeDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield state.copyWith(deleteStatus: EmployeeDeleteStatus.none);
  }

  Stream<EmployeeState> onLoadEmployeeIdForView(LoadEmployeeByIdForView event) async* {
    yield state.copyWith(employeeStatusUI: EmployeeStatusUI.loading);
    try {
      Employee loadedEmployee = await _employeeRepository.getEmployee(event.id);
      yield state.copyWith(loadedEmployee: loadedEmployee, employeeStatusUI: EmployeeStatusUI.done);
    } catch(e) {
      yield state.copyWith(loadedEmployee: null, employeeStatusUI: EmployeeStatusUI.error);
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    phoneNumberController.dispose();
    hireDateController.dispose();
    salaryController.dispose();
    commissionController.dispose();
    return super.close();
  }

}
