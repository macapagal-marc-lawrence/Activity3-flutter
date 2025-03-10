import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'crispage.dart';
import 'kevinpage.dart';
import 'macpage.dart';
import 'charlespage.dart';
import 'jenzellepage.dart';
import 'johnericpage.dart';

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
                          "Welcome to our group resume application. Click on a member's to learn more!",
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
    List<String> names = ["Mac", "Kevin", "Charles", "Jenzelle", "Cris", "John Eric"];
    return names[index];
  }

  String _getImagePath(int index) {
    List<String> imagePaths = [
      "images/mac.jpg",
      "images/kevin.jpg",
      "images/charles.jpg",
      "images/jenzelle.jpg",
      "images/criss.jpg",
      "images/erics.jpg",

    ];
    return imagePaths[index];
  }

  Widget _buildTeamMemberWithImage(String name, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (name == "Cris") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CrisPage()), // Navigate to CrisPage
          );
        } else if (name == "Kevin"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KevinPage()),

          );
        } else if (name == "Mac") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MacPage()),
          );
        } else if (name == "Charles") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CharlesPage()),
          );

        } else if (name == "Jenzelle") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JenzellePage()),
          );

        } else if (name == "John Eric") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JohnericPage()),
          );

        } else {
          print("Tapped on $name"); // For now, just print the name
        }

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