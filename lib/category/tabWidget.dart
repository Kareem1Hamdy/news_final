import 'package:flutter/material.dart';
import 'package:news_app/colors/colors.dart';
import '../Api/model/sourceModel.dart';

class TabWidget extends StatelessWidget {
   TabWidget(this.sourceModel,this.isTabSelected,{super.key});

  SourceModel sourceModel;
  bool isTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:Border.all(
            width: 2,
            color: AppColors.primaryColor,
          ),
          color: isTabSelected? AppColors.primaryColor:Colors.white,
        ),
        child: Tab(child: Text(
            '${sourceModel.name}',
          style: TextStyle(
            color: isTabSelected?Colors.white:AppColors.primaryColor,
          ),
        ),
        )
    );
  }
}
