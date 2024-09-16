import 'package:flutter/material.dart';
import 'package:news_app/Api/model/sourcesModel.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/provider/App_Provider.dart';
import 'package:provider/provider.dart';

import '../Api/model/sourceModel.dart';
class Category_item extends StatelessWidget {
   Category_item({
     required this.categoryModel,
     required this.index,
     super.key});


  CategoryModel categoryModel;
  int index;


  @override
  Widget build(BuildContext context) {
    AppProvider provider=Provider.of<AppProvider>(context);

    return GestureDetector(
      onTap: (){
        provider.getScreenAndPutAppBarTitle(body:Category_details(), appBTitle: categoryModel.title!);
        provider.getSources(categoryModel.id!);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(35),
            topLeft: const Radius.circular(35),
            bottomRight: Radius.circular(index.isEven?0:35),
            bottomLeft: Radius.circular(index.isEven?35:0),
          )
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Image.asset('${categoryModel.image}',),
             Text(
                 '${categoryModel.title}',
               style: const TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.w400,
                 color: Colors.white,
               ),
             ),
            ],
          ),
      ),
    );
  }
}
