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
        //GestureDetector是手势识别的组件，可以识别点击、双击、长按事件、拖动、缩放等手势。
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
            onTapDown: (v) {
              print('onTapDown');
              setState(() {
                tip1 = 'onTapDown';
              });
            },
            onTapUp: (v) {
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

class InkWellPage extends BaseStatelessWidget {
  InkWellPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: "InkWell",
          child: InkWell(
            //onTap是点击事件回调，如果不设置无法出现“水波纹”效果
            onTap: () {
              print('点击回调');
            },
            //设置水波纹颜色
            splashColor: Colors.red,
            //设置高亮颜色颜色，高亮颜色是按住时显示的颜色
            highlightColor: Colors.blue,
            child: const Text(
              '这是InkWell点击效果',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        TitleLayout(
          title: 'Ink',
          child: Ink(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: const Text(
                  '这是Ink的点击效果',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class ListenerPage extends BaseStatefulWidget {
  ListenerPage({required super.title});

  @override
  State<StatefulWidget> createState() => ListenerPageState();
}

class ListenerPageState extends State<ListenerPage> {
  String tip = '';

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      centerContent: true,
      children: [
        //Listener是一个监听指针事件的控件，比如按下、移动、释放、取消等指针事件，
        //但Listener无法监听鼠标特有的事件，比如：移入、悬停、移出事件，鼠标事件使用MouseRegion监听。
        //通常情况下，监听手势事件使用GestureDetector，GestureDetector是更高级的手势事件。
        Listener(
          onPointerDown: (v) {
            print('onPointerDown');
            setState(() {
              tip = getInfo('onPointerDown', v);
            });
          },
          onPointerMove: (v) {
            print('onPointerMove');
            setState(() {
              tip = getInfo('onPointerMove', v);
            });
          },
          onPointerUp: (v) {
            print('onPointerUp');
            setState(() {
              tip = getInfo('onPointerUp', v);
            });
          },
          child: Container(
            width: 330,
            height: 500,
            color: Colors.blue,
            child: Text(tip, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  String getInfo(String type, PointerEvent? event) {
    if (event == null) {
      return "";
    }
    //常用属性说明如下：
    //position：相对屏幕的坐标的偏移。
    //localPosition：相对当前控件的偏移。
    //pressure：按压力度。
    //delta：2次指针移动事件的偏移。
    //orientation：指针移动方向
    return "$type\n相对屏幕的坐标的偏移：${event.position}\n"
        "相对当前控件的偏移：${event.localPosition}\n"
        "按压力度：${event.pressure}\n"
        "2次指针移动事件的偏移：${event.delta}\n"
        "指针移动方向：${event.orientation}";
  }
}
