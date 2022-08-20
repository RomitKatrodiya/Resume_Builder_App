import 'package:flutter/material.dart';

import '../../globals.dart';
import '../backButton.dart';

class projects_page extends StatefulWidget {
  const projects_page({Key? key}) : super(key: key);

  @override
  State<projects_page> createState() => _projects_pageState();
}

class _projects_pageState extends State<projects_page> {
  Color MyColor = const Color(0xff0475FF);
  var MyTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0xff0475FF).withOpacity(0.8),
  );
  var myTextStyleForChackBox = const TextStyle(
    fontSize: 17,
    color: Colors.grey,
  );

  final GlobalKey<FormState> projectFormKey = GlobalKey<FormState>();

  final TextEditingController projectTitleController = TextEditingController();
  final TextEditingController rolesController = TextEditingController();
  final TextEditingController technologiesController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: MyColor,
        title: const Text("Projects"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: _width,
              alignment: const Alignment(0, 0.5),
              color: MyColor,
            ),
          ),
          Expanded(
            flex: 18,
            child: Container(
              color: const Color(0xffEDEDED),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          top: 30, bottom: 20, right: 20, left: 20),
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: projectFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Project Title", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Project Title First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectTitle = val;
                                });
                              },
                              controller: projectTitleController,
                              decoration: const InputDecoration(
                                hintText: "Resume Builder App",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Technologies", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            // Chake Box
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.projectCheckBoxCProgramming,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.projectCheckBoxCProgramming =
                                            val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                Text(
                                  "C Programming",
                                  style: myTextStyleForChackBox,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.projectCheckBoxCPP,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.projectCheckBoxCPP = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                Text(
                                  "C++",
                                  style: myTextStyleForChackBox,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.projectCheckBoxFlutter,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.projectCheckBoxFlutter = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                Text(
                                  "Flutter",
                                  style: myTextStyleForChackBox,
                                ),
                              ],
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Roles", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Roles First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectRoles = val;
                                });
                              },
                              maxLines: 2,
                              controller: rolesController,
                              decoration: const InputDecoration(
                                hintText:
                                    "Organize team members, Code\nanalysis",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Technologies", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Technologies First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectTechnologies = val;
                                });
                              },
                              controller: technologiesController,
                              decoration: const InputDecoration(
                                hintText: "5 - Programmer",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Project Description", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Project Description First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectDescription = val;
                                });
                              },
                              controller: projectDescriptionController,
                              decoration: const InputDecoration(
                                hintText: "Enter Your Project Description",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (projectFormKey.currentState!.validate()) {
                              projectFormKey.currentState!.save();

                              setState(() => Navigator.of(context).pop());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: MyColor,
                          ),
                          child: const Text("Save"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            projectFormKey.currentState!.reset();

                            projectTitleController.clear();
                            rolesController.clear();
                            technologiesController.clear();
                            projectDescriptionController.clear();
                            setState(() {
                              Global.projectTitle = null;
                              Global.projectRoles = null;
                              Global.projectTechnologies = null;
                              Global.projectDescription = null;
                              Global.projectCheckBoxCProgramming = false;
                              Global.projectCheckBoxCPP = false;
                              Global.projectCheckBoxFlutter = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: MyColor,
                          ),
                          child: const Text("Clear"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
