import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'features/data/datasources/cubit/counter_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: CounterObserver(),
  );
}
