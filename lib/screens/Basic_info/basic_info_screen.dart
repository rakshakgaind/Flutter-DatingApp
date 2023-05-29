import 'package:flutter/material.dart';
import 'package:social_dating/screens/Basic_info/birthdate_info_screen.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({Key? key}) : super(key: key);

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
   double _progressValue=0.0;
  @override
  void initState() {
    _progressValue = 0.1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
      //  title: const Text("1/8",style: TextStyle(color: Colors.grey),),
        title: const Text.rich(TextSpan(
            text: '1',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
            children: <InlineSpan>[
              TextSpan(
                text: '/8',style: TextStyle(color: Colors.grey)
              )
            ]
        )
        ),

      ),
      body: SingleChildScrollView(
        child: Column(children:   [
          const SizedBox(height: 30,),
           Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child:    LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              value: _progressValue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: Row(
              children: const [
                Text(
                  "Basic Info",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 25),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Full Name")
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              decoration: InputDecoration(
                label: Text("User Name")
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Email")
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/5,),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: GestureDetector(
              onTap:  () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BirthdayScreen(),));
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
      ),

    ));
  }
}
