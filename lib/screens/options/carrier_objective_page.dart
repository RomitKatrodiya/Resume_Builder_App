import 'package:flutter/material.dart';

import '../../globals.dart';
import '../backButton.dart';

class carrier_objective_page extends StatefulWidget {
  const carrier_objective_page({Key? key}) : super(key: key);

  @override
  State<carrier_objective_page> createState() => _carrier_objective_pageState();
}

class _carrier_objective_pageState extends State<carrier_objective_page> {
  Color MyColor = const Color(0xff0475FF);
  final GlobalKey<FormState> careerObjectiveFormKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController experiencedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: MyColor,
        title: const Text("Carrier Objective"),
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
                    Form(
                      key: careerObjectiveFormKey,
                      child: Column(
                        children: [
                          // Career Objective
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(20),
                            height: _height * 0.35,
                            width: _width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Career Objective",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: MyColor.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your Description First...";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      setState(() {
                                        Global.careerObjectiveDescription = val;
                                      });
                                    },
                                    maxLines: 10,
                                    controller: descriptionController,
                                    decoration: const InputDecoration(
                                      hintText: "Description",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Current Designation (Experience Candidate)
                          Container(
                            color: Colors.white,
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(20),
                            height: _height * 0.2,
                            width: _width,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Current Designation (Experience\nCandidate)",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: MyColor.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your Designation First...";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      setState(() {
                                        Global.careerObjectiveExperienced = val;
                                      });
                                    },
                                    controller: experiencedController,
                                    decoration: const InputDecoration(
                                      hintText: "Software Engineer",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (careerObjectiveFormKey.currentState!
                                .validate()) {
                              careerObjectiveFormKey.currentState!.save();
                              Navigator.of(context).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: MyColor,
                          ),
                          child: const Text("Save"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            careerObjectiveFormKey.currentState!.reset();

                            descriptionController.clear();
                            experiencedController.clear();
                            setState(() {
                              Global.careerObjectiveDescription = null;
                              Global.careerObjectiveExperienced = null;
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
