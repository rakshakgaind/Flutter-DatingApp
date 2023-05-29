class ShowMeModel {
  String shoeMe="";
  bool isSelected=false;
  ShowMeModel({required this.shoeMe,required this.isSelected});
  factory ShowMeModel.fromJson(Map<String,dynamic>json){

    return ShowMeModel(shoeMe: "", isSelected: false);
  }


}