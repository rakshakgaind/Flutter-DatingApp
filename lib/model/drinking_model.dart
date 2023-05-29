class DrinkingModel{
  String drinkType="";
  bool isSelected=false;
  DrinkingModel({required this.drinkType,required this.isSelected});

  factory DrinkingModel.fromJson(Map<String,dynamic>json){
    return  DrinkingModel(drinkType: '', isSelected: false);
  }

}

class SmokingModel{
  String smokeType="";
  bool isSelected=false;
  SmokingModel({required this.smokeType,required this.isSelected});

  factory SmokingModel.fromJson(Map<String,dynamic>json){
    return  SmokingModel(smokeType: '', isSelected: false);
  }

}

class EatingModel{
  String eatType="";
  bool isSelected=false;
  EatingModel({required this.eatType,required this.isSelected});

  factory EatingModel.fromJson(Map<String,dynamic>json){
    return  EatingModel(eatType: '', isSelected: false);
  }

}