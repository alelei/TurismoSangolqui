import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/bloc/login_bloc.dart';
export 'package:turismosangolqui/src/bloc/login_bloc.dart';
import 'package:turismosangolqui/src/bloc/signup_bloc.dart';
export 'package:turismosangolqui/src/bloc/signup_bloc.dart';
class LoginProvider extends InheritedWidget {
  LoginProvider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final loginBloc = LoginBloc();
  final signUpBloc = SignUpBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginProvider>()!
        .loginBloc;
  }

  static SignUpBloc ofSing(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginProvider>()!
        .signUpBloc;
  }
}
