import 'dart:math';

import 'package:basic_project/func/router_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../base.dart';

///功能型组件
class DateTimePage extends BaseStatefulWidget {
  DateTimePage({required super.title});

  @override
  State<StatefulWidget> createState() => DateTimePageState();
}

class DateTimePageState extends State<DateTimePage> {
  var _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      centerContent: true,
      children: [
        SpaceDivider(),
        _buildPicker('DatePicker', 'showDatePicker', () async {
          var result = await showDatePicker(
              context: context,
              //添加国际化支持
              locale: const Locale('zh'),
              //初始化时间，通常情况下设置为当前时间
              initialDate: DateTime.now(),
              //开始时间，设置后，选择器不能选择小于此值的时间
              firstDate: DateTime(2020),
              //结束时间，设置后，选择器不能选择大于此值的时间
              lastDate: DateTime(2030),
              //控制可选日期，返回true表示日期可选，如下表示后天之前的时间可选
              selectableDayPredicate: (day) =>
                  day.difference(DateTime.now()).inDays < 2,
              //设置子控件，比如设置深色主题用法如下
              builder: (context, child) {
                return Theme(data: ThemeData.dark(), child: child!);
              });
          print('$result');
        }),
        _buildPicker('TimePicker', 'showTimePicker', () async {
          var result = await showTimePicker(
              context: context,
              //初始化时间
              initialTime: TimeOfDay.now(),
              //控制子控件，可以向DatePicker一样设置深色主题，还可以设置其显示24小时
              builder: (context, child) =>
                  Theme(data: ThemeData.dark(), child: child!)
              //设置其显示24小时
              // builder: (context, child) => MediaQuery(
              //     data: MediaQuery.of(context)
              //         .copyWith(alwaysUse24HourFormat: true),
              //     child: child!),
              //添加国际化支持,但showTimePicker并没有local参数，使用builder参数设置
              // builder: (context, child) => Localizations(
              //     locale: const Locale('en'),
              //     delegates: const <LocalizationsDelegate>[
              //       GlobalMaterialLocalizations.delegate,
              //       GlobalWidgetsLocalizations.delegate,
              //     ],
              //     child: child),
              );
          print('$result');
        }),
        _buildPicker('CalendarDatePicker', 'showDialog', () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 300,
                    child: CalendarDatePicker(
                      //可选日期的开始值
                      firstDate: DateTime(2020),
                      //可选日期的结束值
                      lastDate: DateTime(2026),
                      //选中的日期，选中的日期有圆形背景
                      initialDate: DateTime(2022, 9, 13),
                      //当前日期,文字高亮
                      currentDate: DateTime(2022, 9, 11),
                      //用户选择的日期发生变化时回调
                      onDateChanged: (date) {
                        print('$date');
                      },
                    ),
                  ),
                );
              });
        }),
        _buildPicker('CupertinoDatePicker', 'showDialog', () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      //初始化时间
                      initialDateTime: _dateTime,
                      //使用24小时制
                      use24hFormat: true,
                      //设置日期的格式：time(只显示时间)date(只显示日期)dateAndTime(日期和时间都显示)
                      mode: CupertinoDatePickerMode.dateAndTime,
                      //最小日期
                      minimumDate: DateTime.now().add(const Duration(days: -1)),
                      //最大日期
                      maximumDate: DateTime.now().add(const Duration(days: 1)),
                      //日期变化回调
                      onDateTimeChanged: (date) {
                        setState(() {
                          _dateTime = date;
                        });
                      },
                    ),
                  ),
                );
              });
        }),
        _buildPicker('CupertinoTimerPicker', 'showDialog', () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 300,
                    child: CupertinoTimerPicker(
                      //初始化时间
                      initialTimerDuration: Duration(
                          hours: DateTime.now().hour,
                          minutes: DateTime.now().minute,
                          seconds: DateTime.now().second),
                      //设置日期的格式：time(只显示时间)date(只显示日期)dateAndTime(日期和时间都显示)
                      mode: CupertinoTimerPickerMode.hms,
                      //日期变化回调
                      onTimerDurationChanged: (duration) {
                        print('$duration');
                      },
                    ),
                  ),
                );
              });
        }),
      ],
    );
  }

  _buildPicker(String title, String btnText, VoidCallback? onPressed) {
    return TitleLayout(
      title: title,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(btnText),
      ),
    );
  }
}

