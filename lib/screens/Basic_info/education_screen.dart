import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_dating/screens/Basic_info/marital_screen.dart';
import '../../model/education_model.dart';
import '../../model/personality_model.dart';
import '../../model/sexuality_model.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  double _progressValue = 0.0;
  DateTime selectedDate = DateTime.now();
  String dob = "";
  String height = "";
  
  List educationList = [];
  bool selected = false;

  @override
  void initState() {
    _progressValue = 0.4;

    educationList.add(EducationModel(educationType: "None", isSelected: selected));
    educationList.add(EducationModel(educationType: "high School", isSelected: selected));
    educationList.add(EducationModel(educationType: "College", isSelected: selected));
    educationList.add(EducationModel(educationType: "Bachelor Degree", isSelected: selected));
    educationList.add(EducationModel(educationType: "Postgraduate", isSelected: selected));
    educationList.add(EducationModel(educationType: "Master", isSelected: selected));
    educationList.add(EducationModel(educationType: "Phd/Doctorate", isSelected: selected));
    educationList.add(EducationModel(educationType: "Postdoctoral", isSelected: selected));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: const Text.rich(TextSpan(
                text: '4',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                children: <InlineSpan>[
                  TextSpan(text: '/8', style: TextStyle(color: Colors.grey))
                ])),
            actions: [GestureDetector(
              onTap: () {

              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("Skip",style: TextStyle(color: Colors.pinkAccent),)),
              ),
            )],
          ),
          body: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                value: _progressValue,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "What's Your Education?",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                      ),
                    ),

                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: educationList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {});

                            for (int i = 0; i < educationList.length; i++) {
                              if (i == index) {
                                educationList[i].isSelected = true;
                              } else {
                                educationList[i].isSelected = false;
                              }
                            }
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                  color: educationList[index].isSelected
                                      ? Colors.grey
                                      : Colors.transparent),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(educationList[index].educationType),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap:  () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const MaritalScreen(),));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.pinkAccent),
                          child: const Text(
                            "Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,)
                  ],
                ),
              ),
            ),
          ],)
        ));
  }
}
