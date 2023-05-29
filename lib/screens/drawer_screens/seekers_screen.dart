import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_dating/model/seekers_model.dart';

class SeekersScreen extends StatefulWidget {
  const SeekersScreen({Key? key}) : super(key: key);

  @override
  State<SeekersScreen> createState() => _SeekersScreenState();
}

class _SeekersScreenState extends State<SeekersScreen> {

  List seekerList=[];
  bool isSelected=false;

  @override
  void initState() {
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/role-model.png", seekersName: "I need advice"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/presentation.png", seekersName: "Be my date"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/skill.png", seekersName: "Breakfast dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/stopwatch.png", seekersName: "Chat buddy"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/struggle.png", seekersName: "Coffee dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/win.png", seekersName: "Dinner dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/struggle.png", seekersName: "Coffee dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/presentation.png", seekersName: "Be my date"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/role-model.png", seekersName: "I need advice"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/skill.png", seekersName: "Breakfast dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/stopwatch.png", seekersName: "Chat buddy"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/struggle.png", seekersName: "Coffee dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/win.png", seekersName: "Dinner dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/stopwatch.png", seekersName: "Chat buddy"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/struggle.png", seekersName: "Coffee dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/win.png", seekersName: "Dinner dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/struggle.png", seekersName: "Coffee dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/presentation.png", seekersName: "Be my date"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/role-model.png", seekersName: "I need advice"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/skill.png", seekersName: "Breakfast dates"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/stopwatch.png", seekersName: "Chat buddy"));




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: const Text("Seekers",style: TextStyle(color: Colors.black),),
        actions: const [
          Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.send,color: Colors.black,),
        )],

      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          itemCount: seekerList.length,

          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2/2.8 ,
              crossAxisSpacing: 20,
              mainAxisSpacing: 1,
              crossAxisCount: 3

          ), itemBuilder: (context, index) => Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:   [
                Container(
                  alignment: Alignment.center,

                  decoration:  BoxDecoration(color: Colors.red.shade50,
                shape: BoxShape.circle,
                ),
                  child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Image.asset(seekerList[index].image)),
                ),
                const SizedBox(height: 5,),
                 Text(seekerList[index].seekersName)
              ],
            ),
          ),),
      ),


    ));
  }
}
