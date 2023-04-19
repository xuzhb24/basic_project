import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../func/router_table.dart';
import '../base.dart';

///其他组件
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

class ReorderableListViewPage extends BaseStatefulWidget {
  ReorderableListViewPage({required super.title});

  @override
  State<StatefulWidget> createState() => ReorderableListViewPageState();
}

class ReorderableListViewPageState extends State<ReorderableListViewPage> {
  final List<String> _items = List.generate(20, (index) => '$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      //ReorderableListView是通过长按拖动某一项到另一个位置来重新排序的列表组件，没有“懒加载”模式，需要一次构建所有的子组件，
      //所以ReorderableListView并不适合加载大量数据的列表，它适用于有限集合且需要排序的情况，比如手机系统里面设置语言的功能，通过拖动对语言排序。
      body: ReorderableListView(
        //header参数显示在列表的顶部
        header: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: const Text(
            'ReorderableListView头部',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
        //scrollDirection参数表示滚动到方向，默认为垂直
        scrollDirection: Axis.vertical,
        //reverse参数设置为true且ReorderableListView的滚动方向为垂直时，滚动条直接滑动到底部，如果是水平方向则滚动条直接滑动到右边，默认为false
        reverse: false,
        //ReorderableListView需要设置children和onReorder属性，children是子控件，onReorder是拖动完成后的回调
        children: [
          for (String item in _items)
            Container(
              //每个子控件必须设置唯一的key
              key: ValueKey(item),
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                color:
                    Colors.primaries[int.parse(item) % Colors.primaries.length],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                item,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
        ],
        //onReorder是拖动完成的回调，第一个参数是旧的数据索引，第二个参数是拖动到位置的索引，回调里面需要对数据进行排序并通过setState刷新数据。
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          var child = _items.removeAt(oldIndex);
          _items.insert(newIndex, child);
          setState(() {});
        },
      ),
    );
  }
}

class ExpansionPanelListPage extends BaseStatefulWidget {
  ExpansionPanelListPage({required super.title});

  @override
  State<StatefulWidget> createState() => ExpansionPanelListPageState();
}

class ExpansionPanelListPageState extends State<ExpansionPanelListPage> {
  List<bool> _dataList = List.generate(20, (index) => false).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      //注意ExpansionPanelList要被SingleChildScrollView包裹，否则抛出异常
      body: SingleChildScrollView(
        child: _buildExpansionPanelList(),
      ),
    );
  }

  _buildExpansionPanelList() {
    return ExpansionPanelList(
      //expansionCallback为展开/关闭回调，返回展开/关闭子控件的索引及状态
      expansionCallback: (index, isExpanded) {
        setState(() {
          _dataList[index] = !isExpanded;
        });
      },
      children: _dataList
          .map(
            (value) => ExpansionPanel(
              isExpanded: value,
              //头部
              headerBuilder: (context, isExpanded) =>
                  const ListTile(title: Text('ExpansionPanel')),
              //展开/关闭子控件
              body: Container(height: 100, color: Colors.greenAccent),
            ),
          )
          .toList(),
    );
  }
}

class MergeableMaterialPage extends BaseStatelessWidget {
  MergeableMaterialPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.mergeableMaterial1,
        RouterTable.mergeableMaterial2,
      ],
    );
  }
}

class MergeableMaterialPage1 extends BaseStatelessWidget {
  MergeableMaterialPage1({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        //MergeableMaterial，它展示多个MergeableMaterialItem组件，当子组件发生变化时，以动画的方式打开或者关闭子组件，
        //MergeableMaterial的父控件需要在主轴方向是一个没有限制的控件，比如SingleChildScrollView、Row、Column等
        child: MergeableMaterial(
          //增加分割线和阴影
          hasDividers: true,
          dividerColor: Colors.blue,
          //阴影值不能随便设置，只能设置如下值：1, 2, 3, 4, 6, 8, 9, 12, 16, 24
          elevation: 24,
          //MergeableMaterial的子控件只能是MaterialSlice和MaterialGap
          children: [
            //MaterialSlice是带子控件的控件，显示实际内容，MaterialGap用于分割，只能放在MaterialSlice中间。
            MaterialSlice(key: const ValueKey(1), child: _buildItem(1)),
            const MaterialGap(key: ValueKey(2)),
            MaterialSlice(key: const ValueKey(3), child: _buildItem(3)),
            const MaterialGap(key: ValueKey(4)),
            MaterialSlice(key: const ValueKey(5), child: _buildItem(5)),
          ],
        ),
      ),
    );
  }

  _buildItem(int index) {
    return Container(
      height: 45,
      color: Colors.primaries[index % Colors.primaries.length],
    );
  }
}

class MergeableMaterialPage2 extends BaseStatefulWidget {
  MergeableMaterialPage2({required super.title});

  @override
  State<StatefulWidget> createState() => MergeableMaterialPage2State();
}

class MergeableMaterialPage2State extends State<MergeableMaterialPage2> {
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 45,
            color: Colors.green.withOpacity(.3),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                setState(() {
                  _expand = !_expand;
                });
              },
            ),
          ),
          //系统控件ExpansionPanelList就是使用此控件实现的。
          _expand
              ? MergeableMaterial(
                  hasDividers: true,
                  elevation: 24,
                  children: [
                    MaterialSlice(
                      key: const ValueKey(1),
                      child: Container(
                        height: 200,
                        color: Colors.green.withOpacity(.3),
                      ),
                    ),
                  ],
                )
              : Container(),
          Container(
            height: 45,
            color: Colors.red.withOpacity(.3),
          ),
        ],
      ),
    );
  }
}
