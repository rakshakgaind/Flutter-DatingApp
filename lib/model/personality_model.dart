class PersonalityModel{

  String personalityType="";
  bool isSelected=false;
  PersonalityModel({required this.personalityType,required this.isSelected});

  factory PersonalityModel.fromJson(Map<String,dynamic>json){

    return PersonalityModel(personalityType: '', isSelected: false);
  }
}