class DialogPage extends BaseStatelessWidget {
  DialogPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        _buildDialog("AlertDialog默认样式", "showDialog", () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('提示'),
                  content: const Text('确认删除吗？'),
                  actions: [
                    TextButton(onPressed: () {}, child: const Text('取消')),
                    TextButton(onPressed: () {}, child: const Text('确认')),
                  ],
                );
              });
        }),
        _buildDialog("AlertDialog自定义样式", "showDialog", () async {
          var result = await showDialog(
              context: context,
              barrierDismissible: false, //控制点击空白处是否退出对话框
              builder: (context) {
                return AlertDialog(
                  title: const Text('提示'),
                  content: const Text('确认删除吗？'),
                  backgroundColor: Colors.lightBlueAccent,
                  elevation: 24,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop('cancel');
                        },
                        child: const Text('取消')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop('ok');
                        },
                        child: const Text('确认')),
                  ],
                );
              });
          print('$result');
        }),
        _buildDialog('CupertinoAlertDialog样式', "showCupertinoDialog", () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('提示'),
                  content: const Text('确认删除吗？'),
                  actions: [
                    CupertinoDialogAction(
                        child: const Text('取消'),
                        onPressed: () {
                          Navigator.of(context).pop('cancel');
                        }),
                    CupertinoDialogAction(
                        child: const Text('确定'),
                        onPressed: () {
                          Navigator.of(context).pop('ok');
                        }),
                  ],
                );
              });
        }),
        _buildDialog('SimpleDialog样式', "showDialog", () {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: const Text('提示'),
                  children: [
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: const Text('确认删除吗？'),
                    ),
                    const Divider(height: 1),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop('cancel');
                      },
                      child: const Text('取消'),
                    ),
                    const Divider(height: 1),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop('ok');
                      },
                      child: const Text('确定'),
                    ),
                  ],
                );
              });
        }),
        _buildDialog('Dialog样式', "showDialog", () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('提示', style: TextStyle(fontSize: 25)),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        const Text('确认删除吗？'),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {}, child: const Text('取消')),
                            TextButton(
                                onPressed: () {}, child: const Text('确定')),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }),
      ],
    );
  }

  _buildDialog(String title, String btnText, VoidCallback? onPressed) {
    return TitleLayout(
      title: title,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(btnText),
      ),
    );
  }
}

class ShapePage extends BaseStatefulWidget {
  ShapePage({required super.title});

  @override
  State<StatefulWidget> createState() => ShapePageState();
}

