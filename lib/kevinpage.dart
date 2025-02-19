import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KevinPage extends StatelessWidget {
  const KevinPage({super.key});

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
                  backgroundImage: AssetImage('images/kevin.jpg'),
                  radius: 100,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    _buildText("Kevin  V. Dizon",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    _buildText("Frontend Developer"),
                    _buildText("09674512396"),
                    _buildText("dizonvkn@gmail.com"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSection("Biography",
                  "I am a passionate Frontend Developer with experience in building dynamic websites and applications. I have a keen interest in optimizing system performance and creating scalable solutions.",
                  color: Colors.green.shade100,
                  icon: Icons.person),
              _buildSection("Skills", [
                "Web Designing",
                "Networking",
                "Programming: C++, HTML, PHP, CSS"
              ], color: Colors.green.shade100, icon: Icons.code),
              _buildSection("Education", [
                "Bachelor of Science in Information Technology - Holy Cross College (2021-2022)",
                "Justino Sevilla SchoolMangga Cacutud (2016-2020)",
                "High School - Gatiawin High School (2016-2020)",
                "Bitas Elementary SchoolSan Roque Bitas (2010-2016)"
              ], color: Colors.green.shade100, icon: Icons.school),
              _buildSection("Portfolio", [
                "Point of Sale (POS)",
                "E-commerce Website",
                "Inventory Management System"
              ], color: Colors.green.shade100, icon: Icons.work),
              _buildSection("References",
                  "Available upon request. Contact:\nJohn Doe - Lead Developer, XYZ Company\nJane Smith-CТО, АВС Corporation",
                  color: Colors.green.shade100,
                  icon: Icons.people),
              _buildSection("Languages", [
                "English",
                "Tagalog",
                "Kapampangan"
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