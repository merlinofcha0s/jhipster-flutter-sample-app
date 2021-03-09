// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(login) => "Current user : ${login}";

  static m1(min) => "Rules : 1 uppercase, 1 number and ${min} characters";

  static m2(min) => "The login has to contain more than ${min}";

  static m3(min) => "Rules : 1 uppercase, 1 number and ${min} characters";

  static m4(min) => "Firstname has to be ${min} characters minimum";

  static m5(min) => "Lastname has to be ${min} characters minimum";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "drawerLogoutTitle" : MessageLookupByLibrary.simpleMessage("Sign out"),
    "drawerMenuMain" : MessageLookupByLibrary.simpleMessage("Home"),
    "drawerMenuTitle" : MessageLookupByLibrary.simpleMessage("Menu"),
    "drawerSettingsTitle" : MessageLookupByLibrary.simpleMessage("Settings"),
    "entityActionConfirmDelete" : MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "entityActionConfirmDeleteNo" : MessageLookupByLibrary.simpleMessage("No"),
    "entityActionConfirmDeleteYes" : MessageLookupByLibrary.simpleMessage("Yes"),
    "entityActionCreate" : MessageLookupByLibrary.simpleMessage("Create"),
    "entityActionDelete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "entityActionEdit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "entityActionView" : MessageLookupByLibrary.simpleMessage("View"),
    "genericErrorBadRequest" : MessageLookupByLibrary.simpleMessage("Something wrong happened with the received data"),
    "genericErrorServer" : MessageLookupByLibrary.simpleMessage("Something wrong when calling the server, please try again"),
    "loadingLabel" : MessageLookupByLibrary.simpleMessage("Loading..."),
    "locale" : MessageLookupByLibrary.simpleMessage("en"),
    "pageEntitiesCountryCountryNameField" : MessageLookupByLibrary.simpleMessage("CountryName"),
    "pageEntitiesCountryCreateTitle" : MessageLookupByLibrary.simpleMessage("Create Countries"),
    "pageEntitiesCountryDeleteOk" : MessageLookupByLibrary.simpleMessage("Country deleted successfuly"),
    "pageEntitiesCountryDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete Countries"),
    "pageEntitiesCountryListTitle" : MessageLookupByLibrary.simpleMessage("Countries list"),
    "pageEntitiesCountryUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit Countries"),
    "pageEntitiesCountryViewTitle" : MessageLookupByLibrary.simpleMessage("Countries View"),
    "pageEntitiesDepartmentCreateTitle" : MessageLookupByLibrary.simpleMessage("Create Departments"),
    "pageEntitiesDepartmentDeleteOk" : MessageLookupByLibrary.simpleMessage("Department deleted successfuly"),
    "pageEntitiesDepartmentDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete Departments"),
    "pageEntitiesDepartmentDepartmentNameField" : MessageLookupByLibrary.simpleMessage("DepartmentName"),
    "pageEntitiesDepartmentListTitle" : MessageLookupByLibrary.simpleMessage("Departments list"),
    "pageEntitiesDepartmentUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit Departments"),
    "pageEntitiesDepartmentViewTitle" : MessageLookupByLibrary.simpleMessage("Departments View"),
    "pageEntitiesEmployeeCommissionPctField" : MessageLookupByLibrary.simpleMessage("CommissionPct"),
    "pageEntitiesEmployeeCreateTitle" : MessageLookupByLibrary.simpleMessage("Create Employees"),
    "pageEntitiesEmployeeDeleteOk" : MessageLookupByLibrary.simpleMessage("Employee deleted successfuly"),
    "pageEntitiesEmployeeDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete Employees"),
    "pageEntitiesEmployeeHireDateField" : MessageLookupByLibrary.simpleMessage("HireDate"),
    "pageEntitiesEmployeeListTitle" : MessageLookupByLibrary.simpleMessage("Employees list"),
    "pageEntitiesEmployeeSalaryField" : MessageLookupByLibrary.simpleMessage("Salary"),
    "pageEntitiesEmployeeUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit Employees"),
    "pageEntitiesEmployeeViewTitle" : MessageLookupByLibrary.simpleMessage("Employees View"),
    "pageEntitiesJobCreateTitle" : MessageLookupByLibrary.simpleMessage("Create Jobs"),
    "pageEntitiesJobDeleteOk" : MessageLookupByLibrary.simpleMessage("Job deleted successfuly"),
    "pageEntitiesJobDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete Jobs"),
    "pageEntitiesJobHistoryCreateTitle" : MessageLookupByLibrary.simpleMessage("Create JobHistories"),
    "pageEntitiesJobHistoryDeleteOk" : MessageLookupByLibrary.simpleMessage("JobHistory deleted successfuly"),
    "pageEntitiesJobHistoryDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete JobHistories"),
    "pageEntitiesJobHistoryEndDateField" : MessageLookupByLibrary.simpleMessage("EndDate"),
    "pageEntitiesJobHistoryLanguageField" : MessageLookupByLibrary.simpleMessage("Language"),
    "pageEntitiesJobHistoryListTitle" : MessageLookupByLibrary.simpleMessage("JobHistories list"),
    "pageEntitiesJobHistoryStartDateField" : MessageLookupByLibrary.simpleMessage("StartDate"),
    "pageEntitiesJobHistoryUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit JobHistories"),
    "pageEntitiesJobHistoryViewTitle" : MessageLookupByLibrary.simpleMessage("JobHistories View"),
    "pageEntitiesJobJobTitleField" : MessageLookupByLibrary.simpleMessage("JobTitle"),
    "pageEntitiesJobListTitle" : MessageLookupByLibrary.simpleMessage("Jobs list"),
    "pageEntitiesJobMaxSalaryField" : MessageLookupByLibrary.simpleMessage("MaxSalary"),
    "pageEntitiesJobMinSalaryField" : MessageLookupByLibrary.simpleMessage("MinSalary"),
    "pageEntitiesJobUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit Jobs"),
    "pageEntitiesJobViewTitle" : MessageLookupByLibrary.simpleMessage("Jobs View"),
    "pageEntitiesLocationCityField" : MessageLookupByLibrary.simpleMessage("City"),
    "pageEntitiesLocationCreateTitle" : MessageLookupByLibrary.simpleMessage("Create Locations"),
    "pageEntitiesLocationDeleteOk" : MessageLookupByLibrary.simpleMessage("Location deleted successfuly"),
    "pageEntitiesLocationDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete Locations"),
    "pageEntitiesLocationListTitle" : MessageLookupByLibrary.simpleMessage("Locations list"),
    "pageEntitiesLocationPostalCodeField" : MessageLookupByLibrary.simpleMessage("PostalCode"),
    "pageEntitiesLocationStateProvinceField" : MessageLookupByLibrary.simpleMessage("StateProvince"),
    "pageEntitiesLocationStreetAddressField" : MessageLookupByLibrary.simpleMessage("StreetAddress"),
    "pageEntitiesLocationUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit Locations"),
    "pageEntitiesLocationViewTitle" : MessageLookupByLibrary.simpleMessage("Locations View"),
    "pageEntitiesPersonCreateTitle" : MessageLookupByLibrary.simpleMessage("Create People"),
    "pageEntitiesPersonDeleteOk" : MessageLookupByLibrary.simpleMessage("Person deleted successfuly"),
    "pageEntitiesPersonDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete People"),
    "pageEntitiesPersonEmailField" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageEntitiesPersonFirstNameField" : MessageLookupByLibrary.simpleMessage("FirstName"),
    "pageEntitiesPersonLastNameField" : MessageLookupByLibrary.simpleMessage("LastName"),
    "pageEntitiesPersonListTitle" : MessageLookupByLibrary.simpleMessage("People list"),
    "pageEntitiesPersonPhoneNumberField" : MessageLookupByLibrary.simpleMessage("PhoneNumber"),
    "pageEntitiesPersonUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit People"),
    "pageEntitiesPersonViewTitle" : MessageLookupByLibrary.simpleMessage("People View"),
    "pageEntitiesRegionCreateTitle" : MessageLookupByLibrary.simpleMessage("Create Regions"),
    "pageEntitiesRegionDeleteOk" : MessageLookupByLibrary.simpleMessage("Region deleted successfuly"),
    "pageEntitiesRegionDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete Regions"),
    "pageEntitiesRegionListTitle" : MessageLookupByLibrary.simpleMessage("Regions list"),
    "pageEntitiesRegionRegionNameField" : MessageLookupByLibrary.simpleMessage("RegionName"),
    "pageEntitiesRegionUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit Regions"),
    "pageEntitiesRegionViewTitle" : MessageLookupByLibrary.simpleMessage("Regions View"),
    "pageEntitiesTaskCreateTitle" : MessageLookupByLibrary.simpleMessage("Create Tasks"),
    "pageEntitiesTaskDeleteOk" : MessageLookupByLibrary.simpleMessage("Task deleted successfuly"),
    "pageEntitiesTaskDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Delete Tasks"),
    "pageEntitiesTaskDescriptionField" : MessageLookupByLibrary.simpleMessage("Description"),
    "pageEntitiesTaskListTitle" : MessageLookupByLibrary.simpleMessage("Tasks list"),
    "pageEntitiesTaskTitleField" : MessageLookupByLibrary.simpleMessage("Title"),
    "pageEntitiesTaskUpdateTitle" : MessageLookupByLibrary.simpleMessage("Edit Tasks"),
    "pageEntitiesTaskViewTitle" : MessageLookupByLibrary.simpleMessage("Tasks View"),
    "pageLoginBar" : MessageLookupByLibrary.simpleMessage("Login"),
    "pageLoginErrorAuthentication" : MessageLookupByLibrary.simpleMessage("Problem when authenticate, verify your credential"),
    "pageLoginLoginButton" : MessageLookupByLibrary.simpleMessage("Sign in"),
    "pageLoginRegisterButton" : MessageLookupByLibrary.simpleMessage("Register"),
    "pageLoginTitle" : MessageLookupByLibrary.simpleMessage("Welcome to Jhipster flutter app"),
    "pageMainCurrentUser" : m0,
    "pageMainEventButton" : MessageLookupByLibrary.simpleMessage("Event"),
    "pageMainMarketButton" : MessageLookupByLibrary.simpleMessage("Marketplace"),
    "pageMainNumberPackOpen" : MessageLookupByLibrary.simpleMessage("Packs"),
    "pageMainOpenPackButton" : MessageLookupByLibrary.simpleMessage("Open pack"),
    "pageMainProfileButton" : MessageLookupByLibrary.simpleMessage("Your profile"),
    "pageMainTitle" : MessageLookupByLibrary.simpleMessage("Main page"),
    "pageMainWelcome" : MessageLookupByLibrary.simpleMessage("Welcome to your Jhipster flutter app"),
    "pageRegisterConfirmationPasswordValidationError" : m1,
    "pageRegisterErrorLoginExist" : MessageLookupByLibrary.simpleMessage("Login already taken"),
    "pageRegisterErrorMailExist" : MessageLookupByLibrary.simpleMessage("Email already exist"),
    "pageRegisterErrorPasswordNotIdentical" : MessageLookupByLibrary.simpleMessage("The passwords are not identical"),
    "pageRegisterFormConfirmPassword" : MessageLookupByLibrary.simpleMessage("Confirm password"),
    "pageRegisterFormEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageRegisterFormEmailHint" : MessageLookupByLibrary.simpleMessage("you@example.com"),
    "pageRegisterFormLogin" : MessageLookupByLibrary.simpleMessage("Login"),
    "pageRegisterFormPassword" : MessageLookupByLibrary.simpleMessage("Password"),
    "pageRegisterFormSubmit" : MessageLookupByLibrary.simpleMessage("Sign up"),
    "pageRegisterFormTermsConditions" : MessageLookupByLibrary.simpleMessage("I accept the terms of use"),
    "pageRegisterFormTermsConditionsNotChecked" : MessageLookupByLibrary.simpleMessage("Please accept the terms and conditions"),
    "pageRegisterLoginValidationError" : m2,
    "pageRegisterMailValidationError" : MessageLookupByLibrary.simpleMessage("Please enter a valid address email"),
    "pageRegisterPasswordValidationError" : m3,
    "pageRegisterSuccess" : MessageLookupByLibrary.simpleMessage("Congratulation"),
    "pageRegisterSuccessAltImg" : MessageLookupByLibrary.simpleMessage("Register success"),
    "pageRegisterSuccessSub" : MessageLookupByLibrary.simpleMessage("You have successfuly registered"),
    "pageRegisterTitle" : MessageLookupByLibrary.simpleMessage("Register"),
    "pageSettingsEmailErrorValidation" : MessageLookupByLibrary.simpleMessage("Email format incorrect"),
    "pageSettingsFirstnameErrorValidation" : m4,
    "pageSettingsFormEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageSettingsFormFirstname" : MessageLookupByLibrary.simpleMessage("Firstname"),
    "pageSettingsFormLanguages" : MessageLookupByLibrary.simpleMessage("Languages"),
    "pageSettingsFormLastname" : MessageLookupByLibrary.simpleMessage("Lastname"),
    "pageSettingsFormSave" : MessageLookupByLibrary.simpleMessage("Save"),
    "pageSettingsLastnameErrorValidation" : m5,
    "pageSettingsSave" : MessageLookupByLibrary.simpleMessage("Settings saved !"),
    "pageSettingsTitle" : MessageLookupByLibrary.simpleMessage("Settings")
  };
}
