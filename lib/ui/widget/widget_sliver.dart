import 'package:basic_project/func/router_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../func/constant.dart';
import '../base.dart';

///Sliver系列组件
class SliverListPage extends BaseStatelessWidget {
  SliverListPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  height: 65,
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                childCount: 50,
              ),
            ),
          ],
        ));
  }
}

class SliverGridPage extends BaseStatelessWidget {
  SliverGridPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
              childCount: 30,
            ),
          )
        ],
      ),
    );
  }
}

class SliverAppBarPage extends BaseStatelessWidget {
  SliverAppBarPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //SliverAppBar控件可以实现页面头部区域展开、折叠的效果，类似于Android中的CollapsingToolbarLayout。
        //SliverAppBar控件需要和CustomScrollView搭配使用,SliverAppBar要通常放在slivers的第一位，后面接其他sliver控件。
        SliverAppBar(
          //pinned设置为true时，当SliverAppBar内容滑出屏幕时，将始终渲染一个固定在顶部的收起状态
          pinned: true,
          //expandedHeight表示flexibleSpace的高度
          expandedHeight: 200,
          //flexibleSpace是SliverAppBar中展开和折叠区域，flexibleSpace与expandedHeight一起使用
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            background: Image.network(
              Constant.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          /**
           * 其他属性说明：
           * leading  	左侧控件，通常情况下为"返回"图标
           * title	    标题，通常为Text控件
           * actions	  右侧控件
           * bottom   	底部控件
           * elevation	阴影
           * floating	  设置为true时，向下滑动时，即使当前CustomScrollView不在顶部，SliverAppBar也会跟着一起向下出现
           * snap	      设置为true时，当手指放开时，SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态，此效果在floating=true时生效
           */
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Card(
              child: Container(
                color: Colors.primaries[index % 18],
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          itemExtent: 80,
        ),
      ],
    );
  }
}

class SliverPersistentHeaderPage extends BaseStatelessWidget {
  SliverPersistentHeaderPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          //SliverPersistentHeader控件当滚动到边缘时根据滚动的距离缩小高度，有点类似SliverAppBar的背景效果。
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(),
            //floating设置为true时，向下滑动时，即使当前CustomScrollView不在顶部，SliverAppBar也会跟着一起向下出现
            // floating: true,
            //pinned设置为true时，当SliverAppBar内容滑出屏幕时，将始终渲染一个固定在顶部的收起状态
            // pinned: true,
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        '我是一个SliverPersistentHeader',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false; //如果内容需要更新，设置为true
}

