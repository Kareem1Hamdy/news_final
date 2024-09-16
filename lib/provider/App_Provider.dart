import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/Api/api_manager.dart';
import 'package:news_app/Api/model/newsModel.dart';
import 'package:news_app/category/category_screen.dart';
import 'package:news_app/models/category_model.dart';

import '../Api/model/sourcesModel.dart';

class AppProvider extends ChangeNotifier{

  CategoryModel? categoryModel;

  SourcesModel? sourcesModel;

  Widget? selectedScreen=CategoryScreen();
  String appBarTitle='News App';

  List<NewsModel> articlesList=[];

  getScreenAndPutAppBarTitle({required Widget body, required String appBTitle}){
    selectedScreen=body;
    appBarTitle=appBTitle;
    notifyListeners();
  }

  int selectedIndex=0;
  onTabBarFun(index){
    selectedIndex=index;
    notifyListeners();
  }

  getSources(String categoryId)async{
    try{
      var response=await ApiManager.getApi(query: {"category":categoryId}, endPoint: EndPoints.Sources);
      var data=jsonDecode(response.body);
      sourcesModel= SourcesModel.fromJson(data);
      notifyListeners();

    }catch(e){
      print('$e');
    }
  }

  getTopHeadlines(String sources)async{
  try{
    var response=await ApiManager.getApi(query: {"sources":sources,}, endPoint: EndPoints.top_headlines);
    var data= jsonDecode(response.body);
    data['articles'].forEach((element){
      articlesList.add(NewsModel.fromJson(element));
    });

  }catch(e){
    print('error in $e');
  }

  }

}