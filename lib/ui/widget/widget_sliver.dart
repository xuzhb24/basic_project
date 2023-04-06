import 'package:flutter/material.dart';

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
