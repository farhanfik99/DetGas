import 'dart:async';

import 'package:flutter/material.dart';
import 'package:detgas_1/src/blocs/application_bloc.dart';
import 'package:provider/provider.dart';
import 'package:detgas_1/services/services.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:detgas_1/screens/nav.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/palette.dart';
import 'localizations.dart';
import 'package:detgas_1/constants/constants.dart';
import 'package:detgas_1/ui/auth/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  LanguageProvider().setInitialLocalLanguage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider(),
            ),
            ChangeNotifierProvider<LanguageProvider>(
              create: (context) => LanguageProvider(),
            ),
            ChangeNotifierProvider<AuthService>(
              create: (context) => AuthService(),
            ),
            ChangeNotifierProvider<ApplicationBloc>(
              create: (context) => ApplicationBloc(),
            ),
          ],
          child: StartLogin(),
        ),
      );
    });
  }

  //Splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/images/detgasicon.png',
              height: 100,
              width: 100,
            ),
            Text("DetGas",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Oswald",
                )),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            )
          ],
        ),
      ),
    );
  }
}

class StartLogin extends StatelessWidget {
  const StartLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (_, languageProviderRef, __) {
        return Consumer<ThemeProvider>(
          builder: (_, themeProviderRef, __) {
            return AuthWidgetBuilder(
              builder:
                  (BuildContext context, AsyncSnapshot<User> userSnapshot) {
                return MaterialApp(
                  locale: languageProviderRef.getLocale, // <- Current locale
                  localizationsDelegates: [
                    const AppLocalizationsDelegate(), // <- Your custom delegate
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.languages.keys
                      .toList(), // <- Supported locales
                  //end language translation stuff
                  navigatorObservers: [
                    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
                  ],
                  debugShowCheckedModeBanner: false,
                  //title: labels.app.title,
                  routes: Routes.routes,
                  theme: AppThemes.lightTheme,
                  home: (userSnapshot?.data?.uid != null) ? Nav() : SignInUI(),
                );
              },
            );
          },
        );
      },
    );
  }
}
