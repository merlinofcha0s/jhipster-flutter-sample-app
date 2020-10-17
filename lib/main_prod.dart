import 'package:jhipsterfluttersample/environment.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;

void main() {
  initializeJsonMapper();
  Constants.setEnvironment(Environment.PROD);
  runApp(JhipsterfluttersampleApp());
}