class SliverToBoxAdapterPage extends BaseStatelessWidget {
  SliverToBoxAdapterPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          //CustomScrollView只能包含sliver系列组件，如果包含普通的组件如何处理？使用SliverToBoxAdapter包裹。
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                '我是一个Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 65,
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomScrollViewPage extends BaseStatefulWidget {
  CustomScrollViewPage({required super.title});

  @override
  State<StatefulWidget> createState() => CustomScrollViewPageState();
}

class CustomScrollViewPageState extends State<CustomScrollViewPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //监听滚动位置
    _scrollController.addListener(() {
      print('${_scrollController.position}');
    });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //滚动到指定位置
      _scrollController.jumpTo(150);
      //滚动到底
      // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CustomScrollView是使用Sliver组件创建自定义滚动效果的滚动组件，就像一个粘合剂，将多个组件粘合在一起，具统一的滚动效果。
      //使用场景：
      //1、ListView和GridView相互嵌套场景，ListView嵌套GridView时，需要给GridView指定高度，但我们希望高度随内容而变化（不指定），ListView和GridView作为整体滚动效果。
      //2、一个页面顶部是AppBar，然后是GridView，最后是ListView，这3个区域以整体来滚动，AppBar具有吸顶效果。
      body: CustomScrollView(
        //scrollDirection为滚动方向，分为垂直和水平方向
        scrollDirection: Axis.vertical,
        //reverse参数表示是否反转滚动方向，并不是垂直转为水平，而是垂直方向滚动时，默认向下滚动，reverse设置false，滚动方向改为向上，同理水平滚动改为水平向左。
        reverse: false,
        //primary设置为true时，不能设置controller，因为primary为true时，controller使用PrimaryScrollController，
        //这种机制带来的好处是父组件可以控制子树中可滚动组件的滚动行为
        primary: false,
        //controller为滚动控制器，可以监听滚到的位置，设置滚动的位置等
        controller: _scrollController,
        //physics表示可滚动组件的物理滚动特性，系统提供的ScrollPhysics有：
        //1、AlwaysScrollableScrollPhysics：总是可以滑动
        //2、NeverScrollableScrollPhysics：禁止滚动
        //3、BouncingScrollPhysics ：内容超过一屏 上拉有回弹效果
        //4、ClampingScrollPhysics ：包裹内容 不会有回弹
        physics: const AlwaysScrollableScrollPhysics(),
        //Sliver系列组件有很多，比如SliverList、SliverGrid、SliverFixedExtentList、SliverPadding、SliverAppBar等。
        slivers: [
          //场景二：顶部是AppBar场景
          SliverAppBar(
            pinned: true,
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              background: Image.network(
                Constant.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          //场景一：相互嵌套场景
          SliverGrid.count(
            crossAxisCount: 4,
            children: List.generate(
              8,
              (index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
                alignment: Alignment.center,
                child: Text('$index',
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ).toList(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 85,
                alignment: Alignment.center,
                color: Colors.primaries[index % Colors.primaries.length],
                child: Text('$index',
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ),
              childCount: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class NestedScrollViewPage extends BaseStatelessWidget {
  NestedScrollViewPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      widgetList: [
        RouterTable.nestedScrollView1,
        RouterTable.nestedScrollView2,
      ],
      centerContent: true,
    );
  }
}

class NestedScrollViewPage1 extends BaseStatefulWidget {
  NestedScrollViewPage1({required super.title});

  @override
  State<StatefulWidget> createState() => NestedScrollViewPage1State();
}

class NestedScrollViewPage1State extends State<NestedScrollViewPage1> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //监听滚动位置
    _scrollController.addListener(() {
      print('${_scrollController.position}');
    });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //滚动到指定位置
      _scrollController.jumpTo(150);
      //滚动到底
      // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    //NestedScrollView可以在其内部嵌套其他滚动视图的组件，其滚动位置是固有链接的。
    return NestedScrollView(
      //scrollDirection：滚动方向，分为垂直和水平方向
      scrollDirection: Axis.vertical,
      //reverse参数表示反转滚动方向，并不是由垂直转为水平，而是垂直方向滚动时，默认向下滚动，reverse设置false，滚动方向改为向上，同理水平滚动改为水平向左
      reverse: false,
      //controller为滚动控制器，可以监听滚到的位置，设置滚动的位置等
      controller: _scrollController,
      //physics表示可滚动组件的物理滚动特性，系统提供的ScrollPhysics有：
      //1、AlwaysScrollableScrollPhysics：总是可以滑动
      //2、NeverScrollableScrollPhysics：禁止滚动
      //3、BouncingScrollPhysics ：内容超过一屏 上拉有回弹效果
      //4、ClampingScrollPhysics ：包裹内容 不会有回弹
      physics: const AlwaysScrollableScrollPhysics(),
      //场景一：滚动隐藏AppBar
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [SliverAppBar(title: Text(widget.title))],
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.all(0.0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}

class NestedScrollViewPage2 extends BaseStatelessWidget {
  NestedScrollViewPage2({required super.title});

  @override
  Widget build(BuildContext context) {
    //场景二：SliverAppBar展开折叠
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: 230,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            background: Image.network(Constant.imageUrl, fit: BoxFit.fitHeight),
          ),
        )
      ],
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.all(0.0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            height: 80,
            color: Colors.primaries[index % Colors.primaries.length],
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}
