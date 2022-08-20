import 'package:flutter/material.dart';

import '../../globals.dart';
import '../backButton.dart';

class reference_page extends StatefulWidget {
  const reference_page({Key? key}) : super(key: key);

  @override
  State<reference_page> createState() => _reference_pageState();
}

class _reference_pageState extends State<reference_page> {
  Color MyColor = const Color(0xff0475FF);
  var MyTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0xff0475FF).withOpacity(0.8),
  );

  final GlobalKey<FormState> referenceFormKey = GlobalKey<FormState>();

  final TextEditingController referenceNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: MyColor,
        title: const Text("Reference"),
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
                        key: referenceFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reference Name", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Reference Name First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.referenceName = val;
                                });
                              },
                              controller: referenceNameController,
                              decoration: const InputDecoration(
                                hintText: "New Enterprise, San Francisco",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Designation", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Designation First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.referenceDesignation = val;
                                });
                              },
                              controller: designationController,
                              decoration: const InputDecoration(
                                hintText: "Marketing Manager, ID-342332",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Organization/Institute", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Organization/Institute First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.referenceOrganization = val;
                                });
                              },
                              controller: organizationController,
                              decoration: const InputDecoration(
                                hintText: "Green Energy Pvt.Ltd",
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
                            if (referenceFormKey.currentState!.validate()) {
                              referenceFormKey.currentState!.save();

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
                            referenceFormKey.currentState!.reset();

                            referenceNameController.clear();
                            designationController.clear();
                            organizationController.clear();
                            setState(() {
                              Global.referenceName = null;
                              Global.referenceDesignation = null;
                              Global.referenceOrganization = null;
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
