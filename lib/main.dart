import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:t1_inf1300/register.dart';
import 'package:t1_inf1300/forgotpassword.dart';
import 'package:t1_inf1300/home.dart';
import 'package:t1_inf1300/style/StyledRaisedButton.dart';
import 'package:t1_inf1300/style/StyledFlatButton.dart';
import 'package:t1_inf1300/style/StyledTextFormField.dart';
import 'package:t1_inf1300/controller/controller.dart';
import 'package:t1_inf1300/notification/notificationManager.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:t1_inf1300/utils/initialize_i18n.dart' show initializeI18n;
import 'package:t1_inf1300/utils/constant.dart' show languages;
import 'package:t1_inf1300/utils/localizations.dart'
    show MyLocalizations, MyLocalizationsDelegate;

NotificationManager n = new NotificationManager();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(MyApp(localizedValues));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> localizedValues;
  MyApp(this.localizedValues);
  // This widget is the root of your application.

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final controller = Controller();

  onChangeLanguage() {
    String _locale = Platform.localeName.substring(0, 2);
    if (_locale == "en") {
      controller.locale = "en";
    } else if (_locale == "pt") {
      controller.locale = "pt";
    } else {
      controller.locale = "es";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
        )
      ],
      child: MaterialApp(
        title: 'Pharma +',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Roboto'),
        locale: Locale(controller.locale),
        localizationsDelegates: [
          MyLocalizationsDelegate(widget.localizedValues),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: languages.map((language) => Locale(language, '')),
        home:
            MyHomePage(title: "Login", onChangeLanguage: this.onChangeLanguage),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final VoidCallback onChangeLanguage;
  MyHomePage({this.title, this.onChangeLanguage});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  int _batteryLevel = 100;
  bool batteryNotification = false;

  Future<void> _getBatteryLevel() async {
    int batteryLevel;
    try {
      batteryLevel = await platform.invokeMethod('getBatteryLevel');
    } on PlatformException {
      batteryLevel = 100;
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    n.initializing();
  }

  @override
  Widget build(BuildContext context) {
    this._getBatteryLevel();

    if (this._batteryLevel < 15 && !batteryNotification) {
      n.notification(MyLocalizations.of(context).translate("lowBattery"),
          MyLocalizations.of(context).translate("lowBatteryHelp"));
      setState(() {
        batteryNotification = true;
      });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledTextFormField(
              labelText: 'Email',
              maxLines: 1,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
            ),
            StyledTextFormField(
              labelText: MyLocalizations.of(context).translate("password"),
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: StyledRaisedButton(
                    title: MyLocalizations.of(context).translate("enter"),
                    callback: _navigateToHome)),
            StyledFlatButton(
              title: MyLocalizations.of(context).translate("forgotPassword"),
              callback: _navigateToForgotPassword,
              fontSize: 12,
            ),
            StyledFlatButton(
              title: MyLocalizations.of(context).translate("registerButton"),
              callback: _navigateToRegister,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => new HomePage()),
        (Route<dynamic> route) => false);
  }

  void _navigateToRegister() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => new Register()));
  }

  void _navigateToForgotPassword() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => new ForgotPassword()));
  }
}
