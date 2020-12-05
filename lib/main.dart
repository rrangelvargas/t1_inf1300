import 'package:flutter/material.dart';
import 'package:t1_inf1300/register.dart';
import 'package:t1_inf1300/forgotpassword.dart';
import 'package:t1_inf1300/home.dart';
import 'package:t1_inf1300/StyledRaisedButton.dart';
import 'package:t1_inf1300/StyledFlatButton.dart';
import 'package:t1_inf1300/StyledTextFormField.dart';
import 'package:t1_inf1300/controller/controller.dart';
import 'package:t1_inf1300/notification/notificationManager.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

NotificationManager n = new NotificationManager();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharma +',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto'),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String passwordLabelText = "";
  String enterLabelText = "";
  String forgotPasswordLabelText = "";
  String registerLabelText = "";
  String locale = "";

  final controller = Controller();

  @override
  void initState() {
    super.initState();
    // AndroidAlarmManager.oneShotAt(
    //     DateTime.now().add(Duration(seconds: 5)), 0, notificate,
    //     exact: true,
    //     allowWhileIdle: true,
    //     wakeup: true,
    //     rescheduleOnReboot: true,
    //     alarmClock: true);

    n.initializing();
  }

  @override
  Widget build(BuildContext context) {
    //locale = Platform.localeName.substring(0, 2);

    if (controller.locale.value == "pt") {
      this.passwordLabelText = "Senha";
      this.enterLabelText = "Entrar";
      this.forgotPasswordLabelText = "Esqueci a senha";
      this.registerLabelText = "Cadastre-se";
    } else if (controller.locale.value == "es") {
      this.passwordLabelText = "Contraseña";
      this.enterLabelText = "Iniciar Sesión";
      this.forgotPasswordLabelText = "Olvidé la Contraseña";
      this.registerLabelText = "Registrarse";
    } else {
      this.passwordLabelText = "Password";
      this.enterLabelText = "Enter";
      this.forgotPasswordLabelText = "Forgot my password";
      this.registerLabelText = "Register";
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
              labelText: this.passwordLabelText,
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: StyledRaisedButton(
                    title: this.enterLabelText, callback: _navigateToHome)),
            StyledFlatButton(
              title: this.forgotPasswordLabelText,
              callback: _navigateToForgotPassword,
              fontSize: 12,
            ),
            StyledFlatButton(
              title: this.registerLabelText,
              callback: notificate,
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

  void notificate() async {
    await n.notification();
  }
}
