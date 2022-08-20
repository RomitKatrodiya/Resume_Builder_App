import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:resume_builder_app/globals.dart';
import 'package:resume_builder_app/screens/backButton.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDF_Page extends StatefulWidget {
  PDF_Page({Key? key}) : super(key: key);

  @override
  State<PDF_Page> createState() => _PDF_PageState();
}

class _PDF_PageState extends State<PDF_Page> {
  final pdf = pw.Document();

  Color MyColor = const Color(0xff0475FF);

  final image = pw.MemoryImage(
    File(Global.image!.path).readAsBytesSync(),
  );

  final image2 = MemoryImage(
    File(Global.image!.path).readAsBytesSync(),
  );

  var titleStyle = const TextStyle(color: Colors.white, fontSize: 14);
  var titleStyle2 = TextStyle(
      color: Colors.blue.shade900, fontSize: 14, fontWeight: FontWeight.w600);
  var detailStyle = const TextStyle(color: Colors.grey, fontSize: 12);
  var detailStyle2 = TextStyle(color: Colors.grey.shade700, fontSize: 12);

  var titleStylePW = const pw.TextStyle(color: PdfColors.white, fontSize: 14);
  var titleStyle2PW = pw.TextStyle(
      color: PdfColors.blue900, fontSize: 14, fontWeight: pw.FontWeight.bold);
  var detailStylePW = const pw.TextStyle(color: PdfColors.grey, fontSize: 12);
  var detailStyle2PW =
      const pw.TextStyle(color: PdfColors.grey700, fontSize: 12);
  @override
  void initState() {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Row(
            children: [
              pw.Expanded(
                flex: 6,
                child: pw.Container(
                  padding: const pw.EdgeInsets.only(left: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 10),
                      educationPW(),
                      pw.Spacer(),
                      technicalSkillsPW(),
                      pw.Spacer(),
                      achievementPW(),
                      pw.Spacer(),
                      carrierObjectivePW(),
                      pw.Spacer(),
                      projectsPW(),
                      pw.Spacer(),
                      experiencePW(),
                      pw.Spacer(),
                      referencePW(),
                      pw.SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              pw.Expanded(
                flex: 4,
                child: pw.Column(
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          pw.Container(
                            height: 130,
                            width: 130,
                            child: pw.ClipRRect(
                              horizontalRadius: 65,
                              verticalRadius: 65,
                              child: pw.Image(image, fit: pw.BoxFit.cover),
                            ),
                          ),
                          (Global.name != null)
                              ? pw.Text(
                                  "${Global.name}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                    fontSize: 17,
                                    color: PdfColors.blue900,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                )
                              : pw.Container(),
                        ],
                      ),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        width: double.infinity,
                        decoration: const pw.BoxDecoration(
                          color: PdfColors.blue900,
                          borderRadius: pw.BorderRadius.only(
                            topLeft: pw.Radius.circular(20),
                          ),
                        ),
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 10),
                            contactInFoPW(),
                            pw.Spacer(),
                            personalDetailsPW(),
                            pw.Spacer(),
                            interestHobbiesPW(),
                            pw.Spacer(),
                            declarationPW(),
                            pw.SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: const Text("PDF"),
        centerTitle: true,
        backgroundColor: MyColor,
        actions: [
          InkWell(
            onTap: () async {
              Directory? dir = await getExternalStorageDirectory();

              File file = File("${dir!.path}/my.pdf");

              await file.writeAsBytes(await pdf.save());

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("PDF Save Successfully..."),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                      label: "Open",
                      onPressed: () async {
                        await OpenFile.open(file.path);
                      }),
                ),
              );
            },
            child: const SizedBox(
              width: 60,
              child: Icon(Icons.save_alt_outlined),
            ),
          ),
          InkWell(
            onTap: () async {
              Uint8List bytes = await pdf.save();

              await Printing.layoutPdf(onLayout: (format) => bytes);
            },
            child: const SizedBox(
              width: 60,
              child: Icon(Icons.print),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  education(),
                  const Spacer(),
                  technicalSkills(),
                  const Spacer(),
                  achievement(),
                  const Spacer(),
                  carrierObjective(),
                  const Spacer(),
                  projects(),
                  const Spacer(),
                  experience(),
                  const Spacer(),
                  reference(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundImage: image2,
                        radius: 55,
                      ),
                      (Global.name != null)
                          ? Text(
                              "${Global.name}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        contactInFo(),
                        const Spacer(),
                        personalDetails(),
                        const Spacer(),
                        interestHobbies(),
                        const Spacer(),
                        declaration(),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget contactInFo() {
    if (Global.email != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact info", style: titleStyle),
          const SizedBox(height: 3),
          Text(" - ${Global.phone}", style: detailStyle),
          Text(" - ${Global.email}", style: detailStyle),
          Text(" - ${Global.address1}", style: detailStyle),
          (Global.address2 != "")
              ? Text(" - ${Global.address2}", style: detailStyle)
              : Container(),
          (Global.address3 != "")
              ? Text(" - ${Global.address3}", style: detailStyle)
              : Container(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget personalDetails() {
    if (Global.dateOfBirth != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Personal Details", style: titleStyle),
          const SizedBox(height: 3),
          Text("DOB : ${Global.dateOfBirth}", style: detailStyle),
          (Global.maritalStatus != null)
              ? Text("Marital Status : ${Global.maritalStatus}",
                  style: detailStyle)
              : Container(),
          Text("Nationality : ${Global.nationality}", style: detailStyle),
          const SizedBox(height: 10),
          Text("Language :", style: titleStyle),
          const SizedBox(height: 3),
          (Global.englishCheckBox == true)
              ? Text(" - English", style: detailStyle)
              : Container(),
          (Global.hindiCheckBox == true)
              ? Text(" - Hindi", style: detailStyle)
              : Container(),
          (Global.gujratiCheckBox == true)
              ? Text(" - Gujarati", style: detailStyle)
              : Container(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget interestHobbies() {
    if (Global.interestHobbies.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Interest & Hobbies ", style: titleStyle),
          const SizedBox(height: 3),
          ...Global.interestHobbies.map(
            (e) => Text(" - $e", style: detailStyle),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget declaration() {
    if (Global.declarationDecscription != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Declaration", style: titleStyle),
          const SizedBox(height: 3),
          Text("${Global.declarationDecscription}", style: detailStyle),
          const SizedBox(height: 3),
          Text("Date : ${Global.declarationDate}", style: detailStyle),
          Text("Place : ${Global.declarationPlace}", style: detailStyle),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget education() {
    if (Global.course != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Education", style: titleStyle2),
          const SizedBox(height: 3),
          Text(" - ${Global.course}", style: detailStyle2),
          Text(" - ${Global.collage}", style: detailStyle2),
          Text(" - ${Global.marks}", style: detailStyle2),
          Text(" - ${Global.passYear}", style: detailStyle2),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget technicalSkills() {
    if (Global.technicalSkills.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Technical Skills", style: titleStyle2),
          const SizedBox(height: 3),
          ...Global.technicalSkills.map(
            (e) => Text(" - $e", style: detailStyle2),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget achievement() {
    if (Global.achievement.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Achievement", style: titleStyle2),
          const SizedBox(height: 3),
          ...Global.achievement.map(
            (e) => Text(" - $e", style: detailStyle2),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget carrierObjective() {
    if (Global.careerObjectiveDescription != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Carrier Objective", style: titleStyle2),
          const SizedBox(height: 3),
          Text(" - ${Global.careerObjectiveDescription}", style: detailStyle2),
          const SizedBox(height: 3),
          Text("Designation : ${Global.careerObjectiveExperienced}",
              style: detailStyle2),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget projects() {
    if (Global.projectTitle != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Projects", style: titleStyle2),
          const SizedBox(height: 3),
          Text("Title : ${Global.projectTitle}", style: detailStyle2),
          Text("Roles : ${Global.projectRoles}", style: detailStyle2),
          Text("Technologies : ${Global.projectTechnologies}",
              style: detailStyle2),
          Text("Description : ${Global.projectDescription}",
              style: detailStyle2),
          const SizedBox(height: 3),
          Text("Technologies :", style: detailStyle2),
          const SizedBox(height: 3),
          (Global.projectCheckBoxCProgramming == true)
              ? Text(" - C Programming", style: detailStyle2)
              : Container(),
          (Global.projectCheckBoxCPP == true)
              ? Text(" - C ++", style: detailStyle2)
              : Container(),
          (Global.projectCheckBoxFlutter == true)
              ? Text(" - Flutter", style: detailStyle2)
              : Container(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget experience() {
    if (Global.experienceCompanyName != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Experience", style: titleStyle2),
          const SizedBox(height: 3),
          Text("Company Name : ${Global.experienceCompanyName}",
              style: detailStyle2),
          Text("Designation : ${Global.experienceCollage}",
              style: detailStyle2),
          (Global.experienceRole != "")
              ? Text("Roles : ${Global.experienceRole}", style: detailStyle2)
              : Container(),
          (Global.experienceJoinDate != null)
              ? Text("Join Date : ${Global.experienceJoinDate}",
                  style: detailStyle2)
              : Container(),
          (Global.experienceExitDate != null)
              ? Text("Exit Date : ${Global.experienceExitDate}",
                  style: detailStyle2)
              : Container(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget reference() {
    if (Global.referenceName != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Reference", style: titleStyle2),
          const SizedBox(height: 3),
          Text("Reference Name : ${Global.referenceName}", style: detailStyle2),
          Text("Designation : ${Global.referenceDesignation}",
              style: detailStyle2),
          Text("Organization : ${Global.referenceOrganization}",
              style: detailStyle2),
        ],
      );
    } else {
      return Container();
    }
  }

  contactInFoPW() {
    if (Global.email != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Contact info", style: titleStylePW),
          pw.SizedBox(height: 3),
          pw.Text(" - ${Global.phone}", style: detailStylePW),
          pw.Text(" - ${Global.email}", style: detailStylePW),
          pw.Text(" - ${Global.address1}", style: detailStylePW),
          (Global.address2 != "")
              ? pw.Text(" - ${Global.address2}", style: detailStylePW)
              : pw.Container(),
          (Global.address3 != "")
              ? pw.Text(" - ${Global.address3}", style: detailStylePW)
              : pw.Container(),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  personalDetailsPW() {
    if (Global.dateOfBirth != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Personal Details", style: titleStylePW),
          pw.SizedBox(height: 3),
          pw.Text("DOB : ${Global.dateOfBirth}", style: detailStylePW),
          (Global.maritalStatus != null)
              ? pw.Text("Marital Status : ${Global.maritalStatus}",
                  style: detailStylePW)
              : pw.Container(),
          pw.Text("Nationality : ${Global.nationality}", style: detailStylePW),
          pw.SizedBox(height: 10),
          pw.Text("Language :", style: titleStylePW),
          pw.SizedBox(height: 3),
          (Global.englishCheckBox == true)
              ? pw.Text(" - English", style: detailStylePW)
              : pw.Container(),
          (Global.hindiCheckBox == true)
              ? pw.Text(" - Hindi", style: detailStylePW)
              : pw.Container(),
          (Global.gujratiCheckBox == true)
              ? pw.Text(" - Gujarati", style: detailStylePW)
              : pw.Container(),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  interestHobbiesPW() {
    if (Global.interestHobbies.isNotEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Interest & Hobbies ", style: titleStylePW),
          pw.SizedBox(height: 3),
          ...Global.interestHobbies.map(
            (e) => pw.Text(" - $e", style: detailStylePW),
          )
        ],
      );
    } else {
      return pw.Container();
    }
  }

  declarationPW() {
    if (Global.declarationDecscription != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Declaration", style: titleStylePW),
          pw.SizedBox(height: 3),
          pw.Text("${Global.declarationDecscription}", style: detailStylePW),
          pw.SizedBox(height: 3),
          pw.Text("Date : ${Global.declarationDate}", style: detailStylePW),
          pw.Text("Place : ${Global.declarationPlace}", style: detailStylePW),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  educationPW() {
    if (Global.course != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Education", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text(" - ${Global.course}", style: detailStyle2PW),
          pw.Text(" - ${Global.collage}", style: detailStyle2PW),
          pw.Text(" - ${Global.marks}", style: detailStyle2PW),
          pw.Text(" - ${Global.passYear}", style: detailStyle2PW),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  technicalSkillsPW() {
    if (Global.technicalSkills.isNotEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Technical Skills", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          ...Global.technicalSkills.map(
            (e) => pw.Text(" - $e", style: detailStyle2PW),
          )
        ],
      );
    } else {
      return pw.Container();
    }
  }

  achievementPW() {
    if (Global.achievement.isNotEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Achievement", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          ...Global.achievement.map(
            (e) => pw.Text(" - $e", style: detailStyle2PW),
          )
        ],
      );
    } else {
      return pw.Container();
    }
  }

  carrierObjectivePW() {
    if (Global.careerObjectiveDescription != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Carrier Objective", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text(" - ${Global.careerObjectiveDescription}",
              style: detailStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text("Designation : ${Global.careerObjectiveExperienced}",
              style: detailStyle2PW),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  projectsPW() {
    if (Global.projectTitle != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Projects", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text("Title : ${Global.projectTitle}", style: detailStyle2PW),
          pw.Text("Roles : ${Global.projectRoles}", style: detailStyle2PW),
          pw.Text("Technologies : ${Global.projectTechnologies}",
              style: detailStyle2PW),
          pw.Text("Description : ${Global.projectDescription}",
              style: detailStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text("Technologies :", style: detailStyle2PW),
          pw.SizedBox(height: 3),
          (Global.projectCheckBoxCProgramming == true)
              ? pw.Text(" - C Programming", style: detailStyle2PW)
              : pw.Container(),
          (Global.projectCheckBoxCPP == true)
              ? pw.Text(" - C ++", style: detailStyle2PW)
              : pw.Container(),
          (Global.projectCheckBoxFlutter == true)
              ? pw.Text(" - Flutter", style: detailStyle2PW)
              : pw.Container(),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  experiencePW() {
    if (Global.experienceCompanyName != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Experience", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text("Company Name : ${Global.experienceCompanyName}",
              style: detailStyle2PW),
          pw.Text("Designation : ${Global.experienceCollage}",
              style: detailStyle2PW),
          (Global.experienceRole != "")
              ? pw.Text("Roles : ${Global.experienceRole}",
                  style: detailStyle2PW)
              : pw.Container(),
          (Global.experienceJoinDate != null)
              ? pw.Text("Join Date : ${Global.experienceJoinDate}",
                  style: detailStyle2PW)
              : pw.Container(),
          (Global.experienceExitDate != null)
              ? pw.Text("Exit Date : ${Global.experienceExitDate}",
                  style: detailStyle2PW)
              : pw.Container(),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  referencePW() {
    if (Global.referenceName != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Reference", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text("Reference Name : ${Global.referenceName}",
              style: detailStyle2PW),
          pw.Text("Designation : ${Global.referenceDesignation}",
              style: detailStyle2PW),
          pw.Text("Organization : ${Global.referenceOrganization}",
              style: detailStyle2PW),
        ],
      );
    } else {
      return pw.Container();
    }
  }
}
