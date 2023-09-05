import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'models/hotel.dart';
import 'services/api.dart';
import 'ui/app.dart';

Hotel? hotel;
final logger = Logger();
final dio = Dio();
final client = Api(dio);
void main() {
  runApp(const MyApp());
}
