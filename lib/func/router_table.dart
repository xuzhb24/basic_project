import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/widget_container.dart';

///页面跳转管理
class RouterTable {
  static String notFound = '404'; //404页面，缺省页
  static String container = 'Container';
  static String box = 'Box';
  static String row_column = 'Row&Column';
  static String stack = 'Stack';
  static String wrap = 'Wrap';
  static String customScrollView = 'CustomScrollView';
  static String nestedScrollView = 'NestedScrollView';
  static String nestedScrollView1 = '滚动隐藏AppBar';
  static String nestedScrollView2 = 'SliverAppBar展开折叠';
  static String nestedScrollView3 = '与TabBar配合使用';
  static String sliverAppBar = 'SliverAppBar';
  static String tabBar = 'TabBar';
  static String pageView = 'PageView';
  static String pageView1 = '基础用法';
  static String pageView2 = '无限滚动';
  static String pageView3 = '实现指示器';
  static String pageView4 = '切换动画';
  static String listView = 'ListView';
  static String listView1 = '数据较少时一次加载';
  static String listView2 = 'ListView.builder';
  static String listView3 = 'ListView.separated';

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
        NestedScrollViewPage1(title: nestedScrollView1),
    nestedScrollView2: (context) =>
        NestedScrollViewPage2(title: nestedScrollView2),
    // nestedScrollView3: (context) => NestedScrollViewPage3(title: '与TabBar配合使用'),
    sliverAppBar: (context) => SliverAppBarPage(title: sliverAppBar),
    tabBar: (context) => TabBarPage(title: tabBar),
    pageView: (context) => PageViewPage(title: pageView),
    pageView1: (context) => PageViewPage1(title: pageView1),
    pageView2: (context) => PageViewPage2(title: pageView2),
    pageView3: (context) => PageViewPage3(title: pageView3),
    pageView4: (context) => PageViewPage4(title: pageView4),
    listView: (context) => ListViewPage(title: listView),
    listView1: (context) => ListViewPage1(title: listView1),
    listView2: (context) => ListViewPage2(title: listView2),
    listView3: (context) => ListViewPage3(title: listView3),
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
