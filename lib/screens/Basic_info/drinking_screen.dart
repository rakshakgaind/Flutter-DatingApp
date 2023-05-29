import 'package:flutter/material.dart';
import 'package:social_dating/screens/Basic_info/add_photo_screen.dart';
import 'package:social_dating/screens/Basic_info/marital_screen.dart';
import '../../model/drinking_model.dart';


class DrinkingScreen extends StatefulWidget {
  const DrinkingScreen({Key? key}) : super(key: key);

  @override
  State<DrinkingScreen> createState() => _DrinkingScreenState();
}

class _DrinkingScreenState extends State<DrinkingScreen> {
  double _progressValue = 0.0;
  DateTime selectedDate = DateTime.now();
  String dob = "";
  String height = "";

  List drinkList = [];
  List smokeList = [];
  List eatList = [];
  bool selected = false;

  @override
  void initState() {
    _progressValue = 0.8;

    drinkList.add(DrinkingModel(drinkType: "None-drinker", isSelected: selected));
    drinkList.add(DrinkingModel(drinkType: "Social-drinker", isSelected: selected));
    drinkList.add(DrinkingModel(drinkType: "Heavy-drinker", isSelected: selected));



    smokeList.add(SmokingModel(smokeType: "Non-Smoker", isSelected: selected));
    smokeList.add(SmokingModel(smokeType: "Light-Smoker", isSelected: selected));
    smokeList.add(SmokingModel(smokeType: "Heavy Smoker", isSelected: selected));


    eatList.add(EatingModel(eatType: "Vegan", isSelected: selected));
    eatList.add(EatingModel(eatType: "vegetarian", isSelected: selected));
    eatList.add(EatingModel(eatType: "Non-vegetarian", isSelected: selected));
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
                  text: '8',
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
                          "Drinking",
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                      ),

                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: drinkList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {});

                              for (int i = 0; i < drinkList.length; i++) {
                                if (i == index) {
                                  drinkList[i].isSelected = true;
                                } else {
                                  drinkList[i].isSelected = false;
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
                                    color: drinkList[index].isSelected
                                        ? Colors.grey
                                        : Colors.transparent),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(drinkList[index].drinkType),
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
                          "Smoking",
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: smokeList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {});

                              for (int i = 0; i < smokeList.length; i++) {
                                if (i == index) {
                                  smokeList[i].isSelected = true;
                                } else {
                                  smokeList[i].isSelected = false;
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
                                    color: smokeList[index].isSelected
                                        ? Colors.grey
                                        : Colors.transparent),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(smokeList[index].smokeType),
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
                          "Eating",
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: eatList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {});

                              for (int i = 0; i < eatList.length; i++) {
                                if (i == index) {
                                  eatList[i].isSelected = true;
                                } else {
                                  eatList[i].isSelected = false;
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
                                    color: eatList[index].isSelected
                                        ? Colors.grey
                                        : Colors.transparent),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(eatList[index].eatType),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPhoto(),));
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
