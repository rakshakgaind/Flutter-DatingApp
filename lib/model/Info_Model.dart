class InfoModel{
  String infoType="";
  String infoValue="";
  bool isSelected=false;
  InfoModel({required this.infoType,required this.infoValue,required this.isSelected});
  
  factory InfoModel.fromJson(Map<String,dynamic>json){
    return InfoModel(infoType: '', infoValue: '', isSelected: false,
    
    );
    
  }
  
  
}