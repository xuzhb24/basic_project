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

  static Map<String, WidgetBuilder> routerTables = {
    notFound: (context) => const NotFoundPage(),
    container: (context) => ContainerPage(title: container),
    box: (context) => BoxPage(title: box),
    row_column: (context) => RowColumnPage(title: row_column),
    stack: (context) => StackPage(title: stack),
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
