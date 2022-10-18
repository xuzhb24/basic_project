import 'package:basic_project/func/util.dart';
import 'package:flutter/material.dart';

/// 实战

class PracticePage extends StatelessWidget {
  PracticePage({Key? key}) : super(key: key);

  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Util.buildListWidget(title: '实战', items: items);
  }
}
