class BodyTypeModel{

  String bodyType="";
  bool isSelected=false;
  BodyTypeModel({required this.bodyType,required this.isSelected});
  factory BodyTypeModel.fromJson(Map<String,dynamic>json){
    return BodyTypeModel(bodyType: "",
    isSelected: false);

  }
}