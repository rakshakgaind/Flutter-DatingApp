import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: true,
         appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: const Text("Account Setting",style: TextStyle(color: Colors.black),),


      ),
      body: SingleChildScrollView(
        child: Column(

          children: [

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

            padding:  EdgeInsets.only(left: 20,right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: GestureDetector(
              onTap:  () {
                Navigator.pop(context);
             //   Navigator.push(context, MaterialPageRoute(builder: (context) => const BirthdayScreen(),));
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
