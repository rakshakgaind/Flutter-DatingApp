class SeekersModel{
  String seekersName="";
  bool isSelected=false;
  String image="";
  SeekersModel({required this.isSelected,required this.image,required this.seekersName});
  factory SeekersModel.fromJson(Map<String,dynamic>json){
    return SeekersModel(isSelected: false, image: "", seekersName: "");
  }
}