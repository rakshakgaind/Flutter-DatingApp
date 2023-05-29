import 'package:flutter/material.dart';
import 'package:social_dating/screens/Basic_info/drinking_screen.dart';
import 'package:social_dating/screens/Basic_info/religion_screen.dart';
import '../../model/education_model.dart';
import '../../model/looking_for_model.dart';
import '../../model/marital_model.dart';

class LookingForScreen extends StatefulWidget {
  const LookingForScreen({Key? key}) : super(key: key);

  @override
  State<LookingForScreen> createState() => _LookingForScreenState();
}

class _LookingForScreenState extends State<LookingForScreen> {
  double _progressValue = 0.0;
  DateTime selectedDate = DateTime.now();
  String dob = "";
  String height = "";

  List lookingForList = [];
  bool selected = false;

  @override
  void initState() {
    _progressValue = 0.6;



    lookingForList.add(LookingForModel(lookingForType: "Dating", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "Friendship", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "Chat Buddy", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "High Buddy", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "Sugar Daddy", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "Sugar Momma", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "Sugar Baby", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "Hookups", isSelected: selected));
    lookingForList.add(LookingForModel(lookingForType: "Friend with benefits", isSelected: selected));



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
                text: '6',
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
                      "I'm Looking for",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lookingForList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {});

                          for (int i = 0; i < lookingForList.length; i++) {
                            if (i == index) {
                              lookingForList[i].isSelected = true;
                            } else {
                              lookingForList[i].isSelected = false;
                            }
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReligionScreen(),));
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color:
                                lookingForList[index].isSelected
                                    ? Colors.pinkAccent :
                                Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(lookingForList[index].lookingForType,
                                  style: TextStyle(color: lookingForList[index].isSelected?
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
