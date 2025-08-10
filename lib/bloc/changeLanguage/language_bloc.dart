import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(locale: Locale('en'))) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(LanguageState(locale: event.locale));
    });
  }
}
