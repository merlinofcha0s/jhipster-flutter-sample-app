import 'package:formz/formz.dart';
import 'package:jhipsterFlutterSampleApp/entities/job_history/job_history_model.dart';

enum StartDateValidationError { invalid }
class StartDateInput extends FormzInput<DateTime, StartDateValidationError> {
  StartDateInput.pure() : super.pure(DateTime.now());
  StartDateInput.dirty([DateTime value]) : super.dirty(value);

  @override
  StartDateValidationError validator(DateTime value) {
    return null;
  }
}

enum EndDateValidationError { invalid }
class EndDateInput extends FormzInput<DateTime, EndDateValidationError> {
  EndDateInput.pure() : super.pure(DateTime.now());
  EndDateInput.dirty([DateTime value]) : super.dirty(value);

  @override
  EndDateValidationError validator(DateTime value) {
    return null;
  }
}

enum LanguageValidationError { invalid }
class LanguageInput extends FormzInput<Language, LanguageValidationError> {
  const LanguageInput.pure() : super.pure(Language.FRENCH);
  const LanguageInput.dirty([Language value]) : super.dirty(value);

  @override
  LanguageValidationError validator(Language value) {
    return null;
  }
}

