import 'package:flutter/material.dart';

import '../../func/router_table.dart';
import '../base.dart';

///App级别组件
class ScaffoldPage extends BaseStatelessWidget {
  ScaffoldPage({required super.title});

  @override
  Widget build(BuildContext context) {
    //Scaffold实现了Material风格的基本布局结构，它提供了展示drawers、snack bars和bottom sheets的功能。
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //drawer和endDrawer分别表示从左边和右边出现的抽屉式控件
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      body: const Center(
        child: Text('Scaffold'),
      ),
      //bottomNavigationBar表示底部导航
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '我的'),
        ],
      ),
      //floatingActionButton默认位于右下角，
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      //改变其位置，设置按钮嵌入底部导航栏
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //persistentFooterButtons位于body之下，bottomNavigationBar之上，不会随着body滚动而滚动
      persistentFooterButtons: [
        TextButton(onPressed: () {}, child: const Text('TextButton')),
        TextButton(onPressed: () {}, child: const Text('TextButton')),
        TextButton(onPressed: () {}, child: const Text('TextButton')),
      ],
      bottomSheet: BottomSheet(
        onClosing: () {},
        backgroundColor: Colors.lightBlue,
        builder: (context) => Container(
          height: 150,
          alignment: Alignment.center,
          child: const Text('BottomSheet'),
        ),
      ),
    );
  }
}

class AppBarPage extends BaseStatefulWidget {
  AppBarPage({required super.title});

  @override
  State<StatefulWidget> createState() => AppBarPageState();
}

class AppBarPageState extends State<AppBarPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      centerContent: true,
      children: [
        _buildItem(
          context,
          'leading：设置返回按钮',
          Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: const Text('leading'),
            ),
          ),
        ),
        _buildItem(
          context,
          'drawer：左侧抽屉',
          Scaffold(
            appBar: AppBar(
              title: const Text('drawer'),
            ),
            drawer: const Drawer(),
          ),
        ),
        _buildItem(
          context,
          '默认显示返回图标',
          Scaffold(
            appBar: AppBar(
              title: const Text('默认返回图标'),
            ),
          ),
        ),
        _buildItem(
          context,
          'automaticallyImplyLeading：不自动设置控件',
          Scaffold(
            appBar: AppBar(
              title: const Text('automaticallyImplyLeading'),
              automaticallyImplyLeading: false,
            ),
          ),
        ),
        _buildItem(
          context,
          '标题居中显示',
          Scaffold(
            appBar: AppBar(
              title: const Text('标题居中显示'),
              centerTitle: true,
            ),
          ),
        ),
        _buildItem(
          context,
          'actions：右侧图标',
          Scaffold(
            appBar: AppBar(
              title: const Text('actions'),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
          ),
        ),
        _buildItem(
          context,
          'bottom：设置TabBar',
          Scaffold(
            appBar: AppBar(
              title: const Text('bottom'),
              bottom: TabBar(
                tabs: const [
                  Text('语文'),
                  Text('数学'),
                  Text('英语'),
                  Text('体育'),
                  Text('音乐'),
                ],
                controller: TabController(length: 5, vsync: this),
                isScrollable: true,
              ),
            ),
          ),
        ),
        _buildItem(
          context,
          'elevation | shape | backgroundColor：设置阴影、形状、背景颜色',
          Scaffold(
            appBar: AppBar(
              title: const Text('elevation | shape | backgroundColor'),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        _buildItem(
          context,
          'iconTheme | actionsIconTheme | titleTextStyle：设置icon样式及文字样式',
          Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(size: 50, color: Colors.white),
              actionsIconTheme:
                  const IconThemeData(size: 50, color: Colors.white),
              titleTextStyle: const TextStyle(color: Colors.red, fontSize: 18),
              title:
                  const Text('iconTheme | actionsIconTheme | titleTextStyle'),
              actions: const [Icon(Icons.add)],
            ),
          ),
        ),
      ],
    );
  }

  _buildItem(BuildContext context, String title, Widget widget) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ElevatedButton(
        onPressed: () {
          navigatorToPage(context, (context) => widget);
        },
        child: Text(
          title,
          style: const TextStyle(height: 1.2), //height：行间距
        ),
      ),
    );
  }
}

class TabBarPage extends BaseStatefulWidget {
  TabBarPage({required super.title});

  @override
  State<StatefulWidget> createState() => TabBarPageState();
}

class TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  final List<String> _tabValues = [
    '语文',
    '英语',
    '化学',
    '物理',
    '数学',
    '生物',
    '体育',
    '经济',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabValues.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    /**
     * TabBar属性：
     * tabs               	一系列标签控件
     * controller         	标签选择变化控制器
     * isScrollable       	是否可滚动，默认false
     * indicatorColor     	指示器颜色
     * indicatorWeight    	指示器粗细
     * indicator	          指示器，可自定义形状等样式
     * indicatorSize	      指示器长短，tab：和tab一样长，label：和标签label 一样长
     * labelColor         	标签颜色
     * labelStyle	          标签样式
     * labelPadding       	标签padding
     * unselectedLabelColor	未选中标签颜色
     * unselectedLabelStyle	未选中标签样式
     *
     * TabBarView属性：
     * children	  一系列子控件，如果和TabBar一起使用注意和TabBar的长度一样
     * controller	控制器，如果和TabBar一起使用注意和TabBar使用同一个controller
     */
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: TabBar(
          tabs: _tabValues.map((e) => Text(e)).toList(),
          controller: _controller,
          isScrollable: true,
          indicatorColor: Colors.red,
          indicatorWeight: 3.0,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.red,
          labelStyle: const TextStyle(fontSize: 16, height: 2),
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          unselectedLabelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues
            .map((e) => Center(
                child: Text(e,
                    style: const TextStyle(color: Colors.black, fontSize: 20))))
            .toList(),
      ),
    );
  }
}

class BottomNavigationBarPage extends BaseStatelessWidget {
  BottomNavigationBarPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.bottomNavigationBar1,
        RouterTable.bottomNavigationBar2,
      ],
    );
  }
}

class BottomNavigationBarPageX extends BaseStatefulWidget {
  BottomNavigationBarPageX({required super.title, required this.type});

  final BottomNavigationBarType type;

  @override
  State<StatefulWidget> createState() => BottomNavigationBarPageXState();
}

class BottomNavigationBarPageXState extends State<BottomNavigationBarPageX> {
  int _curIndex = 0;
  Widget? _curBody;

  @override
  void initState() {
    super.initState();
    _curBody = HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _curBody,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        //BottomNavigationBar有2种显示模式：fixed、shifting
        type: widget.type,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _curIndex,
        //背景颜色
        backgroundColor: Colors.white,
        //图标大小
        iconSize: 20,
        selectedFontSize: 12,
        unselectedFontSize: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '书籍'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '我的'),
        ],
      ),
    );
  }

  _onTap(int index) {
    switch (index) {
      case 0:
        _curBody = HomePage();
        break;
      case 1:
        _curBody = BookPage();
        break;
      case 2:
        _curBody = MyPage();
        break;
    }
    setState(() {
      _curIndex = index;
    });
  }

  HomePage() => Container(color: Colors.red);

  BookPage() => Container(color: Colors.green);

  MyPage() => Container(color: Colors.yellow);
}

class DrawerPage extends BaseStatelessWidget {
  DrawerPage({required super.title});

  @override
  Widget build(BuildContext context) {
    //Drawer是一个抽屉导航组件，导航一般使用底部导航BottomNavigationBar或者抽屉导航。
    //Drawer一般和Scaffold组合使用
    return Scaffold(
      //如果设置了AppBar，而没有设置AppBar的leading属性，在AppBar的左侧默认出现抽屉的图标，
      //可以通过点击这个抽屉图标或者从屏幕左侧向右侧滑动打开抽屉
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      drawer: Drawer(
        //Drawer里面可以放置任何组件，但是一般使用ListView，分为DrawerHeader和ListTiles
        child: ListView(
          children: [
            const ListTile(title: Text('选项一')),
            const ListTile(title: Text('选项二')),
            const ListTile(title: Text('选项三')),
            const ListTile(title: Text('选项四')),
            const ListTile(title: Text('选项五')),
            const ListTile(title: Text('选项六')),
            Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('隐藏Drawer'),
              ),
            ),
          ],
        ),
      ),
      //也可以设置Scaffold的endDrawer属性，在右侧显示一个Drawer
      endDrawer: const Drawer(),
      body: Center(
        child: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Text('弹出Drawer'),
          ),
        ),
      ),
    );
  }
}

class SnackBarPage extends BaseStatelessWidget {
  SnackBarPage({required super.title});

  _buildButton(String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        _buildButton('基础用法', () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('SnackBar')));
        }),
        _buildButton('设置背景和形状', () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('SnackBar'),
            backgroundColor: Colors.blue,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ));
        }),
        _buildButton('设置content为组件', () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Row(
            children: const [
              Icon(Icons.check, color: Colors.green),
              SizedBox(width: 10),
              Text('下载成功')
            ],
          )));
        }),
        //设置显示时间，默认是4秒
        _buildButton('设置显示时间', () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('SnackBar'),
            duration: Duration(seconds: 2),
          ));
        }),
        //SnackBar的有2种弹出形式，默认是fixed，直接在底部弹出，另一种是floating,悬浮在底部
        _buildButton('设置悬浮在底部', () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: const [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Text('下载成功')
              ],
            ),
            behavior: SnackBarBehavior.floating,
          ));
        }),
        _buildButton('SnackBarAction', () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('SnackBar'),
            action: SnackBarAction(
              label: '确定',
              onPressed: () {
                print('确定');
              },
            ),
          ));
        }),
        //当短时间内多次调用SnackBar方法时，SnackBar消息将会以队列的形式一个一个的弹出
        _buildButton('短时间内弹出多个', () {
          List.generate(
              10,
              (index) => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('我是第${index + 1}条消息'))));
        }),
        _buildButton('移除SnackBar', () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        })
      ],
    );
  }
}
