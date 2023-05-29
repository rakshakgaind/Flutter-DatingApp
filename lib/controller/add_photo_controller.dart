import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_dating/controller/base_controller.dart';

class AddPhotoController extends BaseController{
  final ImagePicker picker = ImagePicker();
  String selectedImagePath="";


  addPhoto(BuildContext context) async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery,);
    // CroppedFile? croppedFile = await ImageCropper().cropImage(sourcePath: (image?.path)!);
    selectedImagePath = (image?.path)!;
    debugPrint("<----image Path--->$selectedImagePath");
    notifyListeners();
  /*  // set up the buttons
    Widget cancelButton = TextButton(
      child:  const Text("Take Pic"),
      onPressed: () async {
        Navigator.pop(context);

        final XFile? photo = await picker.pickImage(source: ImageSource.camera);
        if (photo != null) {
       //   CroppedFile? croppedFile = await ImageCropper().cropImage(sourcePath: (photo?.path)!);
          selectedImagePath = (photo?.path)!;
        }
      },
    );
    Widget continueButton = TextButton(
      child:  const Text("Select Pic"),
      onPressed: () async {
        notifyListeners();
        Navigator.pop(context);
        final XFile? image = await picker.pickImage(source: ImageSource.gallery,);
       // CroppedFile? croppedFile = await ImageCropper().cropImage(sourcePath: (image?.path)!);
        selectedImagePath = (image?.path)!;

        debugPrint("<----image Path--->$selectedImagePath");
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title:  const Text("Change Dp"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );*/
  }



}