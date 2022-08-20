import 'package:flutter/material.dart';

import '../globals.dart';
import 'backButton.dart';

class Build_Options_Page extends StatefulWidget {
  const Build_Options_Page({Key? key}) : super(key: key);

  @override
  State<Build_Options_Page> createState() => _Build_Options_PageState();
}

class _Build_Options_PageState extends State<Build_Options_Page> {
  List<Map> options = [
    {
      "id": 1,
      "option_name": "Contact info",
      "image": "assets/icons/contact_detail-removebg-preview (1).png",
      "routes": "contact_info_page",
    },
    {
      "id": 2,
      "option_name": "Carrier Objective",
      "image": "assets/icons/briefcase.png",
      "routes": "carrier_objective_page",
    },
    {
      "id": 3,
      "option_name": "Personal Details",
      "image": "assets/icons/account.png",
      "routes": "personal_details_page",
    },
    {
      "id": 4,
      "option_name": "Educations",
      "image": "assets/icons/graduation-cap.png",
      "routes": "education_page",
    },
    {
      "id": 5,
      "option_name": "Experience",
      "image": "assets/icons/logical-thinking.png",
      "routes": "experience_page",
    },
    {
      "id": 6,
      "option_name": "Technical Skills",
      "image": "assets/icons/certificate.png",
      "routes": "technical_skills_page",
    },
    {
      "id": 7,
      "option_name": "Interest/Hobbies",
      "image": "assets/icons/open-book.png",
      "routes": "interest_hobbies_page",
    },
    {
      "id": 8,
      "option_name": "Projects",
      "image": "assets/icons/project-management.png",
      "routes": "projects_page",
    },
    {
      "id": 9,
      "option_name": "Achievements",
      "image": "assets/icons/experience.png",
      "routes": "achievement_page",
    },
    {
      "id": 10,
      "option_name": "References",
      "image": "assets/icons/handshake.png",
      "routes": "reference_page",
    },
    {
      "id": 11,
      "option_name": "Declarations",
      "image": "assets/icons/declaration.png",
      "routes": "declaration_page",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Color MyColor = const Color(0xff0475FF);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: MyColor,
        title: const Text("Resume Workspace"),
        centerTitle: true,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              if (Global.image != null) {
                Navigator.of(context).pushNamed("pdf_page");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Select image First...")));
                Navigator.of(context).pushNamed("contact_info_page");
              }
            },
            child: const SizedBox(
              width: 60,
              child: Icon(Icons.picture_as_pdf),
            ),
          )
        ],
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
                "Build Options",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...options.map((option) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(option["routes"]);
                          },
                          child: Row(
                            children: [
                              SizedBox(width: _width * 0.04),
                              Image.asset(
                                option["image"],
                                height: _height * 0.0495,
                              ),
                              SizedBox(width: _width * 0.06),
                              Text(
                                option["option_name"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_sharp),
                              SizedBox(width: _width * 0.05),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
