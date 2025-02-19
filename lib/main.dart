import 'package:activity_3/homepage.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoApp(
    theme: CupertinoThemeData(
      brightness: Brightness.light
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool hidePassword = true;
  String error = "";

  bool isLogin(String username, String password) {
    if (username == "admin" && password == "123") {
      return true;
    } else {
      return false;

    }
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: SafeArea(child: Column(
      children: [
        SizedBox(height: 100,),
        Row(
          children: [
            SizedBox(height: 15,),
            Text('Resume Login', style: TextStyle(color: CupertinoColors.systemGreen, fontWeight:FontWeight.bold, fontSize: 25),),
          ],
        ),
        SizedBox(height: 20,),
        CupertinoTextField(
          controller: _username,
          placeholder: 'Username',
          padding: EdgeInsets.all(12),

        ),
        SizedBox(height: 5,),
        CupertinoTextField(
          controller: _password,
          placeholder: 'Password',
          padding: EdgeInsets.all(10),
          obscureText: hidePassword,
          suffix: CupertinoButton(child: Icon(hidePassword? CupertinoIcons.eye : CupertinoIcons.eye_slash, size: 20, color: CupertinoColors.systemGreen,), onPressed: (){
            setState(() {
              hidePassword = !hidePassword;
            });
          }),

        ),
        SizedBox(height: 20,),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGreen
          ),
          child: CupertinoButton(child: Text('Login', style: TextStyle(color: CupertinoColors.white),), onPressed: (){
              isLogin(_username.text, _password.text) ?

              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) =>Homepage()))
            : setState(() {
                _username.text = "";
                _password.text = "";
                error = "Incorrect Username or Password";
              });;
          }),
        ),
        SizedBox(height: 10,),
        Text("$error", style: TextStyle(color: CupertinoColors.destructiveRed),)

      ],
    )));
  }
}
