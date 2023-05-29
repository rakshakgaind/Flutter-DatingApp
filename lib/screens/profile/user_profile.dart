import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_dating/model/Info_Model.dart';
import 'package:social_dating/screens/payment_screens/pricing_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  List infoList = [];
  List profileImagesList = [];
  bool selected = true;
  TextEditingController aboutYourselfController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  String selectedImagePath1 = "";

  @override
  void initState() {
    infoList.add(
        InfoModel(infoType: "height", infoValue: "5.9", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Body Type", infoValue: "Average", isSelected: selected));
    infoList.add(InfoModel(infoType: "Gender", infoValue: "Man", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Sexuality", infoValue: "Straight", isSelected: selected));
    infoList.add(InfoModel(infoType: "Personality", infoValue: "Funny", isSelected: selected));
    infoList.add(InfoModel(infoType: "Education", infoValue: "High School", isSelected: selected));
    infoList.add(InfoModel(infoType: "Marital Status", infoValue: "Single", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Looking for",
        infoValue: "Friendship",
        isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Religion", infoValue: "Christian", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Drinking",
        infoValue: "Heavy drinker",
        isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Smoking", infoValue: "Heavy Smoker", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Eating", infoValue: "Non-Veg", isSelected: selected));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              actions: [
                InkWell(
                    onTap: () {
                      selected = !selected;
                      setState(() {});
                    },
                    child: !selected
                        ? const Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.edit,
                              color: Colors.pinkAccent,
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.send,
                              color: Colors.pinkAccent,
                            ),
                          )),
              ],
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: const Size(0, 20),
                child: Container(),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/images/man model image 4.jpeg',
                      fit: BoxFit.fill,
                    ),
                    collapseMode: CollapseMode.parallax,
                  ),
                  Positioned(
                    bottom: -1,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            topRight: Radius.circular(90),
                          )),
                    ),
                  ),
                ],
              ),
            ),

            /// list containing items info related to user profile
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        /// user name and online icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 10,
                            ),
                            Text(
                              "Sahil Sharma, 22",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PricingScreen(),));

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pinkAccent),
                              child: const Text(
                                "Upgrade to Premium",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /// text field to write something about yourself
                        selected
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(12)),
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: aboutYourselfController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            bottom: 10, left: 10, top: 10),
                                        fillColor: Colors.grey.shade300,
                                        border: InputBorder.none,
                                        hintText:
                                            'Type something about yourself'),
                                  ),
                                ),
                              )
                            : Text(aboutYourselfController.text),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 12,
                          color: Colors.grey,
                        ),
                        /// pictures grid view to add more pictures from gallery
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 15, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "All Photos (${profileImagesList.length})",
                                style:
                                    const TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        profileImagesList.isNotEmpty
                            ? GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                itemCount: profileImagesList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 2 / 3,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 2,
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) => Center(
                                  child: Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.file(
                                          File(profileImagesList[index]),
                                          height: 150,
                                          width: 200,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          color: Colors.grey.shade300,
                                          height: 150,
                                          width: 110,
                                          child: const Icon(
                                            Icons.account_circle_outlined,
                                            size: 80,
                                            color: Colors.pinkAccent,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 20,
                        ),

                        /// button to add more pictures
                        GestureDetector(
                          onTap: () async {
                            final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            setState(() {});
                            selectedImagePath1 = (image?.path)!;
                            profileImagesList.add(selectedImagePath1);
                            debugPrint(
                                "<-----profile image length--->${profileImagesList.length}");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.pinkAccent),
                              child: const Text(
                                "Add Pictures",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        /// user information related to profile listviewBuilder
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, bottom: 10),
                          child: Row(
                            children: const [
                              Text(
                                "Your Information",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Divider(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: infoList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(infoList[index].infoType),
                                      Text(infoList[index].infoValue),
                                    ],
                                  ),
                                  const Divider(
                                    height: 12,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
