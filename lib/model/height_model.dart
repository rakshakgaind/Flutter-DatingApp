class HeightModel{
  String inches="";
  String cm="";
  bool isSelected=false;
  HeightModel({
     required this.cm, required this.inches,
    required this.isSelected
});

  factory HeightModel.fromJson(Map<String,dynamic>json){

    return HeightModel(cm: '', inches: '', isSelected: false);

  }


}