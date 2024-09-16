import 'package:flutter/material.dart';
import 'package:news_app/category/category_screen.dart';
import 'package:news_app/provider/App_Provider.dart';
import 'package:news_app/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    AppProvider provider=Provider.of<AppProvider>(context);

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Color(0xff39A552),
              child: Center(
                  child: Text(
                    'News App!',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                  provider.getScreenAndPutAppBarTitle(body:CategoryScreen(), appBTitle: 'News App');
                  Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu_open_sharp,
                      size: 30,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

                  provider.getScreenAndPutAppBarTitle(body:SettingsScreen(), appBTitle: 'News App');
                  Navigator.pop(context);

              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(provider.appBarTitle),
      ),
      body: provider.selectedScreen,
    );
  }
}
