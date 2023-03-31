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
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                '宽高比为2：1',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FractionallySizedBoxPage extends BaseStatelessWidget {
  FractionallySizedBoxPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          //FractionallySizedBox是一个相对父组件尺寸的组件，比如占父组件的70%
          child: FractionallySizedBox(
            //通过alignment参数控制子组件显示的位置，默认为居中
            alignment: Alignment.center,
            widthFactor: .8,
            heightFactor: .3,
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                '宽度80%，高度30%',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ExpandedFlexibleSpacerPage extends BaseStatelessWidget {
  ExpandedFlexibleSpacerPage({required super.title});

  @override
  Widget build(BuildContext context) {
    //Expanded、Flexible和Spacer都是具有权重属性的组件，可以控制Row、Column、Flex的子控件如何布局的组件。
    //1.Spacer是通过Expanded实现的，Expanded继承自Flexible。
    //2.填满剩余空间直接使用Expanded更方便。
    //3.Spacer用于撑开Row、Column、Flex的子组件的空隙。
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: 'Flexible中间填充',
          child: Row(
            children: [
              Container(color: Colors.blue, height: 50, width: 100),
              Flexible(child: Container(color: Colors.red, height: 50)),
              Container(color: Colors.blue, height: 50, width: 100),
            ],
          ),
        ),
        TitleLayout(
          title: 'Flexible按1、2、3摆放',
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    '1 Flex/ 6 Total',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    '2 Flex/ 6 Total',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.green,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    '3 Flex/ 6 Total',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        TitleLayout(
          title: 'Flexible中间填充，添加了Text子控件',
          child: Row(
            children: [
              Container(color: Colors.blue, width: 100, height: 50),
              Flexible(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  child: const Text(
                    'Container',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(color: Colors.blue, width: 100, height: 50),
            ],
          ),
        ),
        TitleLayout(
          title: 'Flexible中间填充，添加了Text子控件，设置Flexible的fit为FlexFit.tight',
          child: Row(
            children: [
              Container(color: Colors.blue, width: 100, height: 50),
              Flexible(
                //Flexible中fit参数表示填满剩余空间的方式，说明如下：
                //tight：必须（强制）填满剩余空间。
                //loose：尽可能大的填满剩余空间，但是可以不填满（默认）。
                fit: FlexFit.tight,
                child: Container(
                  color: Colors.red,
                  height: 50,
                  child: const Text(
                    'Container',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(color: Colors.blue, width: 100, height: 50),
            ],
          ),
        ),
        TitleLayout(
          title: 'Flexible中间填充，添加了Text子控件并设置Text的alignment为Alignment.center',
          child: Row(
            children: [
              Container(color: Colors.blue, width: 100, height: 50),
              Flexible(
                child: Container(
                  color: Colors.red,
                  //Container 默认是适配子控件大小的，但当设置对齐方式时 Container 将会填满父组件，因此是否填满剩余空间取决于子组件是否需要填满父组件。
                  alignment: Alignment.center,
                  height: 50,
                  child: const Text(
                    'Container',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(color: Colors.blue, width: 100, height: 50),
            ],
          ),
        ),
        //Expanded继承自Flexible，fit参数固定为FlexFit.tight，也就是说Expanded必须（强制）填满剩余空间。
        TitleLayout(
          title: 'Expanded中间填充，添加了Text子控件',
          child: Row(
            children: [
              Container(color: Colors.blue, width: 100, height: 50),
              Expanded(
                child: Container(
                  color: Colors.red,
                  height: 50,
                  child: const Text(
                    'Container',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(color: Colors.blue, width: 100, height: 50),
            ],
          ),
        ),
        //Spacer的本质也是Expanded实现的，和Expanded的区别是：Expanded可以设置子控件，而Spacer的子控件尺寸是0，
        //因此Spacer适用于撑开 Row、Column、Flex 的子控件的空隙
        TitleLayout(
          title: 'Spacer',
          child: Row(
            children: [
              Container(color: Colors.green, width: 100, height: 50),
              const Spacer(flex: 2),
              Container(color: Colors.red, width: 100, height: 50),
              Container(color: Colors.blue, width: 100, height: 50),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ],
    );
  }
}
