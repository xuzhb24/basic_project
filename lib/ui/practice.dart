import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

/// 实战

class PracticePage extends StatelessWidget {
  PracticePage({Key? key}) : super(key: key);

  List<String> practiceList = [
    RouterTable.textPractice,
    RouterTable.basicPractice,
    RouterTable.layoutPractice,
    RouterTable.boxPractice,
    RouterTable.gesturePractice,
    RouterTable.scrollPractice,
    RouterTable.animPractice,
    RouterTable.dataHttpPractice,
  ];

  @override
  Widget build(BuildContext context) {
    return ListLayout(title: '实战', widgetList: practiceList);
  }
}
