import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import 'package:jhipsterFlutterSampleApp/entities/department/department_model.dart';
import 'package:jhipsterFlutterSampleApp/entities/department/department_repository.dart';
import 'package:jhipsterFlutterSampleApp/entities/department/bloc/department_form_model.dart';
import 'package:jhipsterFlutterSampleApp/generated/l10n.dart';
import 'package:jhipsterFlutterSampleApp/shared/repository/http_utils.dart';
import 'package:intl/intl.dart';

part 'department_events.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final DepartmentRepository _departmentRepository;

  final departmentNameController = TextEditingController();

  DepartmentBloc({@required DepartmentRepository departmentRepository}) : assert(departmentRepository != null),
        _departmentRepository = departmentRepository, 
  super(DepartmentState());

  @override
  void onTransition(Transition<DepartmentEvent, DepartmentState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<DepartmentState> mapEventToState(DepartmentEvent event) async* {
    if (event is InitDepartmentList) {
      yield* onInitList(event);
    } else if (event is DepartmentFormSubmitted) {
      yield* onSubmit();
    } else if (event is LoadDepartmentByIdForEdit) {
      yield* onLoadDepartmentIdForEdit(event);
    } else if (event is DeleteDepartmentById) {
      yield* onDeleteDepartmentId(event);
    } else if (event is LoadDepartmentByIdForView) {
      yield* onLoadDepartmentIdForView(event);
    }else if (event is DepartmentNameChanged){
      yield* onDepartmentNameChange(event);
    }  }

  Stream<DepartmentState> onInitList(InitDepartmentList event) async* {
    yield this.state.copyWith(departmentStatusUI: DepartmentStatusUI.loading);
    List<Department> departments = await _departmentRepository.getAllDepartments();
    yield this.state.copyWith(departments: departments, departmentStatusUI: DepartmentStatusUI.done);
  }

  Stream<DepartmentState> onSubmit() async* {
    if (this.state.formStatus.isValidated) {
      yield this.state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        Department result;
        if(this.state.editMode) {
          Department newDepartment = Department(state.loadedDepartment.id,
            this.state.departmentName.value,  
            null, 
          );

          result = await _departmentRepository.update(newDepartment);
        } else {
          Department newDepartment = Department(null,
            this.state.departmentName.value,  
            null, 
          );

          result = await _departmentRepository.create(newDepartment);
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

  Stream<DepartmentState> onLoadDepartmentIdForEdit(LoadDepartmentByIdForEdit event) async* {
    yield this.state.copyWith(departmentStatusUI: DepartmentStatusUI.loading);
    Department loadedDepartment = await _departmentRepository.getDepartment(event.id);

    final departmentName = DepartmentNameInput.dirty(loadedDepartment?.departmentName != null ? loadedDepartment.departmentName: '');

    yield this.state.copyWith(loadedDepartment: loadedDepartment, editMode: true,
      departmentName: departmentName,
    departmentStatusUI: DepartmentStatusUI.done);

    departmentNameController.text = loadedDepartment.departmentName;
  }

  Stream<DepartmentState> onDeleteDepartmentId(DeleteDepartmentById event) async* {
    try {
      await _departmentRepository.delete(event.id);
      this.add(InitDepartmentList());
      yield this.state.copyWith(deleteStatus: DepartmentDeleteStatus.ok);
    } catch (e) {
      yield this.state.copyWith(deleteStatus: DepartmentDeleteStatus.ko,
          generalNotificationKey: HttpUtils.errorServerKey);
    }
    yield this.state.copyWith(deleteStatus: DepartmentDeleteStatus.none);
  }

  Stream<DepartmentState> onLoadDepartmentIdForView(LoadDepartmentByIdForView event) async* {
    yield this.state.copyWith(departmentStatusUI: DepartmentStatusUI.loading);
    try {
      Department loadedDepartment = await _departmentRepository.getDepartment(event.id);
      yield this.state.copyWith(loadedDepartment: loadedDepartment, departmentStatusUI: DepartmentStatusUI.done);
    } catch(e) {
      yield this.state.copyWith(loadedDepartment: null, departmentStatusUI: DepartmentStatusUI.error);
    }
  }


  Stream<DepartmentState> onDepartmentNameChange(DepartmentNameChanged event) async* {
    final departmentName = DepartmentNameInput.dirty(event.departmentName);
    yield this.state.copyWith(
      departmentName: departmentName,
      formStatus: Formz.validate([
        departmentName,
      ]),
    );
  }

  @override
  Future<void> close() {
    departmentNameController.dispose();
    return super.close();
  }

}