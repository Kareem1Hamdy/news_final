import 'package:news_app/Api/model/sourceModel.dart';

class SourcesModel{
 String? status;
 List<SourceModel> sources=[];

 SourcesModel.fromJson(Map<String,dynamic> data){
  status=data['status'];
  data['sources'].forEach((element){
   sources.add(SourceModel.fromJson(element));
  });
 }

}