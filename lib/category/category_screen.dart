import 'package:flutter/material.dart';
import 'package:news_app/Api/model/sourceModel.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});

  List<CategoryModel> categoryList=
  [
    CategoryModel(id: 'sports',image: 'assets/images/ball.png',title: 'Sports',color: const Color(0xffC91C22)),
    CategoryModel(id: 'general',image: 'assets/images/Politics.png',title: 'General',color: const Color(0xff003E90)),
    CategoryModel(id: 'health',image: 'assets/images/health.png',title: 'Health',color: const Color(0xffED1E79)),
    CategoryModel(id: 'business',image: 'assets/images/bussines.png',title: 'Business',color: const Color(0xffCF7E48)),
    CategoryModel(id: 'technology',image: 'assets/images/environment.png',title: 'Technology',color: const Color(0xff4882CF)),
    CategoryModel(id: 'science',image: 'assets/images/science.png',title: 'Science',color: const Color(0xffF2D352)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                '''Pick your \ncategory of interest''',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 25,),
            Expanded(
              child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 20,
                  ),
                itemBuilder: (context,index){
                  return Category_item(categoryModel: categoryList[index], index: index);
                },
                itemCount: categoryList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
