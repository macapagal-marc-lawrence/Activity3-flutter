import 'package:activity_3/homepage.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoApp(
    theme: CupertinoThemeData(brightness: Brightness.light),
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
    return username == "admin" && password == "123";
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Row(
              children: const [
                SizedBox(height: 15),
                Text(
                  'Resume Login',
                  style: TextStyle(
                      color: CupertinoColors.systemGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CupertinoTextField(
              controller: _username,
              placeholder: 'Username',
              padding: const EdgeInsets.all(12),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _password,
              placeholder: 'Password',
              padding: const EdgeInsets.all(10),
              obscureText: hidePassword,
              suffix: CupertinoButton(
                child: Icon(
                  hidePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  size: 20,
                  color: CupertinoColors.systemGreen,
                ),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: CupertinoColors.systemGreen,
              ),
              child: CupertinoButton(
                child: const Text(
                  'Login',
                  style: TextStyle(color: CupertinoColors.white),
                ),
                onPressed: () {
                  if (isLogin(_username.text, _password.text)) {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Homepage()));
                  } else {
                    setState(() {
                      _username.text = "";
                      _password.text = "";
                      error = "Incorrect Username or Password";
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(error, style: const TextStyle(color: CupertinoColors.destructiveRed)),
            CupertinoButton( // Added Forgot Password button
              onPressed: () {
                // Implement forgot password logic here
                print("Forgot Password tapped"); // Placeholder
              },
              child: const Text("Forgot Password", style: TextStyle(color: CupertinoColors.activeBlue)), // Style as needed
            ),
          ],
        ),
      ),
    );
  }
}