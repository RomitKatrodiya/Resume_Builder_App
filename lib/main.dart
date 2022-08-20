import 'package:flutter/material.dart';
import 'package:resume_builder_app/screens/build_options_page.dart';
import 'package:resume_builder_app/screens/options/achievement_page.dart';
import 'package:resume_builder_app/screens/options/carrier_objective_page.dart';
import 'package:resume_builder_app/screens/options/contact_info_page.dart';
import 'package:resume_builder_app/screens/options/declaration_page.dart';
import 'package:resume_builder_app/screens/options/education_page.dart';
import 'package:resume_builder_app/screens/options/experience_page.dart';
import 'package:resume_builder_app/screens/options/interest_hobbies_page.dart';
import 'package:resume_builder_app/screens/options/personal_details_page.dart';
import 'package:resume_builder_app/screens/options/projects_page.dart';
import 'package:resume_builder_app/screens/options/reference_page.dart';
import 'package:resume_builder_app/screens/options/technical_skills_page.dart';
import 'package:resume_builder_app/screens/pdf_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "build_option_page": (context) => const Build_Options_Page(),
        "contact_info_page": (context) => const contact_info_page(),
        "carrier_objective_page": (context) => const carrier_objective_page(),
        "personal_details_page": (context) => const personal_details_page(),
        "education_page": (context) => const education_page(),
        "experience_page": (context) => const experience_page(),
        "technical_skills_page": (context) => const technical_skills_page(),
        "interest_hobbies_page": (context) => const interest_hobbies_page(),
        "projects_page": (context) => const projects_page(),
        "achievement_page": (context) => const achievement_page(),
        "reference_page": (context) => const reference_page(),
        "declaration_page": (context) => const declaration_page(),
        "pdf_page": (context) => PDF_Page(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color MyColor = const Color(0xff0475FF);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor,
        title: const Text("Resume Builder"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("build_option_page");
        },
        backgroundColor: MyColor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: _width,
              alignment: const Alignment(0, 0.5),
              color: MyColor,
              child: const Text(
                "RESUME",
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: Column(
              children: [
                SizedBox(height: _height * 0.07),
                Image.asset(
                  height: _height * 0.07,
                  "assets/icons/open-cardboard-box.png",
                ),
                SizedBox(height: _height * 0.03),
                const Text(
                  "No Resumes + Create new Resume",
                  style: TextStyle(fontSize: 21, color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
