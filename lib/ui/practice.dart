import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

/// 实战

class PracticePage extends StatelessWidget {
  PracticePage({Key? key}) : super(key: key);

  List<String> widgetList = [];

  @override
  Widget build(BuildContext context) {
    return ListLayout(title: '实战', widgetList: widgetList);
  }
}
