 import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: SafeArea(child: Column(
           children: [
              Text("Homepage")
           ],
         )),
       ),
    );
  }
}
