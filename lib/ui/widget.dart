import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../func/router_table.dart';

/// 组件
class WidgetPage extends StatelessWidget {
  WidgetPage({Key? key}) : super(key: key);

  List<String> widgetList = [
    '容器类组件',
    RouterTable.container,
    RouterTable.box,
    RouterTable.row_column,
    RouterTable.stack,
    RouterTable.wrap,
    RouterTable.customScrollView,
    RouterTable.nestedScrollView,
    RouterTable.sliverAppBar,
    RouterTable.tabBar,
    RouterTable.pageView,
    RouterTable.listView,
    RouterTable.reorderableListView,
    RouterTable.expansionPanelList,
    RouterTable.mergeableMaterial,
    '元素类组件',
    RouterTable.appBar,
    RouterTable.bottomNavigationBar,
    RouterTable.button,
    RouterTable.form,
    RouterTable.chip,
    RouterTable.inkWell,
    RouterTable.customPaint,
    '功能性组件',
  ];

  @override
  Widget build(BuildContext context) {
    return ListLayout(title: '组件', widgetList: widgetList);
  }
}
