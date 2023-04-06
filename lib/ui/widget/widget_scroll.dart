import 'package:flutter/material.dart';

import '../../entity/User.dart';
import '../../func/constant.dart';
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

class SingleChildScrollViewPage extends BaseStatelessWidget {
  SingleChildScrollViewPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //当遇到内容较多时，需要滚动组件进行展示，SingleChildScrollView是一个只能包含单个组件的滚动组件，
      //如果内容较多，建议使用ListView等，因为SingleChildScrollView没有“懒加载”模式，性能不如ListView。
      body: SingleChildScrollView(
        //滚动方向，默认垂直方向
        scrollDirection: Axis.vertical,
        //reverse参数表示反转滚动方向，并不是有垂直转为水平，而是垂直方向滚动时，默认向下滚动，
        //reverse设置false，滚动方向改为向上，同理水平滚动改为水平向左。
        reverse: true,
        //设置内边距Padding
        padding: const EdgeInsets.all(10),
        //primary设置为true时，不能设置controller，因为primarytrue时，controller使用PrimaryScrollController，
        //这种机制带来的好处是父组件可以控制子树中可滚动组件的滚动行为，
        //例如，Scaffold正是使用这种机制在iOS中实现了点击导航栏回到顶部的功能。
        primary: true,
        //也可以设置其他controller，controller和physics属性用法同ListView中一样。
        // controller: ScrollController(),
        child: Column(
          children: List.generate(
            50,
            (index) => Container(
              height: 150,
              color: Colors.primaries[index % Colors.primaries.length],
            ),
          ).toList(),
        ),
      ),
    );
  }
}

class PageViewPage extends BaseStatelessWidget {
  PageViewPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.pageView1,
        RouterTable.pageView2,
        RouterTable.pageView3,
        RouterTable.pageView4,
      ],
    );
  }
}

class PageViewPage1 extends BaseStatelessWidget {
  PageViewPage1({required super.title});

