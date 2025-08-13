import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_ticket_app/bloc/changeLanguage/language_bloc.dart';
import 'package:movie_ticket_app/bloc/changeLanguage/language_state.dart';
import 'package:movie_ticket_app/screen/chose_seet.dart';
import 'package:movie_ticket_app/screen/home_screen.dart';
import 'package:movie_ticket_app/screen/movie_detail_screen.dart';
import 'package:movie_ticket_app/screen/signup/signup_otp.dart';
import 'package:movie_ticket_app/screen/signup/signup_screen.dart';
import 'package:movie_ticket_app/screen/signup/signup_setname.dart';
import 'package:movie_ticket_app/screen/start_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
        // Bloc khác ở đây...
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          locale: state.locale,
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('vi', ''), // Vietnamese
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: HomePage(),
        );
      },
    );
  }
}
