class ReligionModel{

  String religionType="";
  bool isSelected=false;
  ReligionModel({required this.religionType,required this.isSelected});

  factory ReligionModel.fromJson(Map<String,dynamic>json){

    return ReligionModel(religionType: '', isSelected: false);
  }
}