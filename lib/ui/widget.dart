import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../func/router_table.dart';

/// 组件
class WidgetPage extends StatelessWidget {
  WidgetPage({Key? key}) : super(key: key);

  List<String> items = [
    RouterTable.container,
    RouterTable.box,
    RouterTable.row_column,
    RouterTable.stack,
  ];

  @override
  Widget build(BuildContext context) {
    return ListLayout(title: '组件', items: items);
  }
}
