import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoApp(
    theme: CupertinoThemeData(
      brightness: Brightness.dark
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
          placeholder: 'Username',
          padding: EdgeInsets.all(12),

        ),
        SizedBox(height: 5,),
        CupertinoTextField(
          placeholder: 'Password',
          padding: EdgeInsets.all(10),
          obscureText: hidePassword,
          suffix: CupertinoButton(child: Icon(hidePassword? CupertinoIcons.eye : CupertinoIcons.eye_slash, size: 20, color: CupertinoColors.systemGreen,), onPressed: (){
            setState(() {
              hidePassword = !hidePassword;
            });
          }),

        )
      ],
    )));
  }
}
