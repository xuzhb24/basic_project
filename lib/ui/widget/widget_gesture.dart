import 'package:flutter/material.dart';

import '../base.dart';

///手势识别组件
class GestureDetectorPage extends BaseStatefulWidget {
  GestureDetectorPage({required super.title});

  @override
  State<StatefulWidget> createState() => GestureDetectorPageState();
}

class GestureDetectorPageState extends State<GestureDetectorPage> {
  String tip1 = '';
  String tip2 = '';
  String tip3 = '';
  String tip4 = '';
  String tip5 = '';

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        //点击相关事件包括：
        //onTapDown：按下时回调。
        //onTapUp：抬起时回调。
        //onTap：点击事件回调。
        //onTapCancel：点击取消事件回调。
        //按下然后抬起调用顺序：onTapDown -> onTapUp -> onTap
        //按下后移动的调用顺序：onTapDown -> onTapCancel，这种情况下不再调用onTapUp和onTap
        TitleLayout(
          title: '点击事件',
          child: GestureDetector(
            onTapDown: (detail) {
              print('onTapDown');
              setState(() {
                tip1 = 'onTapDown';
              });
            },
            onTapUp: (detail) {
              print('onTapUp');
              setState(() {
                tip1 = 'onTapUp';
              });
            },
            onTap: () {
              print('onTap');
              setState(() {
                tip1 = 'onTap';
              });
            },
            onTapCancel: () {
              print('onTapCancel');
              setState(() {
                tip1 = 'onTapCancel';
              });
            },
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.topCenter,
              child: Text(tip1, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
        //双击是快速且连续2次在同一个位置点击，双击监听使用onDoubleTap方法
        //当同时监听onTap和onDoubleTap事件时，只会触发一个事件，如果触发onTap事件，
        //onTap将会延迟触发（延迟时间为系统判断是onDoubleTap事件的间隔），
        //因为系统将会等待一段时间来判断是否为onDoubleTap事件，如果用户只监听了onTap事件则没有延迟。
        TitleLayout(
          title: '双击事件',
          child: GestureDetector(
            onDoubleTap: () {
              print('onDoubleTap');
              setState(() {
                tip2 = 'onDoubleTap';
              });
            },
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.topCenter,
              child: Text(tip2, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
        //长按事件（LongPress）包含长按开始、移动、抬起、结束事件，说明如下：
        //onLongPressStart：长按开始事件回调。
        //onLongPressMoveUpdate：长按移动事件回调。
        //onLongPressUp：长按抬起事件回调。
        //onLongPressEnd：长按结束事件回调。
        //onLongPress：长按事件回调。
        //用户按下 -> 移动 -> 抬起的过程调用如下：
        //onLongPressStart -> onLongPress -> onLongPressMoveUpdate -> … -> onLongPressMoveUpdate -> onLongPressEnd -> onLongPressUp
        TitleLayout(
          title: '长按事件',
          child: GestureDetector(
            onLongPressStart: (v) {
              print('onLongPressStart');
              setState(() {
                tip3 = 'onLongPressStart';
              });
            },
            onLongPressMoveUpdate: (v) {
              print('onLongPressMoveUpdate');
              setState(() {
                tip3 = 'onLongPressMoveUpdate';
              });
            },
            onLongPressUp: () {
              print('onLongPressUp');
              setState(() {
                tip3 = 'onLongPressUp';
              });
            },
            onLongPressEnd: (v) {
              print('onLongPressEnd');
              setState(() {
                tip3 = 'onLongPressEnd';
              });
            },
            onLongPress: () {
              print('onLongPress');
              setState(() {
                tip3 = 'onLongPress';
              });
            },
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.topCenter,
              child: Text(tip3, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
        //垂直/水平拖动事件包括按下、开始、移动更新、结束、取消事件，以垂直为例说明如下：
        //onVerticalDragDown：垂直拖动按下事件回调
        //onVerticalDragStart：垂直拖动开始事件回调
        //onVerticalDragUpdate：指针移动更新事件回调
        //onVerticalDragEnd：垂直拖动结束事件回调
        //onVerticalDragCancel：垂直拖动取消事件回调
        //用户垂直方向拖动调用顺序如下：
        //onVerticalDragDown -> onVerticalDragStart -> onVerticalDragUpdate -> … -> onVerticalDragUpdate -> onVerticalDragEnd
        TitleLayout(
          title: '垂直/水平拖动事件',
          child: GestureDetector(
            onVerticalDragStart: (v) {
              print('onVerticalDragStart');
              setState(() {
                tip4 = 'onVerticalDragStart';
              });
            },
            onVerticalDragDown: (v) {
              print('onVerticalDragDown');
              setState(() {
                tip4 = 'onVerticalDragDown';
              });
            },
            onVerticalDragUpdate: (v) {
              print('onVerticalDragUpdate');
              setState(() {
                tip4 = 'onVerticalDragUpdate';
              });
            },
            onVerticalDragCancel: () {
              print('onVerticalDragCancel');
              setState(() {
                tip4 = 'onVerticalDragCancel';
              });
            },
            onVerticalDragEnd: (v) {
              print('onVerticalDragEnd');
              setState(() {
                tip4 = 'onVerticalDragEnd';
              });
            },
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.topCenter,
              child: Text(tip4, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
        //缩放（Scale）包含缩放开始、更新、结束。说明如下：
        //onScaleStart：缩放开始事件回调。
        //onScaleUpdate：缩放更新事件回调。
        //onScaleEnd：缩放结束事件回调。
        //缩放需要2个指针，对于手机就是2个手指进行缩放操作，调用顺序如下：
        //onScaleStart -> onScaleUpdate -> … -> onScaleUpdate -> onScaleEnd
        TitleLayout(
          title: '缩放事件',
          child: GestureDetector(
            onScaleStart: (v) {
              print('onScaleStart');
              setState(() {
                tip5 = 'onScaleStart';
              });
            },
            onScaleUpdate: (v) {
              print('onScaleUpdate');
              setState(() {
                tip5 = 'onScaleUpdate';
              });
            },
            onScaleEnd: (v) {
              print('onScaleEnd');
              setState(() {
                tip5 = 'onScaleEnd';
              });
            },
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              alignment: Alignment.topCenter,
              child: Text(tip5, style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
