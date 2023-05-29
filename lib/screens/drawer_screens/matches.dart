import 'package:flutter/material.dart';
import 'package:social_dating/model/seekers_model.dart';
import 'package:social_dating/screens/profile/matches_profile_screen.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {

  List seekerList=[];
  bool isSelected=false;

  @override
  void initState() {
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/man model image 4.jpeg", seekersName: "Arun Kumar"));
    seekerList.add(SeekersModel(isSelected: isSelected, image: "assets/images/girl image.jpeg", seekersName: "Ankita Rana"));

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
        title: const Text("Matches",style: TextStyle(color: Colors.black),),


      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          itemCount: seekerList.length,

          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2/2.7 ,
              crossAxisSpacing: 12,
              mainAxisSpacing: 1,
              crossAxisCount: 2

          ), itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MatchesProfileScreen(),));
          },
            child: Center(
            child: Stack(children: [
              ClipRRect(
                  borderRadius:
                  BorderRadius.circular(12),
                  child: Image.asset(

                    seekerList[index].image,fit: BoxFit.fill,height: 300,)),
               Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(seekerList[index].seekersName,style: const TextStyle(color: Colors.white),),
                  ))
            ],),
        ),
          ),),
      ),


    ));
  }
}
