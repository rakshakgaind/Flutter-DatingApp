import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_dating/screens/drawer_screens/account_settings.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}
class _SettingState extends State<Setting> {
  bool notificationOn = false;
  bool pauseMatch = false;
  bool matchSound = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSetting(),));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 2),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Account Settings",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 15, top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Notification",
                      style: TextStyle(color: Colors.grey),
                    ),
                    CupertinoSwitch(
                      value: notificationOn,
                      onChanged: (value) {
                        notificationOn = value;
                        setState(
                          () {},
                        );
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.systemPink,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 15, top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text(
                      "Pause Matches",
                      style: TextStyle(color: Colors.grey),
                    ),
                    CupertinoSwitch(
                      value: pauseMatch,
                      onChanged: (value) {
                        pauseMatch = value;
                        setState(
                              () {},
                        );
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.systemPink,
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 15, top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text(
                      "Match Sound",
                      style: TextStyle(color: Colors.grey),
                    ),
                    CupertinoSwitch(
                      value: matchSound,
                      onChanged: (value) {
                        matchSound = value;
                        setState(
                              () {},
                        );
                      },
                      thumbColor: CupertinoColors.white,
                      activeColor: CupertinoColors.systemPink,
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Rate this App",
                      style: TextStyle(color: Colors.grey),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Share this App",
                      style: TextStyle(color: Colors.grey),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Delete Account",
                      style: TextStyle(color: Colors.pinkAccent),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
