import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrisPage extends StatefulWidget {
  const CrisPage({super.key});

  @override
  State<CrisPage> createState() => _CrisPageState();
}

class _CrisPageState extends State<CrisPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text ("Cris Page"),
        backgroundColor: Colors.green.shade600,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/criss.jpg'),
                ),
              )

            ],

          ),
        ),
      ),

    );
  }
}
