class LookingForModel{

  String lookingForType="";
  bool isSelected=false;
  LookingForModel({required this.lookingForType,required this.isSelected});

  factory LookingForModel.fromJson(Map<String,dynamic>json){

    return LookingForModel(lookingForType: '', isSelected: false);
  }
}