import 'package:flutter/material.dart';

import '../../func/router_table.dart';
import '../base.dart';

///滚动和大数据组件
class ListViewPage extends BaseStatelessWidget {
  ListViewPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.listView1,
        RouterTable.listView2,
        RouterTable.listView3,
      ],
    );
  }
}

class ListViewPage1 extends BaseStatelessWidget {
  ListViewPage1({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildItem('Item1'),
          _buildItem('Item2', color: Colors.red, height: 100),
          _buildItem('Item3'),
          _buildItem('Item4'),
          _buildItem('Item5'),
          _buildItem('Item6', color: Colors.yellow, height: 120),
        ],
      ),
    );
  }

  _buildItem(
    String txt, {
    Color color = Colors.transparent,
    double height = 50.0,
  }) {
    return Container(
      height: height,
      color: color,
      alignment: Alignment.center,
      child:
          Text(txt, style: const TextStyle(fontSize: 20, color: Colors.black)),
    );
  }
}

class ListViewPage2 extends BaseStatefulWidget {
  ListViewPage2({required super.title});

  @override
  State<StatefulWidget> createState() => ListViewPage2State();
}

class ListViewPage2State extends State<ListViewPage2> {
  ScrollController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        print('position:${_controller?.position}');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        //scrollDirection参数控制滚动方向，默认是垂直方向，向上滚动
        scrollDirection: Axis.vertical,
        reverse: false,
        //controller可以控制ListView的滚动，比如获取当前滚动的位置，或者代码直接滚动到指定位置
        controller: _controller,
        //physics表示可滚动组件的物理滚动特性，系统提供的ScrollPhysics有：
        //1、AlwaysScrollableScrollPhysics：总是可以滑动
        //2、NeverScrollableScrollPhysics：禁止滚动
        //3、BouncingScrollPhysics ：内容超过一屏 上拉有回弹效果
        //4、ClampingScrollPhysics ：包裹内容 不会有回弹
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          height: 50,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text('$index',
              style: const TextStyle(fontSize: 20, color: Colors.black)),
        ),
        itemExtent: 50,
      ),
    );
  }
}

class ListViewPage3 extends BaseStatelessWidget {
  ListViewPage3({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Container(
          height: 50,
          alignment: Alignment.center,
          child: Text('$index',
              style: const TextStyle(fontSize: 20, color: Colors.black)),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 50,
      ),
    );
  }
}

class GridViewPage extends BaseStatelessWidget {
  GridViewPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.gridView1,
        RouterTable.gridView2,
        RouterTable.gridView3,
        RouterTable.gridView4,
        RouterTable.gridView5,
        RouterTable.gridView6,
      ],
    );
  }
}

class GridViewPage1 extends BaseStatelessWidget {
  GridViewPage1({required super.title});

  _createGridViewItem(Color color) {
    return Container(
      height: 80,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView(
        //gridDelegate参数控制子控件的排列，有2个选择：
        //SliverGridDelegateWithFixedCrossAxisCount：交叉轴方向上固定数量，对于垂直方向的GridView来说交叉轴方向指的是水平方向。
        //SliverGridDelegateWithMaxCrossAxisExtent：交叉轴方向上尽量大，比如水平方上有500空间，指定此值为150，那么可以放3个，剩余一些空间，此时GridView将会缩小每一个Item，放置4个。
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //交叉轴方向上个数
          crossAxisCount: 3,
          //主轴方向上2行之间的间隔
          mainAxisSpacing: 10,
          //交叉轴方向上之间的间隔
          crossAxisSpacing: 5,
          //子控件宽高比
          childAspectRatio: 1 / 2,
        ),
        children: [
          _createGridViewItem(Colors.primaries[0]),
          _createGridViewItem(Colors.primaries[1]),
          _createGridViewItem(Colors.primaries[2]),
          _createGridViewItem(Colors.primaries[3]),
          _createGridViewItem(Colors.primaries[4]),
          _createGridViewItem(Colors.primaries[5]),
          _createGridViewItem(Colors.primaries[6]),
          _createGridViewItem(Colors.primaries[7]),
          _createGridViewItem(Colors.primaries[8]),
        ],
      ),
    );
  }
}

class GridViewPage2 extends BaseStatelessWidget {
  GridViewPage2({required super.title});

  _createGridViewItem(Color color) {
    return Container(
      height: 80,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView(
        //scrollDirection 表示滚动方向，默认是垂直方向，可以设置为水平方向
        scrollDirection: Axis.horizontal,
        //reverse表示是否反转滚动方向，比如当前滚动方向是垂直方向，reverse设置为true，滚动方向为从上到下，
        //设置为false，滚动方向为从下到上。
        reverse: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: [
          _createGridViewItem(Colors.primaries[0]),
          _createGridViewItem(Colors.primaries[1]),
          _createGridViewItem(Colors.primaries[2]),
          _createGridViewItem(Colors.primaries[3]),
          _createGridViewItem(Colors.primaries[4]),
          _createGridViewItem(Colors.primaries[5]),
          _createGridViewItem(Colors.primaries[6]),
          _createGridViewItem(Colors.primaries[7]),
          _createGridViewItem(Colors.primaries[8]),
        ],
      ),
    );
  }
}

class GridViewPage3 extends BaseStatelessWidget {
  GridViewPage3({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        //itemBuilder是构建子控件，itemCount指定数据个数。
        itemBuilder: (context, index) => Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
        ),
        itemCount: 60,
      ),
    );
  }
}

class GridViewPage4 extends BaseStatelessWidget {
  GridViewPage4({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.custom(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
          ),
          childCount: 60,
        ),
      ),
    );
  }
}

class GridViewPage5 extends BaseStatelessWidget {
  GridViewPage5({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          60,
          (index) => Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
          ),
        ),
      ),
    );
  }
}

class GridViewPage6 extends BaseStatelessWidget {
  GridViewPage6({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 100,
        children: List.generate(
          60,
          (index) => Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
          ),
        ),
      ),
    );
  }
}
