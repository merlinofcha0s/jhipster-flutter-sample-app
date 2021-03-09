import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/job/job_model.dart';

enum JobTitleValidationError { invalid }
class JobTitleInput extends FormzInput<String, JobTitleValidationError> {
  const JobTitleInput.pure() : super.pure('');
  const JobTitleInput.dirty([String value = '']) : super.dirty(value);

  @override
  JobTitleValidationError validator(String value) {
    return null;
  }
}

enum MinSalaryValidationError { invalid }
class MinSalaryInput extends FormzInput<int, MinSalaryValidationError> {
  const MinSalaryInput.pure() : super.pure(0);
  const MinSalaryInput.dirty([int value = 0]) : super.dirty(value);

  @override
  MinSalaryValidationError validator(int value) {
    return null;
  }
}

enum MaxSalaryValidationError { invalid }
class MaxSalaryInput extends FormzInput<int, MaxSalaryValidationError> {
  const MaxSalaryInput.pure() : super.pure(0);
  const MaxSalaryInput.dirty([int value = 0]) : super.dirty(value);

  @override
  MaxSalaryValidationError validator(int value) {
    return null;
  }
}

