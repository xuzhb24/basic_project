import 'package:flutter/material.dart';

import '../base.dart';

///布局组件
///Row和Column是多子控件的容器类控件，Row控件水平布局，Column控件垂直布局
class RowColumnPage extends BaseStatelessWidget {
  RowColumnPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        //mainAxisAlignment：主轴对齐方式，默认值是MainAxisAlignment.start
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.start',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.center',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.end',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.spaceBetween',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.spaceEvenly',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.spaceAround',
          child: Row(
            //spaceAround和spaceEvenly区别是：
            //spaceAround：第一个子控件距开始位置和最后一个子控件距结尾位置是其他子控件间距的一半
            //spaceEvenly：所有间距一样
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        //crossAxisAlignment：交叉轴对齐方式，默认是CrossAxisAlignment.center
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.start',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.center',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.end',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.stretch',
          child: SizedBox(
            height: 150,
            child: Row(
              //CrossAxisAlignment.stretch表示使子控件填满交叉轴
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 100, height: 50, color: Colors.red),
                Container(width: 100, height: 100, color: Colors.green),
                Container(width: 100, height: 150, color: Colors.yellow),
              ],
            ),
          ),
        ),
        //textDirection
        BlackBorder(
          title: '水平方向布局：TextDirection.ltr',
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '水平方向布局：TextDirection.rtl',
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        //verticalDirection，默认值是VerticalDirection.down
        BlackBorder(
          title: '垂直方向布局：VerticalDirection.up',
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '垂直方向布局：VerticalDirection.down',
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        //主轴尺寸，默认值是MainAxisSize.max
        BlackBorder(
          title: '主轴尺寸：MainAxisSize.min',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
      ],
    );
  }
}

class StackPage extends BaseStatefulWidget {
  StackPage({required super.title});

  @override
  State<StatefulWidget> createState() => StackPageState();
}

class StackPageState extends State<StackPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: '简单叠加',
          child: Stack(
            children: [
              Container(width: 200, height: 200, color: Colors.red),
              Container(width: 170, height: 170, color: Colors.blue),
              Container(width: 140, height: 140, color: Colors.yellow),
            ],
          ),
        ),
        //未定位的子组件：没有使用Positioned包裹的子组件
        //Stack未定位的子组件大小由fit参数决定，默认值是StackFit.loose，表示子组件自己决定，
        //StackFit.expand表示尽可能的大
        TitleLayout(
          title: '未定位的子组件大小：StackFit.loose',
          child: Container(
            width: 250,
            height: 250,
            color: Colors.grey,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(width: 200, height: 200, color: Colors.red),
                Container(width: 170, height: 170, color: Colors.blue),
                Container(width: 140, height: 140, color: Colors.yellow),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '未定位的子组件大小：StackFit.expand',
          child: Container(
            width: 250,
            height: 250,
            color: Colors.grey,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(width: 200, height: 200, color: Colors.red),
                Container(width: 170, height: 170, color: Colors.blue),
                Container(width: 140, height: 140, color: Colors.yellow),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '未定位的子组件对齐方式：Alignment.center',
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.red),
              Container(width: 170, height: 170, color: Colors.blue),
              Container(width: 140, height: 140, color: Colors.yellow),
            ],
          ),
        ),
        //使用Positioned包裹的子组件就是定位的子组件
        //Positioned用于定位Stack子组件，Positioned必须是Stack的子组件
        //提供top、bottom、left、right四种定位属性，分别表示距离上下左右的距离
        //Positioned提供便捷的构建方式，比如Positioned.fromRect、Positioned.fill等
        TitleLayout(
          title: '使用Positioned定位',
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.red),
              Positioned(
                //左边距
                left: 10,
                //上边距
                top: 10,
                //右边距
                right: 10,
                //下边距
                bottom: 10,
                child: Container(color: Colors.green),
              )
            ],
          ),
        ),
        //IndexedStack是Stack的子类，Stack是将所有的子组件叠加显示，而IndexedStack只显示指定的子组件
        TitleLayout(
          title: 'IndexedStack',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IndexedStack(
                index: _index,
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.fastfood,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.cake,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.local_cafe,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _index = 0;
                      });
                    },
                    icon: const Icon(Icons.fastfood),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _index = 1;
                      });
                    },
                    icon: const Icon(Icons.cake),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _index = 2;
                      });
                    },
                    icon: const Icon(Icons.local_cafe),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class WrapPage extends BaseStatelessWidget {
  WrapPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        BlackBorder(
          title: 'Wrap流式布局',
          child: Wrap(
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '布局方向\ndirection: Axis.horizontal',
          child: Wrap(
            direction: Axis.horizontal,
            children: List.generate(4, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'direction: Axis.vertical',
          child: Wrap(
            direction: Axis.vertical,
            children: List.generate(4, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式\nalignment: WrapAlignment.start',
          child: Wrap(
            alignment: WrapAlignment.start,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.center',
          child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.end',
          child: Wrap(
            alignment: WrapAlignment.end,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.spaceBetween',
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.spaceEvenly',
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.spaceAround',
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式\ncrossAxisAlignment: WrapCrossAlignment.start',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              double height = 50.0 + 5 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'crossAxisAlignment: WrapCrossAlignment.center',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              double height = 50.0 + 5 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'crossAxisAlignment: WrapCrossAlignment.end',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              double height = 50.0 + 5 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        //runAlignment属性控制Wrap的主轴垂直方向每一行的对齐方式，与alignment的区别：
        //alignment是主轴方向上对齐方式，作用于每一行。
        //runAlignment是垂直主轴方向上将每一行看作一个整体的对齐方式。
        BlackBorder(
          title: '主轴垂直方向每一行的对齐方式\nrunAlignment: WrapAlignment.start',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.start,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.center',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.end',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.end,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.spaceBetween',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.spaceBetween,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.spaceEvenly',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.spaceAround',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.spaceAround,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: '间隔\nspacing: 10',
          child: Wrap(
            spacing: 10,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'runSpacing: 10',
          child: Wrap(
            runSpacing: 10,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '主轴方向上子控件的方向\ntextDirection: TextDirection.ltr',
          child: Wrap(
            textDirection: TextDirection.ltr,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'textDirection: TextDirection.rtl',
          child: Wrap(
            textDirection: TextDirection.rtl,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '交叉轴方向上子控件的方向\nverticalDirection: VerticalDirection.up',
          child: Wrap(
            verticalDirection: VerticalDirection.up,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'verticalDirection: VerticalDirection.down',
          child: Wrap(
            verticalDirection: VerticalDirection.down,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class FlowPage extends BaseStatelessWidget {
  FlowPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //Flow可以调整子组件的位置和大小，结合Matrix4绘制出各种酷炫的效果。
      body: Flow(
        //delegate控制子组件的位置和大小
        delegate: CustomFlowDelegate(),
        children: List.generate(
          9,
          (index) => Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            color: Colors.primaries[index % Colors.primaries.length],
            child: Text('$index', style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class CustomFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    var childCount = context.childCount;
    var offsetX = 10.0, offsetY = 10.0, offsetZ = 10.0;
    for (int i = 0; i < childCount; i++) {
      //使用转换矩阵操作子组件，经过系统优化，性能非常高效
      context.paintChild(i,
          transform: Matrix4.translationValues(offsetX, offsetY, offsetZ));
      offsetX += 35;
      offsetY += 35;
      offsetZ += 35;
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
