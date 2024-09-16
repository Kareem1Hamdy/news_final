import 'package:flutter/material.dart';

import '../Api/model/newsModel.dart';

class News_Item extends StatelessWidget {
   News_Item({required this.newsModel,super.key});

   NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    '${newsModel.urlToImage}',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )
            ),
            Text(
              '${newsModel.author}',
              textAlign: TextAlign.start,
            ),
            Text(
                '${newsModel.title}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
            ),
            Text(
                '${newsModel.publishedAt}',
               textAlign: TextAlign.end,
               style: TextStyle(
                 fontSize: 13,
                 fontWeight: FontWeight.w400,
                 color: Colors.grey,
             ),
            ),
          ],
        ),
    );
  }
}
