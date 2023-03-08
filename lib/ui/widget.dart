import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../func/router_table.dart';

/// 组件
class WidgetPage extends StatelessWidget {
  WidgetPage({Key? key}) : super(key: key);

  List<String> widgetList = [
    '文本组件',
    RouterTable.text,
    RouterTable.richText,
    RouterTable.textField,
    '基础组件',
    RouterTable.button,
    RouterTable.form,
    '布局组件',
    RouterTable.row_column,
    RouterTable.stack,
    RouterTable.wrap,
    '定位装饰权重组件',
    RouterTable.container,
    RouterTable.box,
    '手势识别组件',
    RouterTable.inkWell,
    '滚动和大数据组件',
    RouterTable.listView,
    RouterTable.pageView,
    RouterTable.dataTable,
    'Sliver系列组件',
    RouterTable.sliverAppBar,
    RouterTable.customScrollView,
    RouterTable.nestedScrollView,
    '功能型组件',
    RouterTable.dateTime,
    RouterTable.dialog,
    RouterTable.draggable,
    RouterTable.willPopScope,
    RouterTable.navigator,
    RouterTable.futureBuilder,
    'App级别组件',
    RouterTable.appBar,
    RouterTable.tabBar,
    RouterTable.bottomNavigationBar,
    '动画组件',
    RouterTable.animatedList,
    '其他组件',
    RouterTable.chip,
    RouterTable.opacity,
    RouterTable.customPaint,
    RouterTable.reorderableListView,
    RouterTable.expansionPanelList,
    RouterTable.mergeableMaterial,
  ];

  @override
  Widget build(BuildContext context) {
    return ListLayout(title: '组件', widgetList: widgetList);
  }
}
