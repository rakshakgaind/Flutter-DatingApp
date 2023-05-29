import 'package:flutter/material.dart';
import 'package:social_dating/screens/craete_account_screen.dart';
import 'package:social_dating/screens/login_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
              child: Column(
                children: [
                  const Icon(
                    Icons.heart_broken,
                    color: Colors.pink,
                    size: 40,
                  ),
                  const Text(
                    "Legendbae",
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  const Text(
                    "Chat.Date.invite.",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(children: [
                GestureDetector(
                  onTap:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      const CreateAccountScreen()
                      ,));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height/18,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.pinkAccent),
                    child: const Text("Create New Account",
                    style: TextStyle(color: Colors.white),),
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height/18,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(20),
                      ),
                    child: const Text("Login",
                    style: TextStyle(color: Colors.pinkAccent),),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(height: 1,
                  width: 40,
                  color: Colors.grey,),
                  const Padding(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    child: Text("Or Login With",style: TextStyle(color: Colors.grey,
                    fontSize: 13
                    ),),
                  ),
                  Container(height: 1,
                    width: 40,
                    color: Colors.grey,),

                ],),
                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                  Material(
                    shape: const CircleBorder(),
                    elevation: 5,
                    child: Image.asset("assets/images/facebook_circle_color-512.webp",
                    height: MediaQuery.of(context).size.height/15,
                    width: MediaQuery.of(context).size.height/15,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Material(
                    shape: const CircleBorder(),
                    elevation: 5,
                    child: Image.asset("assets/images/google_icon-icons.com_62798.png",
                    height: MediaQuery.of(context).size.height/15,
                    width: MediaQuery.of(context).size.height/15,
                    ),
                  ),

                ],)
              ],),
            ),
          ),
          
          Column(
            children:  [
              const Text("By creating an account, you agree to our",
              style: TextStyle(color: Colors.grey,
              fontSize: 10
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Terms & Conditions",
                  style: TextStyle(
                  fontSize: 10,
                    fontWeight: FontWeight.w700

                  ),),
                  Text("and",
                    style: TextStyle(color: Colors.grey,
                        fontSize: 10
                    ),
                  ),
                  Text("Privacy policy",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700
                    ),),
                  Text("of Legendbae",
                    style: TextStyle(color: Colors.grey,
                        fontSize: 10
                    ),),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }

  _InitialScreenState();
}