  @override
  Widget build(BuildContext context) {
    //PageView控件可以实现一个“图片轮播”的效果
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: PageView(
        //滚动方向默认是水平，可以设置其为垂直方向
        scrollDirection: Axis.horizontal,
        controller: PageController(
          viewportFraction: 0.9,
          //initialPage表示当前加载第几页,默认第一页
          initialPage: 1,
        ),
        //onPageChanged属性是页面发生变化时的回调
        onPageChanged: (index) {
          print('$index');
        },
        children: [
          _buildItem('PageView1', Colors.red),
          _buildItem('PageView2', Colors.green),
          _buildItem('PageView3', Colors.blue),
        ],
      ),
    );
  }

  _buildItem(String txt, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child:
          Text(txt, style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}

class PageViewPage2 extends BaseStatelessWidget {
  PageViewPage2({required super.title});

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      _buildItem('PageView1', Colors.red),
      _buildItem('PageView2', Colors.green),
      _buildItem('PageView3', Colors.blue),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: PageView.builder(
        //巧妙的利用取余（%）重复构建页面实现PageView无限滚动的效果
        itemCount: 10000,
        itemBuilder: (context, index) => pageList[index % pageList.length],
      ),
    );
  }

  _buildItem(String txt, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child:
          Text(txt, style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}

class PageViewPage3 extends BaseStatefulWidget {
  PageViewPage3({required super.title});

  @override
  State<StatefulWidget> createState() => PageViewPage3State();
}

class PageViewPage3State extends State<PageViewPage3> {
  final List<String> _pageList = [
    'PageView1',
    'PageView2',
    'PageView3',
    'PageView4',
    'PageView5'
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 230,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: 10000,
                itemBuilder: (context, index) => _buildItem(
                  _pageList[index % _pageList.length],
                  Colors.blue,
                ),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index % _pageList.length;
                  });
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pageList.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(String txt, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child:
          Text(txt, style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}

class PageViewPage4 extends BaseStatefulWidget {
  PageViewPage4({required super.title});

  @override
  State<StatefulWidget> createState() => PageViewPage4State();
}

class PageViewPage4State extends State<PageViewPage4> {
  var imgList = [
    Constant.bannerImageUrl1,
    Constant.bannerImageUrl2,
    Constant.bannerImageUrl3,
  ];

  PageController? _controller;
  var _curPageValue = 0.0;

  //缩放系数
  final double _scaleFactor = 0.8;
  final double _height = 200;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.9);
    _controller?.addListener(() {
      setState(() {
        if (_controller != null) {
          _curPageValue = _controller!.page!;
        }
      });
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
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: _height,
          child: PageView.builder(
            itemBuilder: (context, index) => _buildItem(index),
            itemCount: 12,
            controller: _controller,
          ),
        ),
      ),
    );
  }

  _buildItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _curPageValue.floor()) {
      //当前的item
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _curPageValue.floor() + 1) {
      //右边的item
      var currScale =
          _scaleFactor + (_curPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == _curPageValue.floor() - 1) {
      //左边的item
      var currScale = 1 - (_curPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
    }
    return Transform(
      transform: matrix4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(imgList[index % imgList.length]),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class DataTablePage extends BaseStatefulWidget {
  DataTablePage({required super.title});

  @override
  State<StatefulWidget> createState() => DataTablePageState();
}

class DataTablePageState extends State<DataTablePage> {
  List<User> selectedData = [
    User('小明1', 18),
    User('小明2', 19, selected: true),
    User('小明3', 20),
    User('小明4', 21),
    User('小明5', 22),
  ];
  List<User> sortData = [
    User('小明1', 18),
    User('小明2', 19),
    User('小明3', 20),
    User('小明4', 21),
    User('小明5', 22),
  ];

  var _sortAscending = true;
  var _sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: '基础用法',
          child: DataTable(
            //sortColumnIndex参数表示表格显示排序图标的索引，仅仅是外观上的控制
            sortColumnIndex: 1,
            //sortAscending参数表示升序或者降序，仅仅是外观上的控制
            sortAscending: true,
            //columns参数是DataTable的列
            columns: [
              const DataColumn(
                label: Text('姓名'),
                //tooltip参数表示当长按此表头时显示提示
                tooltip: '长按提示',
              ),
              DataColumn(
                label: const Text('年龄'),
                //默认情况下数据是左对齐的，让某一列右对齐只需设置DataColumn中numeric参数true
                numeric: false,
                //onSort回调是用户点击表头（DataColumn）时的回调，onSort中第一个参数columnIndex表示索引，ascending参数表示升序或者降序
                onSort: (columnIndex, ascending) {},
              ),
            ],
            //rows参数是DataTable的每一行数据
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    const Text('小明'),
                    //设置编辑图标，当然仅仅是一个图标
                    showEditIcon: true,
                    //placeholder参数也是一样的，设置为true，仅仅是文字的样式变化了
                    placeholder: true,
                    //onTap为点击回调
                    onTap: () {
                      print('DataCell onTap');
                    },
                  ),
                  const DataCell(Text('18')),
                ],
              ),
              const DataRow(
                //显示其中一行被选中
                selected: true,
                cells: [
                  DataCell(Text('大黄')),
                  DataCell(Text('20')),
                ],
              ),
            ],
          ),
        ),
        TitleLayout(
          title: '显示勾选框',
          child: createSelectDataTable(),
        ),
        TitleLayout(
          title: '排序',
          child: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(
                label: Text('姓名'),
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;
                    if (ascending) {
                      sortData.sort((a, b) => a.name.compareTo(b.name));
                    } else {
                      sortData.sort((a, b) => b.name.compareTo(a.name));
                    }
                  });
                },
              ),
              DataColumn(
                label: const Text('年龄'),
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;
                    if (ascending) {
                      sortData.sort((a, b) => a.age.compareTo(b.age));
                    } else {
                      sortData.sort((a, b) => b.age.compareTo(a.age));
                    }
                  });
                },
              )
            ],
            rows: sortData
                .map((user) => DataRow(cells: [
                      DataCell(Text(user.name)),
                      DataCell(Text('${user.age}')),
                    ]))
                .toList(),
          ),
        ),
        TitleLayout(
          title: '处理数据显示不全问题',
          child: createMultiData(),
        ),
      ],
    );
  }

  Widget createSelectDataTable() {
    List<DataRow> dateRows = [];
    for (int i = 0; i < selectedData.length; i++) {
      dateRows.add(DataRow(
        selected: selectedData[i].selected,
        //onSelectChanged参数是点击每一行数据时的回调，设置了onSelectChanged参数，在数据的每一行和表头的前面显示勾选框
        onSelectChanged: (selected) {
          setState(() {
            selectedData[i].selected = selected!;
          });
        },
        cells: [
          DataCell(Text(selectedData[i].name)),
          DataCell(Text('${selectedData[i].age}')),
        ],
      ));
    }
    return DataTable(
      columns: const [
        //表头的点击全选/取消全选勾选框，每一行的onSelectChanged都被回调了一次。
        DataColumn(label: Text('姓名')),
        DataColumn(label: Text('年龄'), numeric: true),
      ],
      rows: dateRows,
    );
  }

  Widget createMultiData() {
    List<DataRow> dataRows = [];
    for (int i = 0; i < selectedData.length; i++) {
      dataRows.add(DataRow(cells: [
        DataCell(Text(selectedData[i].name)),
        DataCell(Text('${selectedData[i].age}')),
        const DataCell(Text('男')),
        const DataCell(Text('2020')),
        const DataCell(Text('10')),
      ]));
    }
    //当表格列比较多的时候，可以使用SingleChildScrollView包裹DataTable，显示不全时滚动显示
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('姓名')),
          DataColumn(label: Text('年龄')),
          DataColumn(label: Text('性别')),
          DataColumn(label: Text('出生年份')),
          DataColumn(label: Text('出生月份')),
        ],
        rows: dataRows,
      ),
    );
  }
}