class ShapePageState extends State<ShapePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: 'BeveledRectangleBorder',
          child: RaisedButton(
            shape: BeveledRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            child: const Text('斜角矩形边框'),
          ),
        ),
        TitleLayout(
          title: 'BeveledRectangleBorder',
          child: FlatButton(
            shape: BeveledRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: () {},
            child: const Text('菱形边框'),
          ),
        ),
        TitleLayout(
          title: 'BeveledRectangleBorder',
          child: RaisedButton(
            shape: BeveledRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(0),
            ),
            onPressed: () {},
            child: const Text('矩形边框'),
          ),
        ),
        TitleLayout(
          title: 'Border',
          child: RaisedButton(
            shape: const Border(
              left: BorderSide(color: Colors.red, width: 10),
              top: BorderSide(color: Colors.blue, width: 2),
              right: BorderSide(color: Colors.yellow, width: 10),
              bottom: BorderSide(color: Colors.green, width: 2),
            ),
            child: const Text('设置边框样式'),
            onPressed: () {},
          ),
        ),
        //BorderDirectional和Border基本一样，区别就是BorderDirectional带有阅读方向，
        //大部分国家阅读是从左到右，但有的国家是从右到左的，比如阿拉伯等。
        TitleLayout(
          title: 'BorderDirectional',
          child: RaisedButton(
            shape: const BorderDirectional(
              start: BorderSide(color: Colors.red, width: 10),
              top: BorderSide(color: Colors.blue, width: 2),
              end: BorderSide(color: Colors.yellow, width: 10),
              bottom: BorderSide(color: Colors.green, width: 2),
            ),
            child: const Text('设置边框样式'),
            onPressed: () {},
          ),
        ),
        TitleLayout(
          title: 'CircleBorder',
          child: RaisedButton(
            shape: const CircleBorder(side: BorderSide(color: Colors.red)),
            child: const Text('圆形'),
            onPressed: () {},
          ),
        ),
        //ContinuousRectangleBorder：连续的圆角矩形，直线和圆角平滑连续的过渡，
        //和RoundedRectangleBorder相比，圆角效果会小一些。
        TitleLayout(
          title: 'ContinuousRectangleBorder',
          child: RaisedButton(
            shape: ContinuousRectangleBorder(
              side: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('圆角矩形'),
            onPressed: () {},
          ),
        ),
        TitleLayout(
          title: 'RoundedRectangleBorder',
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('圆角矩形'),
            onPressed: () {},
          ),
        ),
        //StadiumBorder：类似足球场的形状，两边圆形，中间矩形
        TitleLayout(
          title: 'StadiumBorder',
          child: RaisedButton(
            shape: const StadiumBorder(side: BorderSide(color: Colors.red)),
            child: const Text('足球场形状'),
            onPressed: () {},
          ),
        ),
        TitleLayout(
          title: 'OutlineInputBorder',
          child: RaisedButton(
            shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text('带外边框'),
            onPressed: () {},
          ),
        ),
        TitleLayout(
          title: 'UnderlineInputBorder',
          child: RaisedButton(
            shape: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            child: const Text('下划线边框'),
            onPressed: () {},
          ),
        ),
        //ClipRect组件使用矩形裁剪子组件，通常情况下，ClipRect作用于CustomPaint、CustomSingleChildLayout、
        //CustomMultiChildLayout、Align、Center、OverflowBox、SizedOverflowBox组件，
        //例如ClipRect作用于Align，可以仅显示上半部分，代码如下：
        TitleLayout(
          title: 'ClipRect：仅显示上半部分',
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.5,
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        //clipper和clipBehavior属性：
        //clipper参数定义裁剪规则
        //clipBehavior参数定义了裁剪的方式，只有子控件超出父控件的范围才有裁剪的说法，
        //各个方式说明如下：
        //none：不裁剪，系统默认值，如果子组件不超出边界，此值没有任何性能消耗。
        //hardEdge：裁剪但不应用抗锯齿，速度比none慢一点，但比其他方式快。
        //antiAlias：裁剪而且抗锯齿，此方式看起来更平滑，比antiAliasWithSaveLayer快，比hardEdge慢，通常用于处理圆形和弧形裁剪。
        //antiAliasWithSaveLayer：裁剪、抗锯齿而且有一个缓冲区，此方式很慢，用到的情况比较少。
        TitleLayout(
          title: 'ClipRect：显示全图',
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 1,
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        //ClipRRect组件可以对子组件进行圆角裁剪，默认圆角半径为0
        TitleLayout(
          title: 'ClipRRect',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //ClipOval裁剪为椭圆形，椭圆形的大小为正切父组件，因此如果父组件为正方形，切出来是圆形
        TitleLayout(
          title: 'ClipOval',
          child: ClipOval(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //ClipPath组件根据路径进行裁剪，我们自定义裁剪路径也可以使用系统提供的，
        //shape参数是ShapeBorder类型，系统已经定义了很多形状，介绍如下：
        //RoundedRectangleBorder：圆角矩形
        //ContinuousRectangleBorder：直线和圆角平滑连续的过渡，和RoundedRectangleBorder相比，圆角效果会小一些。
        //StadiumBorder：类似于足球场的形状，两端半圆
        //BeveledRectangleBorder：斜角矩形
        //CircleBorder：圆形
        TitleLayout(
          title: 'ClipPath',
          child: ClipPath.shape(
            shape: const StadiumBorder(),
            child: SizedBox(
              width: 250,
              height: 150,
              child: Image.asset(
                'images/cc.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //CustomClipper并不是一个组件，而是一个abstract(抽象)类，
        //使用CustomClipper可以绘制出任何我们想要的形状，比如三角形
        TitleLayout(
          title: 'CustomClipper：三角形',
          child: ClipPath(
            clipper: TrianglePath(),
            child: SizedBox(
              width: 250,
              height: 150,
              child: Image.asset(
                'images/cc.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        TitleLayout(
          title: '绘制五角星',
          child: AnimatedBuilder(
            animation: _animation!,
            builder: (context, child) {
              return ClipPath(
                clipper: StarPath(scale: _animation!.value),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller?.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller?.forward();
            }
          });
    _animation = Tween(begin: 1.0, end: 4.0).animate(_controller!);
    _controller?.forward();
    super.initState();
  }
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class StarPath extends CustomClipper<Path> {
  StarPath({this.scale = 2.5});

  final double scale;

  double perDegree = 36;

  /// 角度转弧度公式
  double degree2Radian(double degree) {
    return (pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    var R = min(size.width / 2, size.height / 2);
    var r = R / scale;
    var x = size.width / 2;
    var y = size.height / 2;

    var path = Path();
    path.moveTo(x, y - R);
    path.lineTo(x - sin(degree2Radian(perDegree)) * r,
        y - cos(degree2Radian(perDegree)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 2)) * R,
        y - cos(degree2Radian(perDegree * 2)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 3)) * r,
        y - cos(degree2Radian(perDegree * 3)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 4)) * R,
        y - cos(degree2Radian(perDegree * 4)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 5)) * r,
        y - cos(degree2Radian(perDegree * 5)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 6)) * R,
        y - cos(degree2Radian(perDegree * 6)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 7)) * r,
        y - cos(degree2Radian(perDegree * 7)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 8)) * R,
        y - cos(degree2Radian(perDegree * 8)) * R);
    path.lineTo(x - sin(degree2Radian(perDegree * 9)) * r,
        y - cos(degree2Radian(perDegree * 9)) * r);
    path.lineTo(x - sin(degree2Radian(perDegree * 10)) * R,
        y - cos(degree2Radian(perDegree * 10)) * R);
    return path;
  }

  @override
  bool shouldReclip(StarPath oldClipper) {
    return oldClipper.scale != this.scale;
  }
}

class DraggablePage extends BaseStatefulWidget {
  DraggablePage({required super.title});

  @override
  State<StatefulWidget> createState() => DraggablePageState();
}

class DraggablePageState extends State<DraggablePage> {
  var _dragData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            //LongPressDraggable继承自Draggable，因此用法和Draggable完全一样，唯一的区别就是LongPressDraggable触发拖动的方式是长按，而Draggable触发拖动的方式是按下。
            Draggable(
              //data参数和DragTarget配合使用的，当用户将控件拖动到DragTarget时此数据会传递给DragTarget
              data: const Color(0x000000FF),
              //控制拖动的方向，比如只允许垂直方向移动
              // axis: Axis.vertical,
              //feedback参数是拖动时跟随移动的组件
              feedback: _buildContainer(Colors.blue),
              //child参数是子控件
              child: _buildContainer(Colors.red),
              //如果想在拖动的时候子组件显示其他样式可以使用childWhenDragging参数
              // childWhenDragging: _buildContainer(Colors.grey),
              //onDragStarted：开始拖动时回调
              onDragStarted: () {
                print('Draggable onDragStarted');
              },
              //onDragEnd：拖动结束时回调
              onDragEnd: (DraggableDetails details) {
                print('Draggable onDragEnd:$details');
              },
              //onDraggableCanceled：未拖动到DragTarget控件上时回调
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                print(
                    'Draggable onDraggableCanceled velocity:$velocity,offset:$offset');
              },
              //onDragCompleted：拖动到DragTarget控件上时回调
              onDragCompleted: () {
                print('DraggableonDragCompleted');
              },
            ),
            const SizedBox(height: 200),
            DragTarget(
              //当onWillAccept返回true时， candidateData参数的数据是Draggable的data数据。
              //当onWillAccept返回false时， rejectedData参数的数据是Draggable的data数据，
              builder: (context, candidateData, rejectedData) {
                print(
                    'candidateData:$candidateData,rejectedData:$rejectedData');
                return _dragData == null
                    ? _buildContainer(
                        Colors.red,
                        text: "DragTarget",
                        border: true,
                        textColor: Colors.red,
                      )
                    : _buildContainer(Colors.blue);
              },
              //onWillAccept：拖到该控件上时调用，需要返回true或者false，返回true，松手后会回调onAccept，否则回调onLeave。
              onWillAccept: (color) {
                print('DragTarget onWillAccept:$color');
                return true;
              },
              //onAccept：onWillAccept返回true时，用户松手后调用。
              onAccept: (color) {
                setState(() {
                  _dragData = color;
                });
                print('DragTarget onAccept:$color');
              },
              //onLeave：onWillAccept返回false时，用户松手后调用。
              onLeave: (color) {
                print('DragTarget onLeave:$color');
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildContainer(Color color,
      {String text = 'Draggable',
      bool border = false,
      Color textColor = Colors.white}) {
    return Container(
      width: 120,
      height: 120,
      alignment: Alignment.center,
      decoration: border
          ? BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(10),
            )
          : BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}

class InteractiveViewerPage extends BaseStatelessWidget {
  InteractiveViewerPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.interactiveViewer1,
        RouterTable.interactiveViewer2,
      ],
    );
  }
}

class InteractiveViewerPage1 extends BaseStatelessWidget {
  InteractiveViewerPage1({required super.title});

  final int _rowCount = 20;
  final int _columnCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          //InteractiveViewer是Flutter 1.20新增的组件，用户可以通过拖动以平移、缩放和拖放子组件。
          child: InteractiveViewer(
            //alignPanAxis参数表示是否只在水平和垂直方向上拖拽，默认为false，设置为true，无法沿着对角线（斜着）方向移动。
            alignPanAxis: false,
            //maxScale、minScale、scaleEnabled是缩放相关参数，分别表示最大缩放倍数、最小缩放倍数、是否可以缩放
            minScale: 0.5,
            maxScale: 5,
            scaleEnabled: true,
            //constrained参数表示组件树中的约束是否应用于子组件，默认为true，如果设为true，表示子组件是无限制约束，
            //这对子组件的尺寸比InteractiveViewer大时非常有用，比如子组件为滚动系列组件。
            //如下的案例，子组件为Table，Table尺寸大于屏幕，必须将constrained设置为false以便将其绘制为完整尺寸。
            //超出的屏幕尺寸可以平移到视图中。
            constrained: false,
            //onInteractionStart：当用户开始平移或缩放手势时调用。
            onInteractionStart: (v) {
              print('onInteractionStart:$v');
            },
            //onInteractionUpdate：当用户更新组件上的平移或缩放手势时调用。
            onInteractionUpdate: (v) {
              print('onInteractionUpdate:$v');
            },
            //onInteractionEnd：当用户在组件上结束平移或缩放手势时调用。
            onInteractionEnd: (v) {
              print('onInteractionEnd:$v');
            },
            child: Table(
              columnWidths: <int, TableColumnWidth>{
                for (int column = 0; column < _columnCount; column += 1)
                  column: const FixedColumnWidth(100.0),
              },
              children: [
                for (int row = 0; row < _rowCount; row++)
                  TableRow(
                    children: [
                      for (int column = 0; column < _columnCount; column++)
                        Container(
                          height: 50,
                          color: row % 2 + column % 2 == 1
                              ? Colors.red
                              : Colors.green,
                        )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InteractiveViewerPage2 extends BaseStatefulWidget {
  InteractiveViewerPage2({required super.title});

  @override
  State<StatefulWidget> createState() => InteractiveViewerPage2State();
}

class InteractiveViewerPage2State extends State<InteractiveViewerPage2> {
  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: InteractiveViewer(
              transformationController: _controller,
              child: Image.asset('images/cc.png'),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                _controller.value = Matrix4.identity();
              },
              child: const Text('重置'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                var matrix = _controller.value.clone();
                matrix.translate(-5.0);
                _controller.value = matrix;
              },
              child: const Text('左移'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                var matrix = _controller.value.clone();
                matrix.scale(1.5, 1.0, 1.0);
                _controller.value = matrix;
              },
              child: const Text('放大'),
            ),
            Expanded(child: Container()),
          ],
        )
      ]),
    );
  }
}
