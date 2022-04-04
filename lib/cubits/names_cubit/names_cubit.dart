import 'package:bloc/bloc.dart';
import 'package:zapasibloc/screens/random_name.dart';

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
  
}
