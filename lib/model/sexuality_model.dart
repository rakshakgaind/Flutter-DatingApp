class SexualityModel{

  String type="";
  bool isSelected=false;
  SexualityModel({required this.type,required this.isSelected});

  factory SexualityModel.fromJson(Map<String,dynamic>json){

    return SexualityModel(type: '', isSelected: false);
  }
}