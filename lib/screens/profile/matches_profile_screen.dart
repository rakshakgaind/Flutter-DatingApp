import 'package:flutter/material.dart';
import 'package:social_dating/model/Info_Model.dart';

class MatchesProfileScreen extends StatefulWidget {
  const MatchesProfileScreen({Key? key}) : super(key: key);

  @override
  State<MatchesProfileScreen> createState() => _MatchesProfileScreenState();
}

class _MatchesProfileScreenState extends State<MatchesProfileScreen> {
  List infoList = [];
  bool selected = false;

  @override
  void initState() {
    infoList.add(
        InfoModel(infoType: "height", infoValue: "5.9", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Body Type", infoValue: "Average", isSelected: selected));
    infoList.add(
        InfoModel(infoType: "Gender", infoValue: "Man", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Sexuality", infoValue: "Straight", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Personality", infoValue: "Funny", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Education", infoValue: "High School", isSelected: selected));
    infoList.add(InfoModel(
        infoType: "Marital Status", infoValue: "Single", isSelected: selected));
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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

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
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background:   Image.asset(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          Text(
                            "Aman Rana, 22",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey.shade400,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "0 km away",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade400),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(
                        height: 12,
                        color: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint("<---Pressed---->");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "All Photos",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "See All",
                                    style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      height: 150,
                                      width: 150,
                                      child: Center(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.asset(
                                                "assets/images/man model image 2.jpeg")),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
    );
  }
}
