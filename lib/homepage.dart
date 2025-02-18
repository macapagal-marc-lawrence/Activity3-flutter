import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Our Team'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center( // Center the welcome text
                        child: const Text(
                          "Welcome to our group resume website. Click on a member's to learn more!",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center, // Important for multi-line text
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildGridView(context),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250.0,
        childAspectRatio: 1.2,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return _buildTeamMemberWithImage(
            _getName(index), _getImagePath(index));
      },
    );
  }

  String _getName(int index) {
    List<String> names = ["Mac"];
    return names[index];
  }

  String _getImagePath(int index) {
    List<String> imagePaths = [
      "images/mac.jpg",

    ];
    return imagePaths[index];
  }

  Widget _buildTeamMemberWithImage(String name, String imagePath) {
    return GestureDetector(
      onTap: () {
        print("Tapped on $name");
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}