class MaritalModel{
  String status="";
  bool isSelected=false;
  MaritalModel({required this.status,required this.isSelected});

  factory MaritalModel.fromJson(Map<String,dynamic>json){
    return  MaritalModel(status: '', isSelected: false);
  }

}