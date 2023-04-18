import 'dart:math';
import 'dart:ui';

import 'package:basic_project/ui/base.dart';
import 'package:flutter/cupertino.dart';
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
 */

///元素类组件
class ChipPage extends BaseStatefulWidget {
  ChipPage({required super.title});

  @override
  State<StatefulWidget> createState() => ChipPageState();
}

class ChipPageState extends State<ChipPage> {
  bool _selected = false;
  int _selectIndex = 0;
  List<String> _filters = [];

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        //Material风格标签控件，此控件是其他标签控件的基类
        const RawChip(label: Text('RawChip')),
        const Divider(),
        TitleLayout(
          title: '设置禁用状态',
          child: const RawChip(
            label: Text('RawChip'),
            isEnabled: false,
          ),
        ),
        TitleLayout(
          title: '设置左侧控件',
          child: const RawChip(
            avatar: CircleAvatar(child: Text('R')),
            label: Text('RawChip'),
          ),
        ),
        TitleLayout(
          title: '设置label的样式和内边距',
          child: const RawChip(
            label: Text('RawChip'),
            labelStyle: TextStyle(color: Colors.blue),
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
        TitleLayout(
          title: '设置删除相关属性',
          child: RawChip(
            label: const Text('RawChip'),
            //点击删除图标，回调onDeleted
            onDeleted: () {
              print('RawChip onDeleted');
            },
            deleteIcon: const Icon(Icons.delete),
            deleteIconColor: Colors.red,
            deleteButtonTooltipMessage: '删除',
          ),
        ),
        TitleLayout(
          title: '设置形状、背景颜色及内边距',
          child: RawChip(
            label: const Text('RawChip'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        TitleLayout(
          title: '设置阴影',
          child: const RawChip(
            label: Text('RawChip'),
            elevation: 8,
            shadowColor: Colors.blue,
            //配置组件点击区域大小的属性，有2个值，分别为：
            //padded：最小点击区域为48*48
            //shrinkWrap：子组件的实际大小
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
        ),
        TitleLayout(
          title: '设置选中状态、颜色',
          child: RawChip(
            label: const Text('RawChip'),
            selected: _selected,
            onSelected: (v) {
              setState(() {
                _selected = v;
              });
            },
            selectedColor: Colors.blue,
            selectedShadowColor: Colors.red,
          ),
        ),
        TitleLayout(
          title: '设置选中状态下“前置对勾”图标',
          child: const RawChip(
            label: Text('RawChip'),
            selected: true,
            //showCheckmark为false时，无“前置对勾”图标
            showCheckmark: true,
            checkmarkColor: Colors.red,
          ),
        ),
        TitleLayout(
          title: '设置点击属性',
          child: RawChip(
            label: const Text('RawChip'),
            onPressed: () {
              print('RawChip onPressed');
            },
            //点击时有水波纹效果
            pressElevation: 12,
          ),
        ),
        //Chip是一个简单的标签控件，仅显示信息和删除相关属性，是一个简化版的RawChip，用法和RawChip一样。
        const Chip(label: Text('Chip')),
        const Divider(),
        //InputChip以紧凑的形式表示一条复杂的信息，例如实体（人，地方或事物）或对话文本。InputChip 本质上也是RawChip，用法和RawChip一样。
        const InputChip(label: Text('InputChip')),
        const Divider(),
        //ChoiceChip允许从一组选项中进行单个选择，创建一个类似于单选按钮的标签，本质上ChoiceChip也是一个RawChip，ChoiceChip本身不具备单选属性。
        TitleLayout(
          title: 'ChoiceChip实现单选',
          child: Wrap(
            spacing: 15,
            children: List.generate(
              10,
              (index) => ChoiceChip(
                label: Text('ChoiceChip$index'),
                selected: _selectIndex == index,
                onSelected: (v) {
                  setState(() {
                    _selectIndex = index;
                  });
                },
                selectedColor: Colors.blue,
              ),
            ).toList(),
          ),
        ),
        //FilterChip可以作为过滤标签，本质上也是一个RawChip
        TitleLayout(
          title: 'FilterChip实现多选',
          child: Column(
            children: [
              Wrap(
                spacing: 15,
                children: List.generate(
                  10,
                  (index) => FilterChip(
                    label: Text('FilterChip$index'),
                    selected: _filters.contains('$index'),
                    onSelected: (v) {
                      setState(() {
                        if (v) {
                          _filters.add('$index');
                        } else {
                          _filters
                              .removeWhere((element) => element == '$index');
                        }
                      });
                    },
                  ),
                ).toList(),
              ),
            ],
          ),
        ),
        //ActionChip显示与主要内容有关的一组动作，本质上也是一个RawChip，效果很像按钮类控件。
        ActionChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: const Text('A'),
          ),
          label: const Text('ActionChip'),
          onPressed: () {
            print('ActionChip onPressed');
          },
        ),
      ],
    );
  }
}

class CustomPaintPage extends BaseStatelessWidget {
  CustomPaintPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        _buildPainter('绘制点 drawPoints', PointsPainter()),
        _buildPainter('绘制线 drawLine', LinePainter()),
        _buildPainter('绘制路径 drawPath', PathPainter(PaintingStyle.stroke)),
        _buildPainter('绘制路径 drawPath', PathPainter(PaintingStyle.fill)),
        _buildPainter('绘制圆形 drawCircle', CirclePainter()),
        _buildPainter('绘制椭圆 drawOval', OvalPainter(), height: 50),
        _buildPainter('绘制弧 drawArc', ArcPainter()),
        _buildPainter('绘制圆角矩形 drawRRect', RRectPainter()),
      ],
    );
  }

  _buildPainter(
    String title,
    CustomPainter? painter, {
    double width = 100,
    double height = 100,
  }) {
    return TitleLayout(
      title: title,
      child: CustomPaint(
        size: Size(width, height),
        painter: painter,
      ),
    );
  }
}

class PointsPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 6;

  @override
  void paint(Canvas canvas, Size size) {
    var points = [
      const Offset(0, 0),
      Offset(size.width / 2, size.height / 2),
      Offset(size.width, size.height),
    ];
    //PointMode有3种模式：
    //points：点
    //lines：将2个点绘制为线段，如果点的个数为奇数，最后一个点将会被忽略
    //polygon：将整个点绘制为一条线
    canvas.drawPoints(PointMode.points, points, _paint);
  }

  @override
  bool shouldRepaint(PointsPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class LinePainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        const Offset(0, 0), Offset(size.width, size.height), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class PathPainter extends CustomPainter {
  PathPainter(this.style);

  final PaintingStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    print('size:$size');
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = style
      ..strokeWidth = 3;
    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class OvalPainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class ArcPainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
        Rect.fromLTRB(0, 0, size.width, size.height), 0, pi / 2, true, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class RRectPainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromLTRBR(
            0, 0, size.width, size.height, const Radius.circular(10)),
        _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class OpacityPage extends BaseStatefulWidget {
  OpacityPage({required super.title});

  @override
  State<StatefulWidget> createState() => OpacityPageState();
}

class OpacityPageState extends State<OpacityPage> {
  bool _click = false;

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: 'Opacity',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text('1', style: TextStyle(color: Colors.white)),
              ),
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text('2', style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('3', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        TitleLayout(
          title: 'AnimatedOpacity',
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _click = !_click;
                  });
                },
                child: const Text('开始动画'),
              ),
              Stack(
                children: [
                  Image.network(
                      'https://img2.baidu.com/it/u=1003272215,1878948666&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800'),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      onEnd: () {
                        setState(() {
                          _click = !_click;
                        });
                      },
                      duration: const Duration(seconds: 3),
                      opacity: _click ? 0.2 : 0.8,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedListPage extends BaseStatefulWidget {
  AnimatedListPage({required super.title});

  @override
  State<StatefulWidget> createState() => AnimatedListPageState();
}

class AnimatedListPageState extends State<AnimatedListPage>
    with SingleTickerProviderStateMixin {
  List<int> _list = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void _addItem() {
    final int index = _list.length;
    _list.insert(index, index);
    _listKey.currentState?.insertItem(index);
  }

  void _removeItem() {
    final int index = _list.length - 1;
    var item = _list[index].toString();
    _listKey.currentState?.removeItem(
        index, (context, animation) => _buildItem(item, animation));
    _list.removeAt(index);
  }

  Widget _buildItem(String item, Animation<double> animation) {
    //实现“左进右出”的动画效果
    // return SlideTransition(
    //   position: animation
    //       .drive(CurveTween(curve: Curves.easeIn))
    //       .drive(Tween(begin: const Offset(1, 1), end: const Offset(0, 1))),
    //   child: Card(
    //     color: Colors.blue,
    //     child: ListTile(
    //       title: Text(item),
    //     ),
    //   ),
    // );
    //实现从上掉落的效果
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.blue,
        child: ListTile(title: Text(item)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedList(
        key: _listKey,
        //item的个数
        initialItemCount: _list.length,
        //一个函数，列表的每一个索引会调用，这个函数有一个animation参数，可以设置成任何一个动画
        itemBuilder: (context, index, animation) =>
            _buildItem(_list[index].toString(), animation),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => _addItem(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 60),
          FloatingActionButton(
            onPressed: () => _removeItem(),
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
