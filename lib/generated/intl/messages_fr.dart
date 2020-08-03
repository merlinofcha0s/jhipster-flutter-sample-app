// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static m0(login) => "Utilisateur connecté : ${login}";

  static m1(min) => "Régles : 1 majuscule, 1 chiffre, ${min} caractères";

  static m2(min) => "Le login doit contenir au moins ${min} caractères";

  static m3(min) => "Régles : 1 majuscule, 1 chiffre, ${min} caractères";

  static m4(min) => "Prénom doit avoir au moins ${min} caractères";

  static m5(min) => "Le nom doit avoir au moins ${min} caractères";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "drawerLogoutTitle" : MessageLookupByLibrary.simpleMessage("Deconnexion"),
    "drawerMenuMain" : MessageLookupByLibrary.simpleMessage("Accueil"),
    "drawerMenuTitle" : MessageLookupByLibrary.simpleMessage("Menu"),
    "drawerSettingsTitle" : MessageLookupByLibrary.simpleMessage("Profil"),
    "entityActionConfirmDelete" : MessageLookupByLibrary.simpleMessage("Êtes vous sûr ?"),
    "entityActionConfirmDeleteNo" : MessageLookupByLibrary.simpleMessage("Non"),
    "entityActionConfirmDeleteYes" : MessageLookupByLibrary.simpleMessage("Oui"),
    "entityActionCreate" : MessageLookupByLibrary.simpleMessage("Créer"),
    "entityActionDelete" : MessageLookupByLibrary.simpleMessage("Supprimer"),
    "entityActionEdit" : MessageLookupByLibrary.simpleMessage("Editer"),
    "entityActionView" : MessageLookupByLibrary.simpleMessage("Voir"),
    "genericErrorBadRequest" : MessageLookupByLibrary.simpleMessage("Mauvais format de données"),
    "genericErrorServer" : MessageLookupByLibrary.simpleMessage("Problème de communication avec le serveur, merci de réessayer"),
    "loadingLabel" : MessageLookupByLibrary.simpleMessage("Chargement..."),
    "locale" : MessageLookupByLibrary.simpleMessage("fr"),
    "pageEntitiesEmployeeCommissionField" : MessageLookupByLibrary.simpleMessage("Commission"),
    "pageEntitiesEmployeeCreateTitle" : MessageLookupByLibrary.simpleMessage("Créer Employees"),
    "pageEntitiesEmployeeDeleteOk" : MessageLookupByLibrary.simpleMessage("Employee supprimé avec succés"),
    "pageEntitiesEmployeeDeletePopupTitle" : MessageLookupByLibrary.simpleMessage("Suppression Employee"),
    "pageEntitiesEmployeeEmailField" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageEntitiesEmployeeFirstnameField" : MessageLookupByLibrary.simpleMessage("Firstname"),
    "pageEntitiesEmployeeHireDateField" : MessageLookupByLibrary.simpleMessage("Hire date"),
    "pageEntitiesEmployeeLastnameField" : MessageLookupByLibrary.simpleMessage("Lastname"),
    "pageEntitiesEmployeeListTitle" : MessageLookupByLibrary.simpleMessage("Liste Employees"),
    "pageEntitiesEmployeePhoneNumberField" : MessageLookupByLibrary.simpleMessage("Phone number"),
    "pageEntitiesEmployeeSalaryField" : MessageLookupByLibrary.simpleMessage("Salary"),
    "pageEntitiesEmployeeUpdateTitle" : MessageLookupByLibrary.simpleMessage("Editer Employees"),
    "pageEntitiesEmployeeViewTitle" : MessageLookupByLibrary.simpleMessage("Voir Employee"),
    "pageLoginBar" : MessageLookupByLibrary.simpleMessage("Se connecter"),
    "pageLoginErrorAuthentication" : MessageLookupByLibrary.simpleMessage("Un problème est survenu, veuillez vérifier vos identifiants"),
    "pageLoginLoginButton" : MessageLookupByLibrary.simpleMessage("S\'identifier"),
    "pageLoginRegisterButton" : MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "pageLoginTitle" : MessageLookupByLibrary.simpleMessage("Bienvenue sur Jhipster flutter app"),
    "pageMainCurrentUser" : m0,
    "pageMainTitle" : MessageLookupByLibrary.simpleMessage("Page principale"),
    "pageMainWelcome" : MessageLookupByLibrary.simpleMessage("Bienvenue sur votre Jhipster flutter app"),
    "pageRegisterConfirmationPasswordValidationError" : m1,
    "pageRegisterErrorLoginExist" : MessageLookupByLibrary.simpleMessage("Cet identifiant est déjà pris"),
    "pageRegisterErrorMailExist" : MessageLookupByLibrary.simpleMessage("Cette adresse existe déjà"),
    "pageRegisterErrorPasswordNotIdentical" : MessageLookupByLibrary.simpleMessage("Les mots de passe ne sont pas identiques"),
    "pageRegisterFormConfirmPassword" : MessageLookupByLibrary.simpleMessage("Confirmer le mot de passe"),
    "pageRegisterFormEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageRegisterFormEmailHint" : MessageLookupByLibrary.simpleMessage("you@exemple.com"),
    "pageRegisterFormLogin" : MessageLookupByLibrary.simpleMessage("Identifiant"),
    "pageRegisterFormPassword" : MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "pageRegisterFormSubmit" : MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "pageRegisterFormTermsConditions" : MessageLookupByLibrary.simpleMessage("J\'accepte les conditions générales d\'utilisations"),
    "pageRegisterFormTermsConditionsNotChecked" : MessageLookupByLibrary.simpleMessage("Merci d\'accepter les conditions générales d\'utilisations"),
    "pageRegisterLoginValidationError" : m2,
    "pageRegisterMailValidationError" : MessageLookupByLibrary.simpleMessage("L\'email n\'est pas valide"),
    "pageRegisterPasswordValidationError" : m3,
    "pageRegisterSuccess" : MessageLookupByLibrary.simpleMessage("Félicitation"),
    "pageRegisterSuccessAltImg" : MessageLookupByLibrary.simpleMessage("Votre compte a été créé avec succés"),
    "pageRegisterSuccessSub" : MessageLookupByLibrary.simpleMessage("Votre compte a été créé avec succés"),
    "pageRegisterTitle" : MessageLookupByLibrary.simpleMessage("Créer un compte"),
    "pageSettingsEmailErrorValidation" : MessageLookupByLibrary.simpleMessage("Format d\'email incorrect"),
    "pageSettingsFirstnameErrorValidation" : m4,
    "pageSettingsFormEmail" : MessageLookupByLibrary.simpleMessage("Email"),
    "pageSettingsFormFirstname" : MessageLookupByLibrary.simpleMessage("Prénom"),
    "pageSettingsFormLastname" : MessageLookupByLibrary.simpleMessage("Nom"),
    "pageSettingsFormSave" : MessageLookupByLibrary.simpleMessage("Enregistrer"),
    "pageSettingsLastnameErrorValidation" : m5,
    "pageSettingsSave" : MessageLookupByLibrary.simpleMessage("Paramètres sauvegardés !"),
    "pageSettingsTitle" : MessageLookupByLibrary.simpleMessage("Paramètres")
  };
}
