import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../discover_screen.dart';

class CongratulationScreen extends StatefulWidget {
   CongratulationScreen({Key? key,required this.photoPath}) : super(key: key);
String photoPath="";
  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  void initState() {
debugPrint("<-----photo path--->${widget.photoPath}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Column(children:  [
          Center(
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: FileImage(File(widget.photoPath)),

              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Text("Rafal")
        ],),
        Column(children:  [
          const Icon(Icons.offline_pin_rounded,color: Colors.pinkAccent,size: 40,),
          const Text("Congratulations!",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
          Text("You have successfully completed your profile",style: TextStyle(color: Colors.grey.shade600),),
        ],),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: GestureDetector(
            onTap:  () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Discover(),));
            },
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


      ],),

    );
  }
}
