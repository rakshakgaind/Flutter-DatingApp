import 'package:flutter/material.dart';
import 'package:social_dating/model/interest_model.dart';
import 'package:social_dating/screens/drawer_screens/matches.dart';
import 'package:social_dating/screens/drawer_screens/seekers_screen.dart';
import 'package:social_dating/screens/drawer_screens/setting_screen.dart';
import 'package:social_dating/screens/payment_screens/pricing_screen.dart';
import 'package:social_dating/screens/profile/matches_profile_screen.dart';
import 'package:social_dating/screens/profile/user_profile.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../model/show_me_model.dart';
import 'Basic_info/content.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Ankit,22",
    "Rahul,18",
    "Vinay,28",
    "Mohit,31",
    "Gurvinder,21",
    "Anamika,25",
    "Rahul,27",
    "Pankaj,30",
    "Mahima,32",
    "Aradhya,22",
    "Ankit,22",
    "Rahul,18",
    "Vinay,28",
    "Mohit,31",
    "Gurvinder,21",
    "Anamika,25",
    "Rahul,27",
    "Pankaj,30",
    "Mahima,32",
    "Aradhya,22",
  ];
  final List<String> distance = [
    "0 km away",
    "2 km away",
    "3 km away",
    "4 km away",
    "2 km away",
    "7 km away",
    "3 km away",
    "6 km away",
    "3 km away",
    "7 km away",
    "0 km away",
    "2 km away",
    "3 km away",
    "4 km away",
    "2 km away",
    "7 km away",
    "3 km away",
    "6 km away",
    "3 km away",
    "7 km away",
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink,
    Colors.pink,
    Colors.pink,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink,
    Colors.pink,
    Colors.pink,
  ];
  final List<String> images = [
    "assets/images/man model image 4.jpeg",
    "assets/images/man model image 2.jpeg",
    "assets/images/man model image 5.jpeg",
    "assets/images/manmodel image 1.jpeg",
    "assets/images/girl imag 2.jpeg",
    "assets/images/girl image.jpeg",
    "assets/images/girl image 4.jpeg",
    "assets/images/man model image 5.jpeg",
    "assets/images/girl imag 2.jpeg",
    "assets/images/model_image1.webp",
    "assets/images/man model image 2.jpeg",
    "assets/images/man model image 4.jpeg",
    "assets/images/man model image 5.jpeg",
    "assets/images/manmodel image 1.jpeg",
    "assets/images/girl imag 2.jpeg",
    "assets/images/girl image.jpeg",
    "assets/images/girl image 4.jpeg",
    "assets/images/man model image 5.jpeg",
    "assets/images/girl imag 2.jpeg",
    "assets/images/model_image1.webp",
  ];
  double _value = 0.0;
  double ageValue = 18.0;

  bool showInterest = false;
  bool showMe = false;
  bool isSelected = false;

  List interestList = [];
  List showMeList = [];

  @override
  void initState() {
    interestList.add(InterestModel(interest: "Dating", isSelected: isSelected));
    interestList.add(InterestModel(interest: "Friendship", isSelected: isSelected));
    interestList.add(InterestModel(interest: "Chat Buddy", isSelected: isSelected));
    interestList.add(InterestModel(interest: "High Buddy", isSelected: isSelected));
    interestList.add(InterestModel(interest: "Sugar Daddy", isSelected: isSelected));
    interestList.add(InterestModel(interest: "Sugar Momma", isSelected: isSelected));
    interestList.add(InterestModel(interest: "Sugar Baby", isSelected: isSelected));
    interestList.add(InterestModel(interest: "Hookups", isSelected: isSelected));
    interestList.add(InterestModel(interest: "Friends with benefits", isSelected: isSelected));



    showMeList.add(ShowMeModel(shoeMe: "Straight", isSelected: isSelected));
    showMeList.add(ShowMeModel(shoeMe: "Gay", isSelected: isSelected));
    showMeList.add(ShowMeModel(shoeMe: "Lesbian", isSelected: isSelected));
    showMeList.add(ShowMeModel(shoeMe: "Bisexual", isSelected: isSelected));
    showMeList.add(ShowMeModel(shoeMe: "Trans", isSelected: isSelected));
    showMeList.add(ShowMeModel(shoeMe: "Others", isSelected: isSelected));

    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(
            text: _names[i],
            color: _colors[i],
            images: images[i],
            distance: distance[i],
          ),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.pinkAccent,
              content: Text("Liked ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.pinkAccent,
              content: Text("Nope ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.pinkAccent,
              content: Text("Superliked ${_names[i]}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            debugPrint("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(
                    Icons.drag_handle,
                    color: Colors.black,
                  ));
            },
          ),
          title: const Text(
            "Discover",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                 // useSafeArea: true,
                 // isScrollControlled: true,
                 // enableDrag: true,

                  shape: const RoundedRectangleBorder(
                    // <-- SEE HERE
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (BuildContext context,
                          StateSetter modalState /*You can rename this!*/) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.cancel_outlined)),
                                  const Text(
                                    "Filter",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      modalState((){});
                                      _value = 0.0;
                                       ageValue = 18.0;
                                       showInterest = false;
                                       showMe = false;
                                       isSelected = false;
                                    },
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 3,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 20,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Distance",
                                          ),
                                          Text(
                                            "${_value.toInt()}mi",
                                            style: TextStyle(
                                                color: Colors.grey.shade400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SliderTheme(
                                      data: const SliderThemeData(
                                        thumbColor: Colors.pinkAccent,
                                      ),
                                      child: Slider(
                                        activeColor: Colors.pinkAccent,
                                        inactiveColor: Colors.grey,
                                        min: 0,
                                        max: 1000,
                                        value: _value,
                                        onChanged: (value) {
                                          setState(() {
                                            modalState(() {});
                                            _value = value;
                                            debugPrint("<---value--->$value");
                                          });
                                        },
                                      ),
                                    ),


                                    const Divider(
                                      height: 3,
                                    ),
                                    /// interest-------->
                                    InkWell(
                                      onTap: () {
                                        modalState(() {});
                                        showInterest = !showInterest;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "Interested in",
                                            ),
                                            Icon(Icons.arrow_drop_down_rounded),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Visibility(
                                      visible: showInterest,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: interestList.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              modalState((){});
                                              interestList[index].isSelected =! interestList[index].isSelected;
                                            /*  for (int i = 0; i < interestList.length; i++) {
                                                if(i==index){
                                                  interestList[i].isSelected=true;
                                                }else{
                                                  interestList[i].isSelected=false;

                                                }
                                              }*/
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                   Icon(
                                                    !interestList[index].isSelected ?
                                                    Icons.circle_outlined :Icons.circle,
                                                    color: Colors.pinkAccent,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(interestList[index]
                                                      .interest)
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),


                                /// Show me------------>
                                    const Divider(
                                      height: 3,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        modalState(() {});
                                        showMe = !showMe;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              "Show Me",
                                            ),
                                            Icon(Icons.arrow_drop_down_rounded),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Visibility(
                                      visible: showMe,
                                      child: ListView.builder(
                                        physics:
                                        const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: showMeList.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              modalState((){});
                                              showMeList[index].isSelected=!showMeList[index].isSelected;
                                              /*for (int i = 0; i < interestList.length; i++) {
                                                if(i==index){
                                                  interestList[i].isSelected=true;
                                                }else{
                                                  interestList[i].isSelected=false;

                                                }
                                              }*/
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    !showMeList[index].isSelected ?
                                                    Icons.circle_outlined :Icons.circle,
                                                    color: Colors.pinkAccent,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(showMeList[index]
                                                      .shoeMe)
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    /// age slider---->
                                    const Divider(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 20,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Age",
                                          ),
                                          Text(
                                            "18 - ${ageValue.toInt()}",
                                            style: TextStyle(
                                                color: Colors.grey.shade400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SliderTheme(
                                      data:   const SliderThemeData(
                                        thumbColor: Colors.pinkAccent,
                                      ),
                                      child: Slider(
                                        inactiveColor: Colors.grey,

                                        activeColor: Colors.pinkAccent,
                                        min: 18,
                                        max: 80,
                                        value: ageValue,
                                        onChanged: (value) {
                                          setState(() {
                                            modalState(() {});
                                            ageValue = value;
                                            debugPrint("<---Age--->$value");
                                          });
                                        },
                                      ),
                                    ),
                                    const Divider(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                              child: GestureDetector(
                                onTap:  () {
                            //      Navigator.push(context, MaterialPageRoute(builder: (context) => const Discover(),));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height / 15,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.pinkAccent),
                                  child: const Text(
                                    "Done",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.filter_alt_sharp,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                "assets/images/girl imag 2.jpeg",
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [Text("Aman Rana, 22")],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScreen(),));
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 20, top: 8, bottom: 8),
                                child: Text(
                                  "My Profile",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Text('My Membership'),
                    SizedBox(width: 5,),
                    Text('29 days left',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w900),),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  const PricingScreen()
                    ,));
                },
              ),
              ListTile(
                title: const Text('Matches'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    const MatchesScreen()
                    ,));
                },
              ),
              ListTile(
                title: const Text('notifications'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Seekers'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SeekersScreen(),));

                },
              ),
              ListTile(
                title: const Text('Invite Friends'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Terms and Conditions'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Setting'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Setting(),));

                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Stack(children: [
          _swipeItems.isNotEmpty ?
          SwipeCards(
            matchEngine: _matchEngine!,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 30, bottom: 100),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 9,
                      child: Container(
                          height: MediaQuery.of(context).size.height / 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _swipeItems[index].content.color,
                          ),
                          //   alignment: Alignment.bottomCenter,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF3D3D3D),
                                  BlendMode.overlay,
                                ),
                                child: Image.asset(
                                  _swipeItems[index].content.images,
                                  fit: BoxFit.cover,
                                ),
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          _swipeItems[index].content.text,
                          style: TextStyle(
                            color: Colors.cyan.shade200,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 125),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.cyan.shade200,
                            ),
                            Text(
                              _swipeItems[index].content.distance,
                              style: TextStyle(
                                  color: Colors.cyan.shade200,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                            ),
                          ],
                        )),
                  ),
                ],
              );
            },
            onStackFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Stack Finished"),
                duration: Duration(milliseconds: 500),
              ));
              setState(() {
              });
              _swipeItems.clear();
              debugPrint("<----Swipe List Length---->${_swipeItems.length}");
            },
            itemChanged: (SwipeItem item, int index) {
              print("item: ${item.content.text}, index: $index");
            },
            leftSwipeAllowed: true,
            rightSwipeAllowed: true,
            upSwipeAllowed: true,
            fillSpace: true,
            likeTag: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: const Text('Like'),
            ),
            nopeTag: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: const Text('Nope'),
            ),
            superLikeTag: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.orange)),
              child: const Text('Super Like'),
            ),
          ) :
           Center(child: Image.asset("assets/images/disconnected.png"))
          ,
          _swipeItems.isNotEmpty ?
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        _matchEngine!.currentItem?.nope();
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: 9,
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 35,
                            color: Colors.red,
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        _matchEngine!.currentItem?.superLike();
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: 9,
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.star,
                            size: 35,
                            color: Colors.cyan,
                          ),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        _matchEngine!.currentItem?.like();
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: 9,
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_border,
                            size: 35,
                            color: Colors.purple,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ) :Container(),
        ]));
  }
}
