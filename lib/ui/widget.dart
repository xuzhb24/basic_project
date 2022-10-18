import 'package:basic_project/func/util.dart';
import 'package:flutter/material.dart';

import '../func/router_table.dart';

/// 组件
class WidgetPage extends StatelessWidget {
  WidgetPage({Key? key}) : super(key: key);

  List<String> items = [
    RouterTable.container,
  ];

  @override
  Widget build(BuildContext context) {
    return Util.buildListWidget(title: '组件', items: items);
  }
}
