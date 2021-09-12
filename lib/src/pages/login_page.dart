import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismosangolqui/src/providers/app_provider.dart';
import 'package:turismosangolqui/src/providers/login_provider.dart';
import 'package:turismosangolqui/src/services/user_service.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundWidget(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(child: Container(height: 180.0)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: size.width * .80,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                blurRadius: 2.0,
                                offset: Offset(0.0, 1.0),
                                spreadRadius: 2.0)
                          ]),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text('Inicio de sesión',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        SizedBox(height: 25.0),
                        EmailTextControl(),
                        SizedBox(height: 25.0),
                        PasswordTextControl(),
                        SizedBox(height: 25.0),
                        SubmitButtonControl(),
                        SizedBox(height: 25.0),


                       ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/singUp");
                      },
                      child: Text("Registrarse"))
                      ])
                      
                      ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmailTextControl extends StatelessWidget {
  const EmailTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.email,
                    color: Theme.of(context).primaryColorDark),
                hintText: 'usuario@turismo.com',
                labelText: 'Correo electrónico',
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeEmail);
      },
    );
  }
}

class PasswordTextControl extends StatelessWidget {
  const PasswordTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline,
                  color: Theme.of(context).primaryColorDark),
              labelText: 'Contraseña',
              errorText: snapshot.error?.toString()),
        );
      },
    );
  }
}

class SubmitButtonControl extends StatelessWidget {
  const SubmitButtonControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    UserService userService = new UserService();
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Ingresar'),
            ),
            onPressed: snapshot.hasData
                ? () async {
                    Map info =
                        await userService.login(bloc.email, bloc.password);

                    if (info['ok']) {
                      appProvider.token = info['token'];
                    } else {
                      print(info['message']);
                    }
                  }
                : null);
      },
    );
  }
}
