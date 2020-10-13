// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:dart_json_mapper/src/model/annotations.dart' as prefix0;
import 'package:jhipsterfluttersample/entities/employee/employee_model.dart'
    as prefix2;
import 'package:jhipsterfluttersample/shared/models/jwt_token.dart' as prefix4;
import 'package:jhipsterfluttersample/shared/models/user.dart' as prefix1;
import 'package:jhipsterfluttersample/shared/models/user_jwt.dart' as prefix3;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.JsonSerializable(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'User',
            r'.User',
            7,
            0,
            const prefix0.JsonSerializable(),
            const <int>[0, 1, 2, 3, 4, 5, 20, 21, 28, 29],
            const <int>[21, 20, 30, 28, 31, 22, 23, 24, 25, 26, 27],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (b) =>
                  (login, email, password, langKey, firstName, lastName) => b
                      ? prefix1.User(
                          login, email, password, langKey, firstName, lastName)
                      : null
            },
            -1,
            0,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'Employee',
            r'.Employee',
            7,
            1,
            const prefix0.JsonSerializable(),
            const <int>[6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 32, 33, 44, 45],
            const <int>[
              33,
              32,
              30,
              44,
              31,
              34,
              35,
              36,
              37,
              38,
              39,
              40,
              41,
              42,
              43
            ],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (b) => (id, firstName, lastName, email, phoneNumber,
                      hireDate, salary, commissionPct, language, isRight) =>
                  b
                      ? prefix2.Employee(
                          id,
                          firstName,
                          lastName,
                          email,
                          phoneNumber,
                          hireDate,
                          salary,
                          commissionPct,
                          language,
                          isRight)
                      : null
            },
            -1,
            1,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'Language',
            r'.Language',
            524295,
            2,
            const prefix0.JsonSerializable(),
            const <int>[46],
            const <int>[48, 46, 30, 49, 31, 47],
            const <int>[],
            -1,
            {},
            {},
            {},
            -1,
            2,
            const <int>[],
            const <Object>[
              prefix0.jsonSerializable,
              const prefix0.Json(enumValues: prefix2.Language.values)
            ],
            null),
        r.NonGenericClassMirrorImpl(
            r'UserJWT',
            r'.UserJWT',
            7,
            3,
            const prefix0.JsonSerializable(),
            const <int>[17, 18, 50, 51, 56, 57],
            const <int>[51, 50, 30, 56, 31, 52, 53, 54, 55],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (b) => (username, password) =>
                  b ? prefix3.UserJWT(username, password) : null
            },
            -1,
            3,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'JWTToken',
            r'.JWTToken',
            7,
            4,
            const prefix0.JsonSerializable(),
            const <int>[19, 58, 59, 62, 63],
            const <int>[59, 58, 30, 62, 31, 60, 61],
            const <int>[],
            -1,
            {},
            {},
            {r'': (b) => () => b ? prefix4.JWTToken() : null},
            -1,
            4,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(
            r'firstName',
            33797,
            0,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'firstName')]),
        r.VariableMirrorImpl(
            r'lastName',
            33797,
            0,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'lastName')]),
        r.VariableMirrorImpl(
            r'login',
            33797,
            0,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'login')]),
        r.VariableMirrorImpl(
            r'email',
            33797,
            0,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'email')]),
        r.VariableMirrorImpl(
            r'password',
            33797,
            0,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'password')]),
        r.VariableMirrorImpl(
            r'langKey',
            33797,
            0,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'langKey')]),
        r.VariableMirrorImpl(
            r'id',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'id')]),
        r.VariableMirrorImpl(
            r'firstName',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'firstName')]),
        r.VariableMirrorImpl(
            r'lastName',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'lastName')]),
        r.VariableMirrorImpl(
            r'email',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'email')]),
        r.VariableMirrorImpl(
            r'phoneNumber',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'phoneNumber')]),
        r.VariableMirrorImpl(
            r'hireDate',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            7,
            7, const <int>[], const <Object>[
          const prefix0.JsonProperty(
              name: 'hireDate',
              converterParams: const {'format': 'yyyy-MM-dd\'T\'HH:mm:ss\'Z\''})
        ]),
        r.VariableMirrorImpl(
            r'salary',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'salary')]),
        r.VariableMirrorImpl(
            r'commissionPct',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'commissionPct')]),
        r.VariableMirrorImpl(
            r'language',
            33797,
            1,
            const prefix0.JsonSerializable(),
            2,
            2,
            2,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'language')]),
        r.VariableMirrorImpl(
            r'isRight',
            33797,
            1,
            const prefix0.JsonSerializable(),
            -1,
            8,
            8,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'isRight')]),
        r.VariableMirrorImpl(
            r'index',
            33861,
            2,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'username',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'username')]),
        r.VariableMirrorImpl(
            r'password',
            32773,
            3,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'password')]),
        r.VariableMirrorImpl(
            r'idToken',
            32773,
            4,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: 'id_token')]),
        r.MethodMirrorImpl(
            r'toString',
            131074,
            0,
            -1,
            5,
            5,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'==',
            131074,
            0,
            -1,
            8,
            8,
            const <int>[],
            const <int>[0],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 0, 22),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 1, 23),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 2, 24),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 3, 25),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 4, 26),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 5, 27),
        r.MethodMirrorImpl(
            r'hashCode',
            131075,
            0,
            -1,
            6,
            6,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'',
            128,
            0,
            -1,
            0,
            0,
            const <int>[],
            const <int>[1, 2, 3, 4, 5, 6],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            65538,
            null,
            null,
            null,
            null,
            const <int>[],
            const <int>[7],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(
            r'runtimeType',
            131075,
            null,
            -1,
            9,
            9,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(
            r'toString',
            131074,
            1,
            -1,
            5,
            5,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'==',
            131074,
            1,
            -1,
            8,
            8,
            const <int>[],
            const <int>[8],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 6, 34),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 7, 35),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 8, 36),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 9, 37),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 10, 38),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 11, 39),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 12, 40),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 13, 41),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 14, 42),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 15, 43),
        r.MethodMirrorImpl(
            r'hashCode',
            131075,
            1,
            -1,
            6,
            6,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'',
            128,
            1,
            -1,
            1,
            1,
            const <int>[],
            const <int>[9, 10, 11, 12, 13, 14, 15, 16, 17, 18],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'toString', 131138, 2, -1, 5, 5, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 16, 47),
        r.MethodMirrorImpl(r'==', 131074, null, -1, 8, 8, const <int>[],
            const <int>[19], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 6, 6, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'toString',
            131074,
            3,
            -1,
            5,
            5,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'==',
            131074,
            3,
            -1,
            8,
            8,
            const <int>[],
            const <int>[20],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 17, 52),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 17, 53),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 18, 54),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 18, 55),
        r.MethodMirrorImpl(
            r'hashCode',
            131075,
            3,
            -1,
            6,
            6,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(r'', 0, 3, -1, 3, 3, const <int>[],
            const <int>[21, 22], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'toString',
            131074,
            4,
            -1,
            5,
            5,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'==',
            131074,
            4,
            -1,
            8,
            8,
            const <int>[],
            const <int>[25],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 19, 60),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 19, 61),
        r.MethodMirrorImpl(
            r'hashCode',
            131075,
            4,
            -1,
            6,
            6,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const <Object>[override]),
        r.MethodMirrorImpl(r'', 64, 4, -1, 4, 4, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'other',
            32774,
            21,
            const prefix0.JsonSerializable(),
            -1,
            10,
            10,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'login',
            32774,
            29,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'email',
            32774,
            29,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'password',
            32774,
            29,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'langKey',
            32774,
            29,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'firstName',
            32774,
            29,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'lastName',
            32774,
            29,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            32774,
            30,
            const prefix0.JsonSerializable(),
            -1,
            11,
            11,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            32774,
            33,
            const prefix0.JsonSerializable(),
            -1,
            10,
            10,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'id',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'firstName',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'lastName',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'email',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'phoneNumber',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'hireDate',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'salary',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'commissionPct',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'language',
            32774,
            45,
            const prefix0.JsonSerializable(),
            2,
            2,
            2,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'isRight',
            32774,
            45,
            const prefix0.JsonSerializable(),
            -1,
            8,
            8,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            32774,
            48,
            const prefix0.JsonSerializable(),
            -1,
            10,
            10,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            32774,
            51,
            const prefix0.JsonSerializable(),
            -1,
            10,
            10,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'username',
            32774,
            57,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'password',
            32774,
            57,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_username',
            32870,
            53,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_password',
            32870,
            55,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            32774,
            59,
            const prefix0.JsonSerializable(),
            -1,
            10,
            10,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_idToken',
            32870,
            61,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.User,
        prefix2.Employee,
        prefix2.Language,
        prefix3.UserJWT,
        prefix4.JWTToken,
        String,
        int,
        DateTime,
        bool,
        Type,
        Object,
        Invocation
      ],
      5,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'firstName': (dynamic instance) => instance.firstName,
        r'lastName': (dynamic instance) => instance.lastName,
        r'login': (dynamic instance) => instance.login,
        r'email': (dynamic instance) => instance.email,
        r'password': (dynamic instance) => instance.password,
        r'langKey': (dynamic instance) => instance.langKey,
        r'id': (dynamic instance) => instance.id,
        r'phoneNumber': (dynamic instance) => instance.phoneNumber,
        r'hireDate': (dynamic instance) => instance.hireDate,
        r'salary': (dynamic instance) => instance.salary,
        r'commissionPct': (dynamic instance) => instance.commissionPct,
        r'language': (dynamic instance) => instance.language,
        r'isRight': (dynamic instance) => instance.isRight,
        r'index': (dynamic instance) => instance.index,
        r'username': (dynamic instance) => instance.username,
        r'idToken': (dynamic instance) => instance.idToken
      },
      {
        r'username=': (dynamic instance, value) => instance.username = value,
        r'password=': (dynamic instance, value) => instance.password = value,
        r'idToken=': (dynamic instance, value) => instance.idToken = value
      },
      null,
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
