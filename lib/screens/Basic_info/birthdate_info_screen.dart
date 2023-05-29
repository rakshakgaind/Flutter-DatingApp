import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_dating/model/body_model.dart';
import 'package:social_dating/model/gender_model.dart';
import 'package:social_dating/model/height_model.dart';
import 'package:social_dating/screens/Basic_info/personality_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
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

  List heightList = [];
  List bodyTypeList = [];
  List genderTypeList = [];
  bool selected = false;
  bool bodyTypeSelected = false;
  bool genderTypeSelected = false;

  @override
  void initState() {
    _progressValue = 0.2;
    /// height list adding data--->
    heightList.add(HeightModel(cm: "145 cm", inches: "4'9\"", isSelected: selected));
    heightList.add(HeightModel(cm: "147 cm", inches: "4'10\"", isSelected: selected));
    heightList.add(HeightModel(cm: "150 cm", inches: "4'11\"", isSelected: selected));
    heightList.add(HeightModel(cm: "152 cm", inches: "5'0\"", isSelected: selected));
    heightList.add(HeightModel(cm: "155 cm", inches: "5'1\"", isSelected: selected));
    heightList.add(HeightModel(cm: "157.5 cm", inches: "5'2\"", isSelected: selected));
    heightList.add(HeightModel(cm: "160 cm", inches: "5'3\"", isSelected: selected));
    heightList.add(HeightModel(cm: "162.5 cm", inches: "5'4\"", isSelected: selected));
    heightList.add(HeightModel(cm: "165 cm", inches: "5'5\"", isSelected: selected));

    /// body list adding data--->
    bodyTypeList.add(BodyTypeModel(bodyType: "Thin", isSelected: bodyTypeSelected));
    bodyTypeList.add(BodyTypeModel(bodyType: "Average", isSelected: bodyTypeSelected));
    bodyTypeList.add(BodyTypeModel(bodyType: "Athletic", isSelected: bodyTypeSelected));
    bodyTypeList.add(BodyTypeModel(bodyType: "Curvy", isSelected: bodyTypeSelected));

    /// Gender list adding data-->
    genderTypeList.add(GenderModel(gender: "Man", isSelected: genderTypeSelected));
    genderTypeList.add(GenderModel(gender: "Woman", isSelected: genderTypeSelected));
    genderTypeList.add(GenderModel(gender: "Non-binary", isSelected: genderTypeSelected));
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
        //  title: const Text("1/8",style: TextStyle(color: Colors.grey),),
        title: const Text.rich(TextSpan(
            text: '2',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            children: <InlineSpan>[
              TextSpan(text: '/8', style: TextStyle(color: Colors.grey))
            ])),
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
                    "My Birthday is",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: const [
                      Text(
                        "Date of Birth*",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            dob.isNotEmpty
                                ? Text(dob.toString())
                                : const Text("MM/DD/YYY"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: const [
                      Text(
                        "your age will be public",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: const [
                      Text(
                        "Height",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              StateSetter modalState /*You can rename this!*/) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(Icons.cancel_outlined)),
                                      const Text(
                                        "Height",
                                        style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context, height);
                                          },
                                          child: const Icon(
                                            Icons.offline_pin_rounded,
                                            color: Colors.pinkAccent,
                                          )),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "ft/inches",
                                        style: TextStyle(color: Colors.pinkAccent),
                                      ),
                                      Text(
                                        "cm",
                                        style: TextStyle(color: Colors.pinkAccent),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),

                                    shrinkWrap: true,
                                    itemCount: heightList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          for (int i = 0;
                                          i < heightList.length;
                                          i++) {
                                            if (i == index) {
                                              modalState(() {
                                                heightList[i].isSelected = true;
                                                height = heightList[index].cm;
                                                debugPrint("<--height--->$height");
                                              });
                                            } else {
                                              modalState(() {
                                                heightList[i].isSelected = false;
                                              });
                                            }
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                      width: 70,
                                                      child: Text(
                                                        heightList[index].inches,
                                                        style: const TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                                  heightList[index].isSelected
                                                      ? const SizedBox(
                                                      width: 70,
                                                      child: Icon(
                                                        Icons
                                                            .offline_pin_rounded,
                                                        size: 15,
                                                      ))
                                                      : Container(),
                                                  Container(
                                                      alignment:
                                                      Alignment.centerRight,
                                                      width: 70,
                                                      child: Text(
                                                        heightList[index].cm,
                                                        style: const TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Divider(
                                                height: 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    ).then((value) => {
                      debugPrint("value--->$value"),
                      height = value,
                      setState(() {}),
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            height.isNotEmpty ? Text(height) : const Text("Height"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Body Type",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  itemCount: bodyTypeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {});

                        for (int i = 0; i < bodyTypeList.length; i++) {
                          if (i == index) {
                            bodyTypeList[i].isSelected = true;
                          } else {
                            bodyTypeList[i].isSelected = false;
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
                              color: bodyTypeList[index].isSelected
                                  ? Colors.grey
                                  : Colors.transparent),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(bodyTypeList[index].bodyType),
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
                    "Gender",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: genderTypeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {});

                        for (int i = 0; i < genderTypeList.length; i++) {
                          if (i == index) {
                            genderTypeList[i].isSelected = true;
                          } else {
                            genderTypeList[i].isSelected = false;
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
                              color: genderTypeList[index].isSelected
                                  ? Colors.grey
                                  : Colors.transparent),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(genderTypeList[index].gender),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalityScreen(),));
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
        )
      ],),
    ));
  }
}
