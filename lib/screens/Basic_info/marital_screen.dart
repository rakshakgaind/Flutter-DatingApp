import 'package:flutter/material.dart';
import 'package:social_dating/screens/Basic_info/drinking_screen.dart';
import 'package:social_dating/screens/Basic_info/looking_for_screen.dart';
import 'package:social_dating/screens/Basic_info/religion_screen.dart';
import '../../model/education_model.dart';
import '../../model/marital_model.dart';

  class MaritalScreen extends StatefulWidget {
  const MaritalScreen({Key? key}) : super(key: key);

  @override
  State<MaritalScreen> createState() => _MaritalScreenState();
}

class _MaritalScreenState extends State<MaritalScreen> {
  double _progressValue = 0.0;
  DateTime selectedDate = DateTime.now();
  String dob = "";
  String height = "";

  List maritalList = [];
  bool selected = false;

  @override
  void initState() {
    _progressValue = 0.5;



    maritalList.add(MaritalModel(status: "Single", isSelected: selected));
    maritalList.add(MaritalModel(status: "Single mom", isSelected: selected));
    maritalList.add(MaritalModel(status: "Single dad", isSelected: selected));
    maritalList.add(MaritalModel(status: "In a relationship", isSelected: selected));
    maritalList.add(MaritalModel(status: "Married", isSelected: selected));
    maritalList.add(MaritalModel(status: "separated", isSelected: selected));
    maritalList.add(MaritalModel(status: "Divorce", isSelected: selected));
    maritalList.add(MaritalModel(status: "Widowed", isSelected: selected));



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
                text: '5',
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
                          "Marital Status",
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: maritalList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {});

                              for (int i = 0; i < maritalList.length; i++) {
                                if (i == index) {
                                  maritalList[i].isSelected = true;
                                } else {
                                  maritalList[i].isSelected = false;
                                }
                              }
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LookingForScreen(),));
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: maritalList[index].isSelected
                                        ? Colors.grey
                                        : Colors.transparent),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(maritalList[index].status),
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
            ),
          ],)
        ));
  }
}
