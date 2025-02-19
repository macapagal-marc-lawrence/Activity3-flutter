import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrisPage extends StatelessWidget {
  const CrisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Cris's Page"),
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
                  radius: 100,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    _buildText("Cris Gabriel I. Juanatas",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    _buildText("Frontend Developer"),
                    _buildText("+639684601144"),
                    _buildText("juanatascris1@gmail.com"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSection("Biography",
                  "A BSIT graduate specializing in front-end development and web design. Passionate about creating innovative and modern digital experiences.",
                  color: Colors.green.shade100,
                  icon: Icons.person),
              _buildSection("Skills", [
                "Web Designing",
                "Networking",
                "Programming: C++, HTML, PHP, CSS"
              ], color: Colors.green.shade100, icon: Icons.code),
              _buildSection("Education", [
                "BSIT - Holy Cross College (2022-2025)",
                "High School - Arayat Holy Child Educational Foundation Inc. (2020-2022)",
                "High School - Gatiawin High School (2016-2020)",
                "High School - Gatiawin Elementary School (2009-2015)"
              ], color: Colors.green.shade100, icon: Icons.school),
              _buildSection("Portfolio", [
                "Point of Sale System - PHP, MySQL, Bootstrap",
                "E-commerce Website - Full-stack implementation",
                "Inventory System - Built with Laravel"
              ], color: Colors.green.shade100, icon: Icons.work),
              _buildSection("References",
                  "Available upon request. Contact:\nJohn Doe - Lead Developer, XYZ Company\nJane Smith-CТО, АВС Corporation",
                  color: Colors.green.shade100,
                  icon: Icons.people),
              _buildSection("Languages", [
                "English - Beginner",
                "Tagalog - Intermediate",
                "Kapampangan - Basic"
              ], color: Colors.green.shade100, icon: Icons.language),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(text, style: style),
    );
  }

  Widget _buildSection(String title, dynamic content,
      {Color? color, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green.shade800),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (content is String)
              Text(content)
            else if (content is List<String>)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content.map((item) => Text("- $item")).toList(),
              )
          ],
        ),
      ),
    );
  }
}