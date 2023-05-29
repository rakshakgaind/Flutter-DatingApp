class EducationModel{
  String educationType="";
  bool isSelected=false;
  EducationModel({required this.educationType,required this.isSelected});

  factory EducationModel.fromJson(Map<String,dynamic>json){
    return  EducationModel(educationType: '', isSelected: false);
  }

}