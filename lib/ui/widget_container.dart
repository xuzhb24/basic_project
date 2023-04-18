import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

/**
 * 容器类组件合集
 * MaterialApp：Material风格根控件
 * CupertinoApp：iOSl风格根控件
 * Container：单容器类控件，只包含一个子控件，可以装饰和定位子控件，例如设置背景颜色、形状等
 * ConstrainedBox：最大/最小宽高
 * UnconstrainedBox：不约束子组件
 * SizedBox：固定宽高
 * AspectRatio：固定宽高比
 * FractionallySizedBox：相对尺寸
 * LimitedBox：
 * Row：线性布局-横向
 * Column：线性布局-纵向
 * Stack：层叠布局
 * Wrap：流式布局
 * CustomScrollView：滚动组件
 * NestedScrollView：滚动组件
 * SingleChildScrollView：滚动组件
 * SliverAppBar：展开折叠组件
 * TabBar/TabBarView：页面切换
 * PageView：左右或上下切换
 * ListView：列表组件
 * ReorderableListView：可拖动列表组件
 * ExpansionPanelList：展开/关闭组件
 */

/// ConstrainedBox：适用于需要设置最大/小宽高，组件大小依赖子组件大小，但不能超过设置的界限。
/// UnconstrainedBox：用到情况不多，当作ConstrainedBox的子组件可以“突破”ConstrainedBox的限制，超出界限的部分会被截取。
/// SizedBox：适用于固定宽高的情况，常用于当作2个组件之间间隙组件。
/// AspectRatio：适用于固定宽高比的情况。
/// FractionallySizedBox：适用于占父组件百分比的情况。
/// LimitedBox：适用于没有父组件约束的情况。
/// Container：适用于不仅有尺寸的约束，还有装饰（颜色、边框、等）、内外边距等需求的情况。
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
