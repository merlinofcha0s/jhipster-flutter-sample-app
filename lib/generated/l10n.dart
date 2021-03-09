// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get locale {
    return Intl.message(
      'en',
      name: 'locale',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get pageLoginBar {
    return Intl.message(
      'Login',
      name: 'pageLoginBar',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Jhipster flutter app`
  String get pageLoginTitle {
    return Intl.message(
      'Welcome to Jhipster flutter app',
      name: 'pageLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get pageLoginLoginButton {
    return Intl.message(
      'Sign in',
      name: 'pageLoginLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get pageLoginRegisterButton {
    return Intl.message(
      'Register',
      name: 'pageLoginRegisterButton',
      desc: '',
      args: [],
    );
  }

  /// `Problem when authenticate, verify your credential`
  String get pageLoginErrorAuthentication {
    return Intl.message(
      'Problem when authenticate, verify your credential',
      name: 'pageLoginErrorAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get pageRegisterTitle {
    return Intl.message(
      'Register',
      name: 'pageRegisterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get pageRegisterFormLogin {
    return Intl.message(
      'Login',
      name: 'pageRegisterFormLogin',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get pageRegisterFormEmail {
    return Intl.message(
      'Email',
      name: 'pageRegisterFormEmail',
      desc: '',
      args: [],
    );
  }

  /// `you@example.com`
  String get pageRegisterFormEmailHint {
    return Intl.message(
      'you@example.com',
      name: 'pageRegisterFormEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pageRegisterFormPassword {
    return Intl.message(
      'Password',
      name: 'pageRegisterFormPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get pageRegisterFormConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'pageRegisterFormConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `I accept the terms of use`
  String get pageRegisterFormTermsConditions {
    return Intl.message(
      'I accept the terms of use',
      name: 'pageRegisterFormTermsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the terms and conditions`
  String get pageRegisterFormTermsConditionsNotChecked {
    return Intl.message(
      'Please accept the terms and conditions',
      name: 'pageRegisterFormTermsConditionsNotChecked',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get pageRegisterFormSubmit {
    return Intl.message(
      'Sign up',
      name: 'pageRegisterFormSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Email already exist`
  String get pageRegisterErrorMailExist {
    return Intl.message(
      'Email already exist',
      name: 'pageRegisterErrorMailExist',
      desc: '',
      args: [],
    );
  }

  /// `Login already taken`
  String get pageRegisterErrorLoginExist {
    return Intl.message(
      'Login already taken',
      name: 'pageRegisterErrorLoginExist',
      desc: '',
      args: [],
    );
  }

  /// `The passwords are not identical`
  String get pageRegisterErrorPasswordNotIdentical {
    return Intl.message(
      'The passwords are not identical',
      name: 'pageRegisterErrorPasswordNotIdentical',
      desc: '',
      args: [],
    );
  }

  /// `Register success`
  String get pageRegisterSuccessAltImg {
    return Intl.message(
      'Register success',
      name: 'pageRegisterSuccessAltImg',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation`
  String get pageRegisterSuccess {
    return Intl.message(
      'Congratulation',
      name: 'pageRegisterSuccess',
      desc: '',
      args: [],
    );
  }

  /// `You have successfuly registered`
  String get pageRegisterSuccessSub {
    return Intl.message(
      'You have successfuly registered',
      name: 'pageRegisterSuccessSub',
      desc: '',
      args: [],
    );
  }

  /// `The login has to contain more than {min}`
  String pageRegisterLoginValidationError(Object min) {
    return Intl.message(
      'The login has to contain more than $min',
      name: 'pageRegisterLoginValidationError',
      desc: '',
      args: [min],
    );
  }

  /// `Please enter a valid address email`
  String get pageRegisterMailValidationError {
    return Intl.message(
      'Please enter a valid address email',
      name: 'pageRegisterMailValidationError',
      desc: '',
      args: [],
    );
  }

  /// `Rules : 1 uppercase, 1 number and {min} characters`
  String pageRegisterPasswordValidationError(Object min) {
    return Intl.message(
      'Rules : 1 uppercase, 1 number and $min characters',
      name: 'pageRegisterPasswordValidationError',
      desc: '',
      args: [min],
    );
  }

  /// `Rules : 1 uppercase, 1 number and {min} characters`
  String pageRegisterConfirmationPasswordValidationError(Object min) {
    return Intl.message(
      'Rules : 1 uppercase, 1 number and $min characters',
      name: 'pageRegisterConfirmationPasswordValidationError',
      desc: '',
      args: [min],
    );
  }

  /// `Your profile`
  String get pageMainProfileButton {
    return Intl.message(
      'Your profile',
      name: 'pageMainProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get pageMainEventButton {
    return Intl.message(
      'Event',
      name: 'pageMainEventButton',
      desc: '',
      args: [],
    );
  }

  /// `Open pack`
  String get pageMainOpenPackButton {
    return Intl.message(
      'Open pack',
      name: 'pageMainOpenPackButton',
      desc: '',
      args: [],
    );
  }

  /// `Packs`
  String get pageMainNumberPackOpen {
    return Intl.message(
      'Packs',
      name: 'pageMainNumberPackOpen',
      desc: '',
      args: [],
    );
  }

  /// `Marketplace`
  String get pageMainMarketButton {
    return Intl.message(
      'Marketplace',
      name: 'pageMainMarketButton',
      desc: '',
      args: [],
    );
  }

  /// `Main page`
  String get pageMainTitle {
    return Intl.message(
      'Main page',
      name: 'pageMainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current user : {login}`
  String pageMainCurrentUser(Object login) {
    return Intl.message(
      'Current user : $login',
      name: 'pageMainCurrentUser',
      desc: '',
      args: [login],
    );
  }

  /// `Welcome to your Jhipster flutter app`
  String get pageMainWelcome {
    return Intl.message(
      'Welcome to your Jhipster flutter app',
      name: 'pageMainWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get drawerSettingsTitle {
    return Intl.message(
      'Settings',
      name: 'drawerSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get drawerLogoutTitle {
    return Intl.message(
      'Sign out',
      name: 'drawerLogoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get drawerMenuTitle {
    return Intl.message(
      'Menu',
      name: 'drawerMenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get drawerMenuMain {
    return Intl.message(
      'Home',
      name: 'drawerMenuMain',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get pageSettingsTitle {
    return Intl.message(
      'Settings',
      name: 'pageSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Firstname`
  String get pageSettingsFormFirstname {
    return Intl.message(
      'Firstname',
      name: 'pageSettingsFormFirstname',
      desc: '',
      args: [],
    );
  }

  /// `Lastname`
  String get pageSettingsFormLastname {
    return Intl.message(
      'Lastname',
      name: 'pageSettingsFormLastname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get pageSettingsFormEmail {
    return Intl.message(
      'Email',
      name: 'pageSettingsFormEmail',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get pageSettingsFormLanguages {
    return Intl.message(
      'Languages',
      name: 'pageSettingsFormLanguages',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get pageSettingsFormSave {
    return Intl.message(
      'Save',
      name: 'pageSettingsFormSave',
      desc: '',
      args: [],
    );
  }

  /// `Settings saved !`
  String get pageSettingsSave {
    return Intl.message(
      'Settings saved !',
      name: 'pageSettingsSave',
      desc: '',
      args: [],
    );
  }

  /// `Firstname has to be {min} characters minimum`
  String pageSettingsFirstnameErrorValidation(Object min) {
    return Intl.message(
      'Firstname has to be $min characters minimum',
      name: 'pageSettingsFirstnameErrorValidation',
      desc: '',
      args: [min],
    );
  }

  /// `Lastname has to be {min} characters minimum`
  String pageSettingsLastnameErrorValidation(Object min) {
    return Intl.message(
      'Lastname has to be $min characters minimum',
      name: 'pageSettingsLastnameErrorValidation',
      desc: '',
      args: [min],
    );
  }

  /// `Email format incorrect`
  String get pageSettingsEmailErrorValidation {
    return Intl.message(
      'Email format incorrect',
      name: 'pageSettingsEmailErrorValidation',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong happened with the received data`
  String get genericErrorBadRequest {
    return Intl.message(
      'Something wrong happened with the received data',
      name: 'genericErrorBadRequest',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong when calling the server, please try again`
  String get genericErrorServer {
    return Intl.message(
      'Something wrong when calling the server, please try again',
      name: 'genericErrorServer',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loadingLabel {
    return Intl.message(
      'Loading...',
      name: 'loadingLabel',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get entityActionView {
    return Intl.message(
      'View',
      name: 'entityActionView',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get entityActionEdit {
    return Intl.message(
      'Edit',
      name: 'entityActionEdit',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get entityActionCreate {
    return Intl.message(
      'Create',
      name: 'entityActionCreate',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get entityActionDelete {
    return Intl.message(
      'Delete',
      name: 'entityActionDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get entityActionConfirmDelete {
    return Intl.message(
      'Are you sure?',
      name: 'entityActionConfirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get entityActionConfirmDeleteYes {
    return Intl.message(
      'Yes',
      name: 'entityActionConfirmDeleteYes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get entityActionConfirmDeleteNo {
    return Intl.message(
      'No',
      name: 'entityActionConfirmDeleteNo',
      desc: '',
      args: [],
    );
  }

  /// `Countries list`
  String get pageEntitiesCountryListTitle {
    return Intl.message(
      'Countries list',
      name: 'pageEntitiesCountryListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Countries`
  String get pageEntitiesCountryUpdateTitle {
    return Intl.message(
      'Edit Countries',
      name: 'pageEntitiesCountryUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Countries`
  String get pageEntitiesCountryCreateTitle {
    return Intl.message(
      'Create Countries',
      name: 'pageEntitiesCountryCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Countries View`
  String get pageEntitiesCountryViewTitle {
    return Intl.message(
      'Countries View',
      name: 'pageEntitiesCountryViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Countries`
  String get pageEntitiesCountryDeletePopupTitle {
    return Intl.message(
      'Delete Countries',
      name: 'pageEntitiesCountryDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Country deleted successfuly`
  String get pageEntitiesCountryDeleteOk {
    return Intl.message(
      'Country deleted successfuly',
      name: 'pageEntitiesCountryDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `CountryName`
  String get pageEntitiesCountryCountryNameField {
    return Intl.message(
      'CountryName',
      name: 'pageEntitiesCountryCountryNameField',
      desc: '',
      args: [],
    );
  }

  /// `Departments list`
  String get pageEntitiesDepartmentListTitle {
    return Intl.message(
      'Departments list',
      name: 'pageEntitiesDepartmentListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Departments`
  String get pageEntitiesDepartmentUpdateTitle {
    return Intl.message(
      'Edit Departments',
      name: 'pageEntitiesDepartmentUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Departments`
  String get pageEntitiesDepartmentCreateTitle {
    return Intl.message(
      'Create Departments',
      name: 'pageEntitiesDepartmentCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Departments View`
  String get pageEntitiesDepartmentViewTitle {
    return Intl.message(
      'Departments View',
      name: 'pageEntitiesDepartmentViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Departments`
  String get pageEntitiesDepartmentDeletePopupTitle {
    return Intl.message(
      'Delete Departments',
      name: 'pageEntitiesDepartmentDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Department deleted successfuly`
  String get pageEntitiesDepartmentDeleteOk {
    return Intl.message(
      'Department deleted successfuly',
      name: 'pageEntitiesDepartmentDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `DepartmentName`
  String get pageEntitiesDepartmentDepartmentNameField {
    return Intl.message(
      'DepartmentName',
      name: 'pageEntitiesDepartmentDepartmentNameField',
      desc: '',
      args: [],
    );
  }

  /// `Employees list`
  String get pageEntitiesEmployeeListTitle {
    return Intl.message(
      'Employees list',
      name: 'pageEntitiesEmployeeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Employees`
  String get pageEntitiesEmployeeUpdateTitle {
    return Intl.message(
      'Edit Employees',
      name: 'pageEntitiesEmployeeUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Employees`
  String get pageEntitiesEmployeeCreateTitle {
    return Intl.message(
      'Create Employees',
      name: 'pageEntitiesEmployeeCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Employees View`
  String get pageEntitiesEmployeeViewTitle {
    return Intl.message(
      'Employees View',
      name: 'pageEntitiesEmployeeViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Employees`
  String get pageEntitiesEmployeeDeletePopupTitle {
    return Intl.message(
      'Delete Employees',
      name: 'pageEntitiesEmployeeDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Employee deleted successfuly`
  String get pageEntitiesEmployeeDeleteOk {
    return Intl.message(
      'Employee deleted successfuly',
      name: 'pageEntitiesEmployeeDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `HireDate`
  String get pageEntitiesEmployeeHireDateField {
    return Intl.message(
      'HireDate',
      name: 'pageEntitiesEmployeeHireDateField',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get pageEntitiesEmployeeSalaryField {
    return Intl.message(
      'Salary',
      name: 'pageEntitiesEmployeeSalaryField',
      desc: '',
      args: [],
    );
  }

  /// `CommissionPct`
  String get pageEntitiesEmployeeCommissionPctField {
    return Intl.message(
      'CommissionPct',
      name: 'pageEntitiesEmployeeCommissionPctField',
      desc: '',
      args: [],
    );
  }

  /// `Jobs list`
  String get pageEntitiesJobListTitle {
    return Intl.message(
      'Jobs list',
      name: 'pageEntitiesJobListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Jobs`
  String get pageEntitiesJobUpdateTitle {
    return Intl.message(
      'Edit Jobs',
      name: 'pageEntitiesJobUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Jobs`
  String get pageEntitiesJobCreateTitle {
    return Intl.message(
      'Create Jobs',
      name: 'pageEntitiesJobCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Jobs View`
  String get pageEntitiesJobViewTitle {
    return Intl.message(
      'Jobs View',
      name: 'pageEntitiesJobViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Jobs`
  String get pageEntitiesJobDeletePopupTitle {
    return Intl.message(
      'Delete Jobs',
      name: 'pageEntitiesJobDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Job deleted successfuly`
  String get pageEntitiesJobDeleteOk {
    return Intl.message(
      'Job deleted successfuly',
      name: 'pageEntitiesJobDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `JobTitle`
  String get pageEntitiesJobJobTitleField {
    return Intl.message(
      'JobTitle',
      name: 'pageEntitiesJobJobTitleField',
      desc: '',
      args: [],
    );
  }

  /// `MinSalary`
  String get pageEntitiesJobMinSalaryField {
    return Intl.message(
      'MinSalary',
      name: 'pageEntitiesJobMinSalaryField',
      desc: '',
      args: [],
    );
  }

  /// `MaxSalary`
  String get pageEntitiesJobMaxSalaryField {
    return Intl.message(
      'MaxSalary',
      name: 'pageEntitiesJobMaxSalaryField',
      desc: '',
      args: [],
    );
  }

  /// `JobHistories list`
  String get pageEntitiesJobHistoryListTitle {
    return Intl.message(
      'JobHistories list',
      name: 'pageEntitiesJobHistoryListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit JobHistories`
  String get pageEntitiesJobHistoryUpdateTitle {
    return Intl.message(
      'Edit JobHistories',
      name: 'pageEntitiesJobHistoryUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create JobHistories`
  String get pageEntitiesJobHistoryCreateTitle {
    return Intl.message(
      'Create JobHistories',
      name: 'pageEntitiesJobHistoryCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `JobHistories View`
  String get pageEntitiesJobHistoryViewTitle {
    return Intl.message(
      'JobHistories View',
      name: 'pageEntitiesJobHistoryViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete JobHistories`
  String get pageEntitiesJobHistoryDeletePopupTitle {
    return Intl.message(
      'Delete JobHistories',
      name: 'pageEntitiesJobHistoryDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `JobHistory deleted successfuly`
  String get pageEntitiesJobHistoryDeleteOk {
    return Intl.message(
      'JobHistory deleted successfuly',
      name: 'pageEntitiesJobHistoryDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `StartDate`
  String get pageEntitiesJobHistoryStartDateField {
    return Intl.message(
      'StartDate',
      name: 'pageEntitiesJobHistoryStartDateField',
      desc: '',
      args: [],
    );
  }

  /// `EndDate`
  String get pageEntitiesJobHistoryEndDateField {
    return Intl.message(
      'EndDate',
      name: 'pageEntitiesJobHistoryEndDateField',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get pageEntitiesJobHistoryLanguageField {
    return Intl.message(
      'Language',
      name: 'pageEntitiesJobHistoryLanguageField',
      desc: '',
      args: [],
    );
  }

  /// `Locations list`
  String get pageEntitiesLocationListTitle {
    return Intl.message(
      'Locations list',
      name: 'pageEntitiesLocationListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Locations`
  String get pageEntitiesLocationUpdateTitle {
    return Intl.message(
      'Edit Locations',
      name: 'pageEntitiesLocationUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Locations`
  String get pageEntitiesLocationCreateTitle {
    return Intl.message(
      'Create Locations',
      name: 'pageEntitiesLocationCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Locations View`
  String get pageEntitiesLocationViewTitle {
    return Intl.message(
      'Locations View',
      name: 'pageEntitiesLocationViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Locations`
  String get pageEntitiesLocationDeletePopupTitle {
    return Intl.message(
      'Delete Locations',
      name: 'pageEntitiesLocationDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Location deleted successfuly`
  String get pageEntitiesLocationDeleteOk {
    return Intl.message(
      'Location deleted successfuly',
      name: 'pageEntitiesLocationDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `StreetAddress`
  String get pageEntitiesLocationStreetAddressField {
    return Intl.message(
      'StreetAddress',
      name: 'pageEntitiesLocationStreetAddressField',
      desc: '',
      args: [],
    );
  }

  /// `PostalCode`
  String get pageEntitiesLocationPostalCodeField {
    return Intl.message(
      'PostalCode',
      name: 'pageEntitiesLocationPostalCodeField',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get pageEntitiesLocationCityField {
    return Intl.message(
      'City',
      name: 'pageEntitiesLocationCityField',
      desc: '',
      args: [],
    );
  }

  /// `StateProvince`
  String get pageEntitiesLocationStateProvinceField {
    return Intl.message(
      'StateProvince',
      name: 'pageEntitiesLocationStateProvinceField',
      desc: '',
      args: [],
    );
  }

  /// `People list`
  String get pageEntitiesPersonListTitle {
    return Intl.message(
      'People list',
      name: 'pageEntitiesPersonListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit People`
  String get pageEntitiesPersonUpdateTitle {
    return Intl.message(
      'Edit People',
      name: 'pageEntitiesPersonUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create People`
  String get pageEntitiesPersonCreateTitle {
    return Intl.message(
      'Create People',
      name: 'pageEntitiesPersonCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `People View`
  String get pageEntitiesPersonViewTitle {
    return Intl.message(
      'People View',
      name: 'pageEntitiesPersonViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete People`
  String get pageEntitiesPersonDeletePopupTitle {
    return Intl.message(
      'Delete People',
      name: 'pageEntitiesPersonDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Person deleted successfuly`
  String get pageEntitiesPersonDeleteOk {
    return Intl.message(
      'Person deleted successfuly',
      name: 'pageEntitiesPersonDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `FirstName`
  String get pageEntitiesPersonFirstNameField {
    return Intl.message(
      'FirstName',
      name: 'pageEntitiesPersonFirstNameField',
      desc: '',
      args: [],
    );
  }

  /// `LastName`
  String get pageEntitiesPersonLastNameField {
    return Intl.message(
      'LastName',
      name: 'pageEntitiesPersonLastNameField',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get pageEntitiesPersonEmailField {
    return Intl.message(
      'Email',
      name: 'pageEntitiesPersonEmailField',
      desc: '',
      args: [],
    );
  }

  /// `PhoneNumber`
  String get pageEntitiesPersonPhoneNumberField {
    return Intl.message(
      'PhoneNumber',
      name: 'pageEntitiesPersonPhoneNumberField',
      desc: '',
      args: [],
    );
  }

  /// `Regions list`
  String get pageEntitiesRegionListTitle {
    return Intl.message(
      'Regions list',
      name: 'pageEntitiesRegionListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Regions`
  String get pageEntitiesRegionUpdateTitle {
    return Intl.message(
      'Edit Regions',
      name: 'pageEntitiesRegionUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Regions`
  String get pageEntitiesRegionCreateTitle {
    return Intl.message(
      'Create Regions',
      name: 'pageEntitiesRegionCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Regions View`
  String get pageEntitiesRegionViewTitle {
    return Intl.message(
      'Regions View',
      name: 'pageEntitiesRegionViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Regions`
  String get pageEntitiesRegionDeletePopupTitle {
    return Intl.message(
      'Delete Regions',
      name: 'pageEntitiesRegionDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Region deleted successfuly`
  String get pageEntitiesRegionDeleteOk {
    return Intl.message(
      'Region deleted successfuly',
      name: 'pageEntitiesRegionDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `RegionName`
  String get pageEntitiesRegionRegionNameField {
    return Intl.message(
      'RegionName',
      name: 'pageEntitiesRegionRegionNameField',
      desc: '',
      args: [],
    );
  }

  /// `Tasks list`
  String get pageEntitiesTaskListTitle {
    return Intl.message(
      'Tasks list',
      name: 'pageEntitiesTaskListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Tasks`
  String get pageEntitiesTaskUpdateTitle {
    return Intl.message(
      'Edit Tasks',
      name: 'pageEntitiesTaskUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Tasks`
  String get pageEntitiesTaskCreateTitle {
    return Intl.message(
      'Create Tasks',
      name: 'pageEntitiesTaskCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tasks View`
  String get pageEntitiesTaskViewTitle {
    return Intl.message(
      'Tasks View',
      name: 'pageEntitiesTaskViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Tasks`
  String get pageEntitiesTaskDeletePopupTitle {
    return Intl.message(
      'Delete Tasks',
      name: 'pageEntitiesTaskDeletePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Task deleted successfuly`
  String get pageEntitiesTaskDeleteOk {
    return Intl.message(
      'Task deleted successfuly',
      name: 'pageEntitiesTaskDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get pageEntitiesTaskTitleField {
    return Intl.message(
      'Title',
      name: 'pageEntitiesTaskTitleField',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get pageEntitiesTaskDescriptionField {
    return Intl.message(
      'Description',
      name: 'pageEntitiesTaskDescriptionField',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}