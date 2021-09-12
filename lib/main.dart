import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  await Preferences().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FavoriteElementProvider>(
        create: (_) => FavoriteElementProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final textController = TextEditingController();

  final prefs = new Preferences();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      print('An initial message event was published!');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('A new onMessage event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: 'ortopedica',
              ),
            ));
      }

      print(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message);
    });
  }

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
          brightness:
              appProvider.darkMode == true ? Brightness.dark : Brightness.light,
          primaryColor: Colors.lime.shade500,
          accentColor: Colors.green.shade500,
          primarySwatch: Colors.lime),
    ));
  }
}
