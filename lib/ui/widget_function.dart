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
