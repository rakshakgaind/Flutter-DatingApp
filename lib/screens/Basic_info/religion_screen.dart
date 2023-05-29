import 'package:flutter/material.dart';
import 'package:social_dating/screens/Basic_info/drinking_screen.dart';
import '../../model/education_model.dart';
import '../../model/looking_for_model.dart';
import '../../model/marital_model.dart';
import '../../model/religion_model.dart';

class ReligionScreen extends StatefulWidget {
  const ReligionScreen({Key? key}) : super(key: key);

  @override
  State<ReligionScreen> createState() => _ReligionScreenState();
}

class _ReligionScreenState extends State<ReligionScreen> {
  double _progressValue = 0.0;
  DateTime selectedDate = DateTime.now();
  String dob = "";
  String height = "";

  List religionList = [];
  bool selected = false;

  @override
  void initState() {
    _progressValue = 0.7;

    religionList.add(ReligionModel(religionType: "Christian", isSelected: selected));
    religionList.add(ReligionModel(religionType: "Muslim", isSelected: selected));
    religionList.add(ReligionModel(religionType: "Hindu", isSelected: selected));
    religionList.add(ReligionModel(religionType: "Atheist", isSelected: selected));
    religionList.add(ReligionModel(religionType: "Sikh", isSelected: selected));
    religionList.add(ReligionModel(religionType: "Buddhist", isSelected: selected));
    religionList.add(ReligionModel(religionType: "Others", isSelected: selected));




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
                text: '7',
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
          body: SingleChildScrollView(
              child: Column(
                children: [
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Religion",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: religionList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {});

                          for (int i = 0; i < religionList.length; i++) {
                            if (i == index) {
                              religionList[i].isSelected = true;
                            } else {
                              religionList[i].isSelected = false;
                            }
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkingScreen(),));
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color:
                              religionList[index].isSelected
                                  ? Colors.pinkAccent :
                              Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(religionList[index].religionType,
                                    style: TextStyle(color: religionList[index].isSelected?
                                    Colors.pinkAccent :Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                ],
              )
          ),
        ));
  }
}
