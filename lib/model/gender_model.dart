class GenderModel{
  String gender="";
  bool isSelected=false;
  GenderModel({required this.gender,required this.isSelected});

  factory GenderModel.fromJson(Map<String,dynamic>json){
    return  GenderModel(gender: '', isSelected: false);
  }

}