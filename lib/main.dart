import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:turismosangolqui/src/pages/login_page.dart';
import 'package:turismosangolqui/src/pages/main_page.dart';
import 'package:turismosangolqui/src/pages/signup_page.dart';
import 'package:turismosangolqui/src/providers/app_provider.dart';
import 'package:turismosangolqui/src/providers/favorite_elements_provider.dart';
import 'package:turismosangolqui/src/utils/user_shared_preferences.dart';
import 'package:turismosangolqui/src/providers/login_provider.dart';
import 'package:turismosangolqui/src/pages/settings_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preferences().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FavoriteElementProvider>(
        create: (_) => FavoriteElementProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefs = new Preferences();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    appProvider.init(prefs.token, prefs.mode);
    return LoginProvider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Turismo Sangolquí',
            home: appProvider.token == ""
                ? const LoginPage()
                : JwtDecoder.isExpired(appProvider.token)
                    ? const LoginPage()
                    : const MainPage(titulo: "Turismo Sangolquí"),
            routes: {
              "/login": (context) => const LoginPage(),
              "/singUp": (context) => const SingUpPage(),
              "/settings": (context) => const SettingsPage(),
            },
            theme: ThemeData(
                brightness: appProvider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primaryColor: Colors.lime.shade500,
                accentColor: Colors.green.shade500, 
                primarySwatch: Colors.lime),
                ));
  }
}

