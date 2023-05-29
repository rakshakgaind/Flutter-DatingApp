import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  bool billType=true;
  String paymentBill="25";
  String timePeriod="monthly";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: CustomScrollView(
          slivers: <Widget>[
            /// app bar of sliver containing the profile picture and edit icons
            SliverAppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.pinkAccent,
                  )),
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: const Size(0, 20),
                child: Container(),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.2,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/images/mobile-payment-smartphone-online-credit-260nw-1937879032.webp',
                      fit: BoxFit.fill,
                    ),
                    collapseMode: CollapseMode.parallax,
                  ),
                  /*Positioned(
                    bottom: -1,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(110),
                      topRight:  Radius.circular(110),
                      ),
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            *//*borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )*//*
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                    (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children:  [
                  const Text("Pricing",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                      const Text("Bill yearly"),
                      Transform.scale(
                        scale: 0.9,
                        child: CupertinoSwitch(
                          value: billType,
                          onChanged: (value) {
                            billType = value;

                            if(billType){
                              paymentBill="25";
                              timePeriod="monthly";
                            }else{
                              paymentBill="250";
                              timePeriod="yearly";
                            }
                            setState(
                                  () {},
                            );
                          },
                          thumbColor: CupertinoColors.white,
                          activeColor: CupertinoColors.systemPink,
                        ),
                      ),
                      const Text("Bill monthly"),
                    ],),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0,right: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height/1.7,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(children:  [
                            Row(
                              children: const [
                                Text("Premium Plan",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                              ],
                            ),
                            Row(
                              children:  [
                                Text.rich(TextSpan(
                                    text: '\$$paymentBill ',
                                    style: const TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                                    children:  <InlineSpan>[
                                      TextSpan(
                                          text: '/$timePeriod', style: const TextStyle(color: Colors.grey,
                                        fontSize: 15,
                                      ))
                                    ])),
                              ],
                            ),
                            Row(children: const [
                              Icon(Icons.check_rounded,color: Colors.pinkAccent,),
                              SizedBox(width: 3,),
                              Text("Unlimited Swipe")
                              
                            ],),
                            Row(children: const [
                              Icon(Icons.check_rounded,color: Colors.pinkAccent,),
                              SizedBox(width: 3,),
                              Text("Message Directly")

                            ],),
                            Row(children: const [
                              Icon(Icons.check_rounded,color: Colors.pinkAccent,),
                              SizedBox(width: 3,),
                              Text("Swipe around the world")

                            ],),
                            Row(children: const [
                              Icon(Icons.check_rounded,color: Colors.pinkAccent,),
                              SizedBox(width: 3,),
                              Text("See who likes you")

                            ],),
                            Row(children: const [
                              Icon(Icons.check_rounded,color: Colors.pinkAccent,),
                              SizedBox(width: 3,),
                              Text("Access to all seekers option")

                            ],),



                      ],),
                        ),),
                    ),
                    GestureDetector(
                      onTap: () async {

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25,top: 10,bottom: 10),
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height / 15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.pinkAccent),
                          child: const Text(
                            "Subscribe Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                ],);
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
