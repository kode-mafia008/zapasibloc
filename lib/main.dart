import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zapasibloc/features/data/datasources/cubit/counter_cubit.dart';
import 'app.dart';
import 'features/data/datasources/post_bloc/post_bloc_bloc.dart';
import 'features/data/datasources/ticker/ticker.dart';
import 'features/data/datasources/timer_bloc/timer_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CounterCubit(),
      ),
      BlocProvider(
        create: (context) => TimerBloc(ticker: const Ticker()),
        child: Container(),
      ),
      BlocProvider(
        create: (context) =>
            PostBlocBloc(httpClient: http.Client())..add(PostFetched()),
        child: Container(),
      )
    ],
    child: const MyApp(),
  ));
}
