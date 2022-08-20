import 'package:flutter/material.dart';

import '../../globals.dart';
import '../backButton.dart';

class experience_page extends StatefulWidget {
  const experience_page({Key? key}) : super(key: key);

  @override
  State<experience_page> createState() => _experience_pageState();
}

class _experience_pageState extends State<experience_page> {
  Color MyColor = const Color(0xff0475FF);
  var MyTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0xff0475FF).withOpacity(0.8),
  );

  final GlobalKey<FormState> experienceFormKey = GlobalKey<FormState>();

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController experienceCollageController =
      TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController joinDateController = TextEditingController();
  final TextEditingController exitDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: MyColor,
        title: const Text("Experience"),
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
                        key: experienceFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Company Name", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Company Name First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.experienceCompanyName = val;
                                });
                              },
                              controller: companyNameController,
                              decoration: const InputDecoration(
                                hintText: "New Enterprise, San Francisco",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("School/Collage/Institute",
                                style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your School/Collage/Institute First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.experienceCollage = val;
                                });
                              },
                              controller: experienceCollageController,
                              decoration: const InputDecoration(
                                hintText: "Quality Test Engineer",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Roles (optional)", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              onSaved: (val) {
                                setState(() {
                                  Global.experienceRole = val;
                                });
                              },
                              maxLines: 3,
                              controller: roleController,
                              decoration: const InputDecoration(
                                hintText:
                                    "Working With team member to\ncome Up With new concepts and\nproducts analysis...",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            const Text(
                              "Employed Status",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            // Employed Status Radio Button
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: "Previously Employed",
                                        groupValue:
                                            Global.experienceEmployedStatus,
                                        onChanged: (val) {
                                          setState(() {
                                            Global.experienceEmployedStatus =
                                                val.toString();
                                          });
                                        },
                                      ),
                                      const Text(
                                        "Previously Employed",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "Currently Employed",
                                        groupValue:
                                            Global.experienceEmployedStatus,
                                        onChanged: (val) {
                                          setState(() {
                                            Global.experienceEmployedStatus =
                                                val.toString();
                                          });
                                        },
                                      ),
                                      const Text(
                                        "Currently Employed",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(color: Colors.grey, height: 1),
                            //Join Date Exit Date
                            SizedBox(height: _height * 0.015),
                            Row(
                              children: [
                                // join Date
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Date Joined",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: _height * 0.01),
                                      TextFormField(
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Enter your Join Date First...";
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          setState(() {
                                            Global.experienceJoinDate = val;
                                          });
                                        },
                                        keyboardType: TextInputType.datetime,
                                        controller: joinDateController,
                                        decoration: const InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: _width * 0.05),
                                // Exit Date
                                Expanded(
                                  child: (Global.experienceEmployedStatus ==
                                          "Previously Employed")
                                      ? Column(
                                          children: [
                                            const Text(
                                              "Exit Joined",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: _height * 0.01),
                                            TextFormField(
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return "Enter your Exit Date First...";
                                                }
                                                return null;
                                              },
                                              onSaved: (val) {
                                                setState(() {
                                                  Global.experienceExitDate =
                                                      val;
                                                });
                                              },
                                              keyboardType:
                                                  TextInputType.datetime,
                                              controller: exitDateController,
                                              decoration: const InputDecoration(
                                                hintText: "DD/MM/YYYY",
                                                alignLabelWithHint: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    //Save And Clear Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (experienceFormKey.currentState!.validate()) {
                              experienceFormKey.currentState!.save();

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
                            experienceFormKey.currentState!.reset();

                            companyNameController.clear();
                            experienceCollageController.clear();
                            roleController.clear();
                            setState(() {
                              Global.experienceCompanyName = null;
                              Global.experienceCollage = null;
                              Global.experienceRole = null;
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
