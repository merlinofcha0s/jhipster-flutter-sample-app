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
        _employeeRepository = employeeRepository, super(const EmployeeState());

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
    } else if (event is CommissionChanged) {
      yield* onCommissionChange(event);
    } else if (event is EmployeeFormCreateSubmitted) {
      yield* onCreate();
    }
  }

  Stream<EmployeeState> onInitList(InitList event) async* {
    yield state.copyWith(employeeStatusUI: EmployeeListStatusUI.loading);
    List<Employee> employees = await _employeeRepository.getAllEmployees();
    yield state.copyWith(employees: employees, employeeStatusUI: EmployeeListStatusUI.done);
  }

  Stream<EmployeeState> onFirstnameChange(FirstnameChanged event) async* {
    final firstname = FirstnameInput.dirty(event.firstname);
    yield state.copyWith(
      firstname: firstname,
      formStatus: Formz.validate([firstname, state.lastname, state.email, state.commission,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onLastnameChange(LastnameChanged event) async* {
    final lastname = LastnameInput.dirty(event.lastname);
    yield state.copyWith(
      lastname: lastname,
      formStatus: Formz.validate([state.firstname, lastname, state.email, state.commission,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onEmailChange(EmailChanged event) async* {
    final email = EmailInput.dirty(event.email);
    yield state.copyWith(
      email: email,
      formStatus: Formz.validate([state.firstname, state.lastname, email, state.commission,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onPhoneNumberChange(PhoneNumberChanged event) async* {
    final phoneNumber = PhoneNumberInput.dirty(event.phoneNumber);
    yield state.copyWith(
      phoneNumber: phoneNumber,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, state.commission,
        state.salary, phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onHireDateChange(HireDateChanged event) async* {
    final hireDate = HireDateInput.dirty(event.hireDate);
    yield state.copyWith(
      hireDate: hireDate,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, state.commission,
        state.salary, state.phoneNumber, hireDate]),
    );
  }

  Stream<EmployeeState> onSalaryChange(SalaryChanged event) async* {
    final salary = SalaryInput.dirty(event.salary);
    yield state.copyWith(
      salary: salary,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, state.commission,
        salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onCommissionChange(CommissionChanged event) async* {
    final commission = CommissionInput.dirty(event.commission);
    yield state.copyWith(
      commission: commission,
      formStatus: Formz.validate([state.firstname, state.lastname, state.email, commission,
        state.salary, state.phoneNumber, state.hireDate]),
    );
  }

  Stream<EmployeeState> onCreate() async* {
    if (state.formStatus.isValidated) {
      yield state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Employee newEmployee = Employee(state.firstname.value, state.lastname.value,
            state.email.value, state.phoneNumber.value, DateTime.now(), state.salary.value,
            state.commission.value);

        Employee result = await _employeeRepository.create(newEmployee);

        if (result == null) {
          yield state.copyWith(formStatus: FormzStatus.submissionFailure,
              generalNotificationKey: S.current.genericErrorBadRequest);
        } else {
          yield state.copyWith(formStatus: FormzStatus.submissionSuccess,
              generalNotificationKey: 'Employee created');
        }
      } catch (e) {
        yield state.copyWith(formStatus: FormzStatus.submissionFailure,
            generalNotificationKey: HttpUtils.errorServerKey);
      }
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
