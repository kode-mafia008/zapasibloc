import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

import 'package:zapasibloc/cubits/names_cubit/names_cubit.dart';

const names = [
  'Foo',
  'Bar',
  'Baz',
];

// Gives a random element from an iterable
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class RandomNamesScreen extends StatefulWidget {
  const RandomNamesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RandomNamesScreen> createState() => _RandomNamesScreenState();
}

class _RandomNamesScreenState extends State<RandomNamesScreen> {
  late final NamesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = NamesCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Name Screen'),
      ),
      body: StreamBuilder<String?>(
        stream: cubit.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final button = TextButton(
              onPressed: () => cubit.pickRandomName(),
              child: const Text('Pick a Random Name'));
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                  Text(snapshot.data ?? ''),
                  button,
                ],
              );
            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }
}
