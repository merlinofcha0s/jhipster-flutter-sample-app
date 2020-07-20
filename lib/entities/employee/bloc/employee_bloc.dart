import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_model.dart';
import 'package:jhipsterfluttersample/entities/employee/employee_repository.dart';

part 'employee_events.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;

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
    }
  }

  Stream<EmployeeState> onInitList(InitList event) async* {
    yield state.copyWith(employeeStatusUI: EmployeeStatusUI.loading);
    List<Employee> employees = await _employeeRepository.getAllEmployees();
    yield state.copyWith(employees: employees, employeeStatusUI: EmployeeStatusUI.done);
  }
}
