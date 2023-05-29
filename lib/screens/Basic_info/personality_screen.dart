import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_dating/screens/Basic_info/education_screen.dart';
import '../../model/personality_model.dart';
import '../../model/sexuality_model.dart';

class PersonalityScreen extends StatefulWidget {
  const PersonalityScreen({Key? key}) : super(key: key);

  @override
  State<PersonalityScreen> createState() => _PersonalityScreenState();
}

class _PersonalityScreenState extends State<PersonalityScreen> {
  double _progressValue = 0.0;
  DateTime selectedDate = DateTime.now();
  String dob = "";
  String height = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1960),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        debugPrint(picked.toString());
        String formattedDate = DateFormat('MM/dd/yyyy').format(picked);
        dob = formattedDate;
      });
    }
  }

  List personalityList = [];
  List sexualityTypeList = [];
  
  bool selected = false;
  bool personalityTypeSelected = false;
  bool sexualityTypeSelected = false;

  @override
  void initState() {
    _progressValue = 0.3;



    personalityList.add(PersonalityModel(personalityType: "Funny", isSelected: personalityTypeSelected));
    personalityList.add(PersonalityModel(personalityType: "Romantic", isSelected: personalityTypeSelected));
    personalityList.add(PersonalityModel(personalityType: "Open-minded", isSelected: personalityTypeSelected));
    personalityList.add(PersonalityModel(personalityType: "Faithful", isSelected: personalityTypeSelected));
    personalityList.add(PersonalityModel(personalityType: "Shy", isSelected: personalityTypeSelected));
    personalityList.add(PersonalityModel(personalityType: "Moody", isSelected: personalityTypeSelected));
    personalityList.add(PersonalityModel(personalityType: "Entrepreneur", isSelected: personalityTypeSelected));
    personalityList.add(PersonalityModel(personalityType: "Other", isSelected: personalityTypeSelected));


    sexualityTypeList.add(SexualityModel(type: "Straight", isSelected: sexualityTypeSelected));
    sexualityTypeList.add(SexualityModel(type: "Gay", isSelected: sexualityTypeSelected));
    sexualityTypeList.add(SexualityModel(type: "Lesbian", isSelected: sexualityTypeSelected));
    sexualityTypeList.add(SexualityModel(type: "Bisexual", isSelected: sexualityTypeSelected));
    sexualityTypeList.add(SexualityModel(type: "Trans", isSelected: sexualityTypeSelected));
    sexualityTypeList.add(SexualityModel(type: "Other", isSelected: sexualityTypeSelected));
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
                text: '3',
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
                        "Personality",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                      ),
                    ),


                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),

                      shrinkWrap: true,
                      itemCount: personalityList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {});

                            for (int i = 0; i < personalityList.length; i++) {
                              if (i == index) {
                                personalityList[i].isSelected = true;
                              } else {
                                personalityList[i].isSelected = false;
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
                                  color: personalityList[index].isSelected
                                      ? Colors.grey
                                      : Colors.transparent),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(personalityList[index].personalityType),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "Sexuality",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: sexualityTypeList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {});

                            for (int i = 0; i < sexualityTypeList.length; i++) {
                              if (i == index) {
                                sexualityTypeList[i].isSelected = true;
                              } else {
                                sexualityTypeList[i].isSelected = false;
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
                                  color: sexualityTypeList[index].isSelected
                                      ? Colors.grey
                                      : Colors.transparent),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(sexualityTypeList[index].type),
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
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const EducationScreen(),));
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
