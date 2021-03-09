part of 'department_bloc.dart';

enum DepartmentStatusUI {init, loading, error, done}
enum DepartmentDeleteStatus {ok, ko, none}

class DepartmentState extends Equatable {
  final List<Department> departments;
  final Department loadedDepartment;
  final bool editMode;
  final DepartmentDeleteStatus deleteStatus;
  final DepartmentStatusUI departmentStatusUI;

  final FormzStatus formStatus;
  final String generalNotificationKey;

  final DepartmentNameInput departmentName;

  
  DepartmentState(
{
    this.departments = const [],
    this.departmentStatusUI = DepartmentStatusUI.init,
    this.loadedDepartment = const Department(0,'',null,),
    this.editMode = false,
    this.formStatus = FormzStatus.pure,
    this.generalNotificationKey = '',
    this.deleteStatus = DepartmentDeleteStatus.none,
    this.departmentName = const DepartmentNameInput.pure(),
  });

  DepartmentState copyWith({
    List<Department> departments,
    DepartmentStatusUI departmentStatusUI,
    bool editMode,
    DepartmentDeleteStatus deleteStatus,
    Department loadedDepartment,
    FormzStatus formStatus,
    String generalNotificationKey,
    DepartmentNameInput departmentName,
  }) {
    return DepartmentState(
      departments: departments ?? this.departments,
      departmentStatusUI: departmentStatusUI ?? this.departmentStatusUI,
      loadedDepartment: loadedDepartment ?? this.loadedDepartment,
      editMode: editMode ?? this.editMode,
      formStatus: formStatus ?? this.formStatus,
      generalNotificationKey: generalNotificationKey ?? this.generalNotificationKey,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      departmentName: departmentName ?? this.departmentName,
    );
  }

  @override
  List<Object> get props => [departments, departmentStatusUI,
     loadedDepartment, editMode, deleteStatus, formStatus, generalNotificationKey, 
departmentName,];

  @override
  bool get stringify => true;
}
