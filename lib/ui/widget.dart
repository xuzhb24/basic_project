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
    RouterTable.radio,
    RouterTable.checkbox,
    RouterTable.slider,
    RouterTable.Switch,
    RouterTable.progressIndicator,
    RouterTable.image_icon,
    '布局组件',
    RouterTable.row_column,
    RouterTable.stack,
    RouterTable.wrap,
    RouterTable.flow,
    '定位装饰权重组件',
    RouterTable.container,
    RouterTable.sizedBox,
    RouterTable.aspectRatio,
    RouterTable.fractionallySizedBox,
    RouterTable.expanded_flexible_spacer,
    RouterTable.box,
    '手势识别组件',
    RouterTable.gestureDetector,
    RouterTable.inkWell,
    RouterTable.listener,
    '滚动和大数据组件',
    RouterTable.listView,
    RouterTable.gridView,
    RouterTable.singleChildScrollView,
    RouterTable.pageView,
    RouterTable.dataTable,
    'Sliver系列组件',
    RouterTable.sliverList,
    RouterTable.sliverGrid,
    RouterTable.sliverAppBar,
    RouterTable.sliverPersistentHeader,
    RouterTable.sliverToBoxAdapter,
    RouterTable.customScrollView,
    RouterTable.nestedScrollView,
    '功能型组件',
    RouterTable.dateTime,
    RouterTable.dialog,
    RouterTable.shape,
    RouterTable.draggable,
    RouterTable.interactiveViewer,
    RouterTable.willPopScope,
    RouterTable.navigator,
    RouterTable.futureBuilder,
    'App级别组件',
    RouterTable.scaffold,
    RouterTable.appBar,
    RouterTable.tabBar,
    RouterTable.drawer,
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
