import 'package:flutter/material.dart';

import '../../func/constant.dart';
import '../base.dart';

///定位装饰权重组件
class ContainerPage extends BaseStatelessWidget {
  const ContainerPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
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
        const Divider(),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Text('圆形的背景'),
        ),
        const Divider(),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text('圆角矩形填充背景'),
        ),
        const Divider(),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text('圆角矩形边框背景'),
        ),
        const Divider(),
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
        const Divider(),
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
        const Divider(),
        Container(
          width: 200,
          height: 60,
          alignment: Alignment.center,
          color: Colors.blue,
          child: const Text('设置固定宽高（200 x 60）'),
        ),
        const Divider(),
        Container(
          //constraints如果不设置，默认最小宽高是0，最大宽高是无限大（double.infinity）
          constraints: const BoxConstraints.tightForFinite(height: 60),
          alignment: Alignment.center,
          color: Colors.blue,
          child: const Text('设置固定宽高（不限宽度）'),
        ),
        const Divider(),
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

class SizedBoxPage extends BaseStatelessWidget {
  SizedBoxPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        SpaceDivider(),
        SizedBox(
          width: 200,
          height: 100,
          child: _buildContainer('固定宽高的SizedBox'),
        ),
        const SizedBox(height: 15), //SizedBox非常适合控制2个组件之间的空隙
        SizedBox(
          width: double.infinity, //设置尺寸无限大
          height: 100,
          //虽然设置了无限大，子控件依然会受到父组件的约束，会扩展到父组件的尺寸
          child: SizedBox.expand(
            child: _buildContainer('无限宽度'),
          ),
        ),
      ],
    );
  }

  _buildContainer(String title) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}

class AspectRatioPage extends BaseStatelessWidget {
  AspectRatioPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        Container(
          width: 300,
          height: 300,
          color: Colors.blue,
          alignment: Alignment.center,
          child: AspectRatio(
            //宽高比，可以直接写成分数的形式，也可以写成小数的形式，但建议写成分数的形式，可读性更高
            aspectRatio: 2 / 1,
            child: Container(color: Colors.red),
          ),
        )
      ],
    );
  }
}
