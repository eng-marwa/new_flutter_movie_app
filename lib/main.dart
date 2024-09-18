import 'package:flutter/material.dart';
import 'package:s1e_flutter_movie_app/movie_app.dart';

import 'core/di/module.dart';

void main() {
  setupDependencies();
  runApp(const MovieApp());
}
