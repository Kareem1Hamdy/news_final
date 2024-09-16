import 'package:flutter/material.dart';
import 'package:news_app/category/tabWidget.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/provider/App_Provider.dart';
import 'package:provider/provider.dart';

class Category_details extends StatefulWidget {
   Category_details({super.key});


  @override
  State<Category_details> createState() => _Category_detailsState();
}

class _Category_detailsState extends State<Category_details> {

  // List<NewsModel> newsList=[
  //   NewsModel(image: 'assets/images/NewsTest.png', author: 'BBC News', title: '''Why are football's biggest clubs starting a new\ntournament?''', date: '3 hours ago'),
  //   NewsModel(image: 'assets/images/NewsTest.png', author: 'BBC News', title: '''Why are football's biggest clubs starting a new\ntournament?''', date: '4 hours ago'),
  //   NewsModel(image: 'assets/images/NewsTest.png', author: 'BBC News', title: '''Why are football's biggest clubs starting a new\ntournament?''', date: '5 hours ago'),
  //   NewsModel(image: 'assets/images/NewsTest.png', author: 'BBC News', title: '''Why are football's biggest clubs starting a new\ntournament?''', date: '6 hours ago'),
  //   NewsModel(image: 'assets/images/NewsTest.png', author: 'BBC News', title: '''Why are football's biggest clubs starting a new\ntournament?''', date: '7 hours ago'),
  // ];
  @override
  Widget build(BuildContext context) {

    AppProvider provider=Provider.of<AppProvider>(context);
    return Scaffold(
      body: provider.sourcesModel==null?
      Center(child: CircularProgressIndicator()):Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            DefaultTabController(
              initialIndex: provider.selectedIndex,
              length: provider.sourcesModel!.sources.length,
              child: TabBar(
                indicatorColor: Colors.transparent,
                padding: const EdgeInsets.all(10),
                onTap: (index){
                  provider.onTabBarFun(index);
                  provider.getTopHeadlines(provider.sourcesModel!.sources[index].id!);
                },
                isScrollable: true,
                tabs: provider.sourcesModel!.sources.map((source) => TabWidget(source, provider.sourcesModel!.sources.indexOf(source)==provider.selectedIndex,),).toList(),
              ),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context,index){
                  return News_Item(newsModel: provider.articlesList[index],);
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 15,);
                },
                itemCount: provider.articlesList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
