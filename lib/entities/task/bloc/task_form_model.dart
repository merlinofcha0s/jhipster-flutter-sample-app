import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/task/task_model.dart';

enum TitleValidationError { invalid }
class TitleInput extends FormzInput<String, TitleValidationError> {
  const TitleInput.pure() : super.pure('');
  const TitleInput.dirty([String value = '']) : super.dirty(value);

  @override
  TitleValidationError validator(String value) {
    return null;
  }
}

enum DescriptionValidationError { invalid }
class DescriptionInput extends FormzInput<String, DescriptionValidationError> {
  const DescriptionInput.pure() : super.pure('');
  const DescriptionInput.dirty([String value = '']) : super.dirty(value);

  @override
  DescriptionValidationError validator(String value) {
    return null;
  }
}

