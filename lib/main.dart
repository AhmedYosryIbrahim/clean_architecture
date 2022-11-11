import 'package:clean_architecture/app.dart';
import 'package:flutter/material.dart';
import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const QutesApp());
}
