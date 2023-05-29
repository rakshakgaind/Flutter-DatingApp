import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'congratulation_screen.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final ImagePicker picker = ImagePicker();
  String selectedImagePath1 = "";
  String selectedImagePath2 = "";
  String selectedImagePath3 = "";
  String selectedImagePath4 = "";
  String selectedImagePath5 = "";
  String selectedImagePath6 = "";
  String selectedImagePath7 = "";
  String selectedImagePath8 = "";
  String selectedImagePath9 = "";
  String selectedImagePath10 = "";
  String selectedImagePath11 = "";
  List<int> items=[1,2,3];
  List<File> selectedImages = []; // List of selected image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: const Text(
            "Add Photos",
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            /*GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.pinkAccent,
                  ),
                ))*/
          ],
        ),
   
   body: Center(
     child: SingleChildScrollView(
       child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
       Center(
         child: InkWell(
           onTap: () async {
             final XFile? image = await picker.pickImage(
               source: ImageSource.gallery,
             );
             setState(() {});
             selectedImagePath1 = (image?.path)!;
           },
           child: Container(

               decoration: BoxDecoration(
                   color: Colors.grey.shade300,
                   borderRadius: BorderRadius.circular(12)),
               height: 150,
               width: 150,
               child:
               selectedImagePath1.isNotEmpty
                   ? ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                   child: Image.file(File(selectedImagePath1),fit: BoxFit.cover,))
                   : const Center(
                 child: CircleAvatar(
                   backgroundColor: Colors.white,
                   radius: 15,
                   child: Text("+"),
                 ),
               )),
         ),
       ),
         const SizedBox(height: 50,),
         const Text("Add your Profile Picture"),
         const SizedBox(height: 30,),

         Padding(
           padding: const EdgeInsets.only(left: 20,right: 20),
           child: GestureDetector(
             onTap:  () {
               if(selectedImagePath1.isNotEmpty){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  CongratulationScreen(photoPath:selectedImagePath1),));
               }else{
                 
               }
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
     ],),),
   ),
    );
  }
}
