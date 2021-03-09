import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/employee/employee_model.dart';

enum HireDateValidationError { invalid }
class HireDateInput extends FormzInput<DateTime, HireDateValidationError> {
  HireDateInput.pure() : super.pure(DateTime.now());
  HireDateInput.dirty([DateTime value]) : super.dirty(value);

  @override
  HireDateValidationError validator(DateTime value) {
    return null;
  }
}

enum SalaryValidationError { invalid }
class SalaryInput extends FormzInput<int, SalaryValidationError> {
  const SalaryInput.pure() : super.pure(0);
  const SalaryInput.dirty([int value = 0]) : super.dirty(value);

  @override
  SalaryValidationError validator(int value) {
    return null;
  }
}

enum CommissionPctValidationError { invalid }
class CommissionPctInput extends FormzInput<int, CommissionPctValidationError> {
  const CommissionPctInput.pure() : super.pure(0);
  const CommissionPctInput.dirty([int value = 0]) : super.dirty(value);

  @override
  CommissionPctValidationError validator(int value) {
    return null;
  }
}

