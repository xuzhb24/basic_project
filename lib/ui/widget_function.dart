import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../func/router_table.dart';

/**
 * 功能性组件
 * WillPopScope：页面拦截
 * Navigator：管理路由
 * MediaQuery：获取设备信息
 * FutureBuilder：执行异步任务
 */

///功能性组件
class WillPopScopePage extends BaseStatelessWidget {
  WillPopScopePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.willPopScope1,
        RouterTable.willPopScope2,
        RouterTable.willPopScope3,
      ],
    );
  }
}

class WillPopScopePage1 extends BaseStatelessWidget {
  WillPopScopePage1({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WillPopScope(
        onWillPop: () async {
          var result = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('你确定要退出吗'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('退出'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('取消'),
                ),
              ],
            ),
          );
          return result!;
        },
        child: Container(
          alignment: Alignment.center,
          child: const Text('点击后退按钮，询问是否退出。'),
        ),
      ),
    );
  }
}

class WillPopScopePage2 extends BaseStatefulWidget {
  WillPopScopePage2({required super.title});

  @override
  State<StatefulWidget> createState() => WillPopScopePage2State();
}

class WillPopScopePage2State extends State<WillPopScopePage2> {
  DateTime? _lastQuitTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_lastQuitTime == null ||
              DateTime.now().difference(_lastQuitTime!).inSeconds > 1) {
            print('再按一次 Back 按钮退出 $_lastQuitTime');
            _lastQuitTime = DateTime.now();
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('再按一次 Back 按钮退出')));
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: const Text('点击后退按钮，询问是否退出。'),
        ),
      ),
    );
  }
}

class WillPopScopePage3 extends BaseStatefulWidget {
  WillPopScopePage3({required super.title});

  @override
  State<StatefulWidget> createState() => WillPopScopePage3State();
}

class WillPopScopePage3State extends State<WillPopScopePage3> {
  GlobalKey<NavigatorState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_key.currentState?.canPop() == true) {
            _key.currentState?.pop();
            return false;
          }
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: Navigator(
                key: _key,
                onGenerateRoute: (settings) =>
                    MaterialPageRoute(builder: (context) => OnePage()),
              ),
            ),
            Container(
              height: 50,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('底部Bar'),
            )
          ],
        ),
      ),
    );
  }
}

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TwoPage()));
            },
            child: const Text('去下一个页面'),
          ),
        ),
      ),
    );
  }
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('这是第二个页面'),
        ),
      ),
    );
  }
}

class NavigatorPage extends BaseStatelessWidget {
  NavigatorPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.navigator1,
        RouterTable.navigator2,
      ],
    );
  }
}

class NavigatorPage1 extends BaseStatelessWidget {
  NavigatorPage1({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 350,
          child: Navigator(
            //initialRoute表示初始化路由
            initialRoute: '/',
            //onGenerateRoute表示根据RouteSettings生成路由
            onGenerateRoute: (settings) {
              WidgetBuilder? builder;
              switch (settings.name) {
                case '/':
                  builder = (context) => NavigatorPage11();
                  break;
              }
              return MaterialPageRoute(builder: builder!);
            },
          ),
        ),
      ),
    );
  }
}

class NavigatorPage11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            _buildItem(Icons.clear, '不感兴趣', '减少这类内容'),
            const Divider(),
            _buildItem(
              Icons.access_alarm,
              '举报',
              '标题夸张，内容质量差 等',
              showArrow: true,
              //NavigatorPage11页面跳转到NavigatorPage12页面
              //实现局部跳转效果，只在中间区域变化，其他区域不变
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NavigatorPage12())),
            ),
            const Divider(),
            _buildItem(Icons.perm_identity, '拉黑作者：新华网客户端', ''),
            const Divider(),
            _buildItem(Icons.account_circle, '屏蔽', '军事视频、驾驶员等'),
          ],
        ),
      ),
    );
  }

  _buildItem(
    IconData iconData,
    String title,
    String content, {
    bool showArrow = false,
    VoidCallback? onPressed,
  }) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18)),
              Text(
                content,
                style: TextStyle(
                    color: Colors.black.withOpacity(.5), fontSize: 14),
              ),
            ],
          ),
        ),
        !showArrow
            ? Container()
            : IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_forward_ios),
                iconSize: 16,
              ),
      ],
    );
  }
}

class NavigatorPage12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 200,
      color: Colors.grey.withOpacity(.5),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                //退出
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const Text('返回'),
              const SizedBox(width: 30),
              const Text('举报'),
            ],
          )
        ],
      ),
    );
  }
}

class NavigatorPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavigatorPage2State();
}

class NavigatorPage2State extends State<NavigatorPage2> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          TabNavigator(0),
          TabNavigator(1),
          TabNavigator(2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '书籍'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '我的'),
        ],
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  TabNavigator(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        WidgetBuilder? builder;
        switch (settings.name) {
          case '/':
            builder = (context) => ListPage(index);
            break;
        }
        return MaterialPageRoute(builder: builder!);
      },
    );
  }
}

class ListPage extends StatelessWidget {
  ListPage(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab内跳转'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('$index'),
          //模拟列表页跳转到详情页
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailPage(index)),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  DetailPage(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('详情页'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('DetailPage $index'),
      ),
    );
  }
}
