import 'dart:math';

import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

///布局组件实战
class LayoutPracticePage extends BaseStatelessWidget {
  LayoutPracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.layoutPractice1,
        RouterTable.layoutPractice2,
        RouterTable.layoutPractice3,
      ],
    );
  }
}

class LayoutPracticePage1 extends BaseStatelessWidget {
  LayoutPracticePage1({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: const [
          SettingItem(
            iconData: Icons.notifications,
            iconColor: Colors.blue,
            title: '消息中心',
            suffix: NotificationsText(
              text: '2',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.thumb_up,
            iconColor: Colors.green,
            title: '我赞过的',
            suffix: NotificationsText(
              text: '121篇',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.grade,
            iconColor: Colors.yellow,
            title: '收藏集',
            suffix: NotificationsText(
              text: '2个',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.shopping_basket,
            iconColor: Colors.yellow,
            title: '已购小册',
            suffix: NotificationsText(
              text: '100个',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.account_balance_wallet,
            iconColor: Colors.blue,
            title: '我的钱包',
            suffix: NotificationsText(
              text: '10万',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.location_on,
            iconColor: Colors.grey,
            title: '阅读过的文章',
            suffix: NotificationsText(
              text: '1034篇',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.local_offer,
            iconColor: Colors.grey,
            title: '标签管理',
            suffix: NotificationsText(
              text: '27个',
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem(
      {Key? key,
      required this.iconData,
      required this.iconColor,
      required this.title,
      required this.suffix})
      : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        children: [
          const SizedBox(width: 30),
          Icon(iconData, color: iconColor),
          const SizedBox(width: 30),
          Expanded(child: Text(title)),
          suffix,
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}

class NotificationsText extends StatelessWidget {
  const NotificationsText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.red,
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

class Suffix extends StatelessWidget {
  const Suffix({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.grey.withOpacity(.5)));
  }
}

class LayoutPracticePage2 extends BaseStatefulWidget {
  LayoutPracticePage2({required super.title});

  @override
  State<StatefulWidget> createState() => LayoutPracticePage2State();
}

class LayoutPracticePage2State extends State<LayoutPracticePage2>
    with SingleTickerProviderStateMixin {
  AnimationController? _controler;
  IconData _lastTapped = Icons.notifications;
  final List<IconData> _menuItems = [
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData iconData) {
    if (iconData != Icons.menu) {
      setState(() {
        _lastTapped = iconData;
      });
    } else {
      //展开和收拢的效果
      _controler?.status == AnimationStatus.completed
          ? _controler?.reverse()
          : _controler?.forward();
    }
  }

  //生成Popmenu数据
  Widget _buildFlowMenuItem(IconData iconData) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width * 2 / (_menuItems.length * 3);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: RawMaterialButton(
        fillColor: _lastTapped == iconData ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(iconData);
        },
        child: Icon(iconData, color: Colors.white, size: 30),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //必须初始化动画变量
    _controler = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controler?.dispose(); //销毁变量,释放资源
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Flow(
          delegate: FlowMenuDelegate(animation: _controler!),
          children: _menuItems.map((e) => _buildFlowMenuItem(e)).toList(),
        ),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0; //起始位置
    double y = 50.0; //横向展开,y不变
    for (int i = 0; i < context.childCount; ++i) {
      var child = context.getChildSize(i);
      if (child != null) {
        x = child.width * i * animation.value;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowMenuDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}

class LayoutPracticePage3 extends BaseStatefulWidget {
  LayoutPracticePage3({required super.title});

  @override
  State<StatefulWidget> createState() => LayoutPracticePage3State();
}

class LayoutPracticePage3State extends State<LayoutPracticePage3>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        lowerBound: 0,
        upperBound: 80,
        duration: const Duration(milliseconds: 300),
        vsync: this);
    _controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Flow(
              delegate: FlowCircleDelegate(_controller!.value),
              children: List.generate(
                5,
                (index) => Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Icon(index.isEven ? Icons.timer : Icons.ac_unit),
                ),
              ),
            ),
          ),
          Positioned.fill(
              child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              setState(() {
                _controller?.status == AnimationStatus.completed
                    ? _controller?.reverse()
                    : _controller?.forward();
              });
            },
          ))
        ],
      ),
    );
  }
}

class FlowCircleDelegate extends FlowDelegate {
  final double radius;

  FlowCircleDelegate(this.radius);

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius == 0) {
      return;
    }
    //开始(0,0)在父组件的中心
    double x = 0;
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1));
      y = radius * sin(i * pi / (context.childCount - 1));
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
