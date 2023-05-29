class InterestModel {
  String interest="";
  bool isSelected=false;
  InterestModel({required this.interest,required this.isSelected});
  factory InterestModel.fromJson(Map<String,dynamic>json){

    return InterestModel(interest: "", isSelected: false);
  }


}