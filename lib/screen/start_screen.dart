import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket_app/bloc/changeLanguage/language_bloc.dart';
import 'package:movie_ticket_app/bloc/changeLanguage/language_event.dart';
import 'package:movie_ticket_app/utils/app_colors.dart';
import 'package:movie_ticket_app/widget/button1.dart';
import 'package:movie_ticket_app/widget/button_language.dart';
import 'package:movie_ticket_app/widget/button2.dart';
import 'package:movie_ticket_app/widget/movie_intro.dart';

class SignInUpPage extends StatefulWidget {
  const SignInUpPage({super.key});

  @override
  State<SignInUpPage> createState() => _SignInUpPageState();
}

class _SignInUpPageState extends State<SignInUpPage> {
  String selectedLanguage = 'English';
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor: Colors.black,
      builder: (BuildContext modalContext) {
        return StatefulBuilder(
          builder: (BuildContext statefulContext, StateSetter setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                  bottom: MediaQuery.of(modalContext).viewInsets.bottom + 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Choose language',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Which language do you want to use?',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 24),
                    Divider(color: Colors.white24),

                    // English option
                    ListTile(
                      title: Text(
                        'English',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedLanguage == 'English'
                              ? Colors.amber
                              : Colors.white,
                        ),
                      ),
                      trailing: Radio(
                        value: 'English',
                        groupValue: selectedLanguage,
                        activeColor: Colors.amber,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value.toString();
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'English';
                        });
                      },
                    ),
                    Divider(color: Colors.white24),

                    // Vietnamese option
                    ListTile(
                      title: Text(
                        'Vietnamese',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedLanguage == 'Vietnamese'
                              ? Colors.amber
                              : Colors.white,
                        ),
                      ),
                      trailing: Radio(
                        value: 'Vietnamese',
                        groupValue: selectedLanguage,
                        activeColor: Colors.amber,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value.toString();
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          selectedLanguage = 'Vietnamese';
                        });
                      },
                    ),
                    SizedBox(height: 30),

                    // Confirm button
                    Button2(
                      content: selectedLanguage,
                      width: MediaQuery.of(modalContext).size.width,
                      height: 56,
                      onTap: () {
                        final currentLocale = context
                            .read<LanguageBloc>()
                            .state
                            .locale;
                        if (currentLocale.languageCode == 'en') {
                          context.read<LanguageBloc>().add(
                            ChangeLanguageEvent(const Locale('vi')),
                          );
                        } else {
                          context.read<LanguageBloc>().add(
                            ChangeLanguageEvent(const Locale('en')),
                          );
                        }
                        Navigator.of(modalContext).pop();

                        // Nếu bạn muốn lưu ngôn ngữ đã chọn, có thể callback về widget cha
                        // onLanguageSelected?.call(selectedLanguage);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo.png'),
                  ButtonLanguage(
                    onTap: () {
                      showLanguageBottomSheet(context);
                    },
                    content: selectedLanguage,
                  ),
                ],
              ),
              SizedBox(height: 80),
              MovieIntroWidget(),
              SizedBox(height: 50),
              Button2(
                content: "Sign Up",
                width: MediaQuery.of(context).size.width,
                height: 56,
                onTap: () {},
              ),
              SizedBox(height: 20),
              Button1(
                content: "Sign In",
                width: MediaQuery.of(context).size.width,
                height: 56,
                onTap: () {},
              ),
              SizedBox(height: 50),
              Text(
                "By sign in or sign up, you agree to our Terms of Service\nand Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.note, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
