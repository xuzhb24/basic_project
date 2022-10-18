import 'package:basic_project/func/util.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../func/constant.dart';

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

///Container
class ContainerPage extends BaseStatelessWidget {
  const ContainerPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Util.buildScrollWidget(
      title: title,
      children: [
        Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(vertical: 10),
          //设置对齐方式后，Container将会充满其父控件，相当于Android中match_parent,不再是根据子控件调整大小
          // alignment: Alignment.center,
          child: const Text('Container'),
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Text('圆形的背景'),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text('圆角矩形填充背景'),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text('圆角矩形边框背景'),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(Constant.imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Text(
            '圆角图片',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(Constant.imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            '圆形图片',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 60,
          alignment: Alignment.center,
          color: Colors.blue,
          child: const Text('设置固定宽高（200 x 60）'),
        ),
        const SizedBox(height: 10),
        Container(
          //constraints如果不设置，默认最小宽高是0，最大宽高是无限大（double.infinity）
          constraints: const BoxConstraints.tightForFinite(height: 60),
          alignment: Alignment.center,
          color: Colors.blue,
          child: const Text('设置固定宽高（不限宽度）'),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 60,
          alignment: Alignment.center,
          color: Colors.blue,
          //Matrix4.rotationZ()参数的单位是弧度而不是角度
          transform: Matrix4.rotationZ(0.5),
          child: const Text('transform变换'),
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}

///ConstrainedBox、UnconstrainedBox、SizedBox、AspectRatio、FractionallySizedBox、LimitedBox、Container
class BoxPage extends BaseStatelessWidget {
  const BoxPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Util.buildScrollWidget(
      title: title,
      children: [],
    );
  }
}
