import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

/**
 * 元素类组件合集
 * AppBar：标题栏
 * BottomNavigatorBar：底部导航栏
 * Text：文本
 * ElevatedButton：按钮，下同
 * TextButton
 * OutlineButton
 * DropdownButton
 * RawMaterialButton
 * PopupMenuButton
 * IconButton
 * BackButton
 * CloseButton
 * ButtonBar
 * ToggleButtons
 * Form/FormField/TextFormField：文本输入框，下同
 * RawChip：标签，下同
 * Chip
 * InputChip
 * ChoiceChip
 * FilterChip
 * ActionChip
 * Ink/InkWell：按钮，下同
 * CustomPaint：自定义绘制组件
 * ClipRect：裁剪类组件，下同
 * ClipRRect
 * ClipOval
 * ClipPath
 * CustomClipper
 * AnimatedList：列表动画
 * AlertDialog：对话框，下同
 * CupertinoAlertDialog
 * SimpleDialog
 * Dialog
 * CalendarDatePicker：日期类组件，下同
 * showDatePicker
 * CupertinoDatePicker
 * showTimePicker
 * CupertinoTimerPicker
 * Opacity/AnimatedOpacity：占位
 * DataTable：表格控件
 * Draggable：拖动组件
 * WillPopScope：页面拦截
 * Navigator：管理路由
 * MediaQuery：获取设备信息
 * FutureBuilder：执行异步任务
 */

///元素类组件
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
