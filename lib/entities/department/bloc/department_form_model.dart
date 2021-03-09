import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/department/department_model.dart';

enum DepartmentNameValidationError { invalid }
class DepartmentNameInput extends FormzInput<String, DepartmentNameValidationError> {
  const DepartmentNameInput.pure() : super.pure('');
  const DepartmentNameInput.dirty([String value = '']) : super.dirty(value);

  @override
  DepartmentNameValidationError validator(String value) {
    return null;
  }
}

