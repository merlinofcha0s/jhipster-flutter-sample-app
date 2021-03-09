import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/employee/employee_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/employee/employee_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/employee/bloc/employee_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'employee_events.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;

  final hireDateController = TextEditingController();
  final salaryController = TextEditingController();
  final commissionPctController = TextEditingController();

  EmployeeBloc({@required EmployeeRepository employeeRepository}) : assert(employeeRepository != null),
        _employeeRepository = employeeRepository, 
  super(EmployeeState(null,));

  @override
  void onTransition(Transition<EmployeeEvent, EmployeeState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {
    if (event is InitEmployeeList) {
      yield* onInitList(event);
    } else if (event is EmployeeFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadEmployeeByIdForEdit) {
      yield* onLoadEmployeeIdForEdit(event);
    } else if (event is DeleteEmployeeById) {
      yield* onDeleteEmployeeId(event);
    } else if (event is LoadEmployeeByIdForView) {
      yield* onLoadEmployeeIdForView(event);
    }else if (event is HireDateChanged){
      yield* onHireDateChange(event);
    }else if (event is SalaryChanged){
      yield* onSalaryChange(event);
    }else if (event is CommissionPctChanged){
      yield* onCommissionPctChange(event);
    }  }

  Stream<EmployeeState> onInitList(InitEmployeeList event) async* {
    yield this.state.copyWith(employeeStatusUI: EmployeeStatusUI.loading);
    List<Employee> employees = await _employeeRepository.getAllEmployees();
    yield this.state.copyWith(employees: employees, employeeStatusUI: EmployeeStatusUI.done);
  }

  Stream<EmployeeState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Employee result;
        if(this.state.editMode) {
          Employee newEmployee = Employee(state.loadedEmployee.id,
            this.state.hireDate.value,  
            this.state.salary.value,  
            this.state.commissionPct.value,  
            null, 
            null, 
          );

          result = await _employeeRepository.update(newEmployee);
        } else {
          Employee newEmployee = Employee(null,
            this.state.hireDate.value,  
            this.state.salary.value,  
            this.state.commissionPct.value,  
            null, 
            null, 
          );

          result = await _employeeRepository.create(newEmployee);
        }

        if (result == null) {
          yield this.state.copyWith(formStatus: FormzStatus.submissionFailure,
              generalNotificationKey: HttpUtils.badRequestServerKey);
        } else {
          yield this.state.copyWith(formStatus: FormzStatus.submissionSuccess,
              generalNotificationKey: HttpUtils.successResult);
        }
      } catch (e) {
        yield this.state.copyWith(formStatus: FormzStatus.submissionFailure,
            generalNotificationKey: HttpUtils.errorServerKey);
      }
    }
  }

  Stream<EmployeeState> onLoadEmployeeIdForEdit(LoadEmployeeByIdForEdit event) async* {
    yield this.state.copyWith(employeeStatusUI: EmployeeStatusUI.loading);
    Employee loadedEmployee = await _employeeRepository.getEmployee(event.id);

    final hireDate = HireDateInput.dirty(loadedEmployee?.hireDate != null ? loadedEmployee.hireDate: null);
    final salary = SalaryInput.dirty(loadedEmployee?.salary != null ? loadedEmployee.salary: 0);
    final commissionPct = CommissionPctInput.dirty(loadedEmployee?.commissionPct != null ? loadedEmployee.commissionPct: 0);

    yield this.state.copyWith(loadedEmployee: loadedEmployee, editMode: true,
      hireDate: hireDate,
      salary: salary,
      commissionPct: commissionPct,
    employeeStatusUI: EmployeeStatusUI.done);

    hireDateController.text = DateFormat.yMMMMd(S.current.locale).format(loadedEmployee?.hireDate);
    salaryController.text = loadedEmployee.salary.toString();
    commissionPctController.text = loadedEmployee.commissionPct.toString();
  }

  Stream<EmployeeState> onDeleteEmployeeId(DeleteEmployeeById event) async* {
    try {
      await _employeeRepository.delete(event.id);
      this.add(InitEmployeeList());
      yield this.state.copyWith(deleteStatus: EmployeeDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: EmployeeDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: EmployeeDeleteStatus.none);
  }

  Stream<EmployeeState> onLoadEmployeeIdForView(LoadEmployeeByIdForView event) async* {
    yield this.state.copyWith(employeeStatusUI: EmployeeStatusUI.loading);
    try {
      Employee loadedEmployee = await _employeeRepository.getEmployee(event.id);
      yield this.state.copyWith(loadedEmployee: loadedEmployee, employeeStatusUI: EmployeeStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedEmployee: null, employeeStatusUI: EmployeeStatusUI.error);
    }
  }


  Stream<EmployeeState> onHireDateChange(HireDateChanged event) async* {
    final hireDate = HireDateInput.dirty(event.hireDate);
    yield this.state.copyWith(
      hireDate: hireDate,
      formStatus: Formz.validate([
        hireDate,
      this.state.salary,
      this.state.commissionPct,
      ]),
    );
  }
  Stream<EmployeeState> onSalaryChange(SalaryChanged event) async* {
    final salary = SalaryInput.dirty(event.salary);
    yield this.state.copyWith(
      salary: salary,
      formStatus: Formz.validate([
      this.state.hireDate,
        salary,
      this.state.commissionPct,
      ]),
    );
  }
  Stream<EmployeeState> onCommissionPctChange(CommissionPctChanged event) async* {
    final commissionPct = CommissionPctInput.dirty(event.commissionPct);
    yield this.state.copyWith(
      commissionPct: commissionPct,
      formStatus: Formz.validate([
      this.state.hireDate,
      this.state.salary,
        commissionPct,
      ]),
    );
  }

  @override
  Future<void> close() {
    hireDateController.dispose();
    salaryController.dispose();
    commissionPctController.dispose();
    return super.close();
  }

}