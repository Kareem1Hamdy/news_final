class SourceModel{
  String? id;
  String? name;

  SourceModel.fromJson(Map<String,dynamic> data){
    id=data['id'];
    name=data['name'];
  }
}