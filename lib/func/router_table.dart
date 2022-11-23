import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/widget_container.dart';
import '../ui/widget_element.dart';

///页面跳转管理
class RouterTable {
  static String div = '\$';
  static String notFound = '404'; //404页面，缺省页
  static String container = 'Container';
  static String box = 'Box';
  static String row_column = 'Row&Column';
  static String stack = 'Stack';
  static String wrap = 'Wrap';
  static String customScrollView = 'CustomScrollView';
  static String nestedScrollView = 'NestedScrollView';
  static String nestedScrollView1 = 'NestedScrollView$div滚动隐藏AppBar';
  static String nestedScrollView2 = 'NestedScrollView${div}SliverAppBar展开折叠';
  static String nestedScrollView3 = 'NestedScrollView$div与TabBar配合使用';
  static String sliverAppBar = 'SliverAppBar';
  static String tabBar = 'TabBar';
  static String pageView = 'PageView';
  static String pageView1 = 'PageView$div基础用法';
  static String pageView2 = 'PageView$div无限滚动';
  static String pageView3 = 'PageView$div实现指示器';
  static String pageView4 = 'PageView$div切换动画';
  static String listView = 'ListView';
  static String listView1 = 'ListView$div数据较少时一次加载';
  static String listView2 = 'ListView${div}ListView.builder';
  static String listView3 = 'ListView${div}ListView.separated';
  static String reorderableListView = 'ReorderableListView';
  static String expansionPanelList = 'ExpansionPanelList';
  static String mergeableMaterial = 'MergeableMaterial';
  static String mergeableMaterial1 = 'MergeableMaterial$div基础用法';
  static String mergeableMaterial2 =
      'MergeableMaterial$div实现ExpansionPanelList效果';
  static String appBar = 'AppBar';
  static String bottomNavigationBar = 'BottomNavigationBar';
  static String bottomNavigationBar1 = 'BottomNavigationBar${div}fixed';
  static String bottomNavigationBar2 = 'BottomNavigationBar${div}shifting';
  static String button = 'Button';
  static String form = 'Form';
  static String chip = 'Chip';

  static Map<String, WidgetBuilder> routerTables = {
    notFound: (context) => const NotFoundPage(),
    container: (context) => ContainerPage(title: container),
    box: (context) => BoxPage(title: box),
    row_column: (context) => RowColumnPage(title: row_column),
    stack: (context) => StackPage(title: stack),
    wrap: (context) => WrapPage(title: wrap),
    customScrollView: (context) =>
        CustomScrollViewPage(title: customScrollView),
    nestedScrollView: (context) =>
        NestedScrollViewPage(title: nestedScrollView),
    nestedScrollView1: (context) =>
        NestedScrollViewPage1(title: pickTitle(nestedScrollView1)),
    nestedScrollView2: (context) =>
        NestedScrollViewPage2(title: pickTitle(nestedScrollView1)),
    // nestedScrollView3: (context) => NestedScrollViewPage3(title: '与TabBar配合使用'),
    sliverAppBar: (context) => SliverAppBarPage(title: sliverAppBar),
    tabBar: (context) => TabBarPage(title: tabBar),
    pageView: (context) => PageViewPage(title: pageView),
    pageView1: (context) => PageViewPage1(title: pickTitle(pageView1)),
    pageView2: (context) => PageViewPage2(title: pickTitle(pageView2)),
    pageView3: (context) => PageViewPage3(title: pickTitle(pageView3)),
    pageView4: (context) => PageViewPage4(title: pickTitle(pageView4)),
    listView: (context) => ListViewPage(title: listView),
    listView1: (context) => ListViewPage1(title: pickTitle(listView1)),
    listView2: (context) => ListViewPage2(title: pickTitle(listView2)),
    listView3: (context) => ListViewPage3(title: pickTitle(listView3)),
    reorderableListView: (context) =>
        ReorderableListViewPage(title: reorderableListView),
    expansionPanelList: (context) =>
        ExpansionPanelListPage(title: expansionPanelList),
    mergeableMaterial: (context) =>
        MergeableMaterialPage(title: mergeableMaterial),
    mergeableMaterial1: (context) =>
        MergeableMaterialPage1(title: pickTitle(mergeableMaterial1)),
    mergeableMaterial2: (context) =>
        MergeableMaterialPage2(title: pickTitle(mergeableMaterial2)),
    appBar: (context) => AppBarPage(title: appBar),
    bottomNavigationBar: (context) =>
        BottomNavigationBarPage(title: bottomNavigationBar),
    bottomNavigationBar1: (context) => BottomNavigationBarPageX(
        title: bottomNavigationBar, type: BottomNavigationBarType.fixed),
    bottomNavigationBar2: (context) => BottomNavigationBarPageX(
        title: bottomNavigationBar, type: BottomNavigationBarType.shifting),
    button: (context) => ButtonPage(title: button),
    form: (context) => FormPage(title: form),
    chip: (context) => ChipPage(title: chip),
  };

  ///路由拦截
  static Route onGenerateRoute<T extends Object>(RouteSettings settings) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (routerTables[name] == null) {
          name = notFound;
        }
        return routerTables[name]!(context);
      },
    );
  }

  ///提取字符串中$后面的字符，如PageView$基础用法只会显示基础用法
  static String pickTitle(String text) {
    if (text.contains(div)) {
      return text.substring(text.indexOf(div) + 1);
    }
    return text;
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: const Center(
          child: Text(
            '页面找不到啦！',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
