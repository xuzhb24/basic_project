import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

/// ConstrainedBox：适用于需要设置最大/小宽高，组件大小依赖子组件大小，但不能超过设置的界限。
/// UnconstrainedBox：用到情况不多，当作ConstrainedBox的子组件可以“突破”ConstrainedBox的限制，超出界限的部分会被截取。
/// SizedBox：适用于固定宽高的情况，常用于当作2个组件之间间隙组件。
/// AspectRatio：适用于固定宽高比的情况。
/// FractionallySizedBox：适用于占父组件百分比的情况。
/// LimitedBox：适用于没有父组件约束的情况。
/// Container：适用于不仅有尺寸的约束，还有装饰（颜色、边框、等）、内外边距等需求的情况。
class BoxPage extends BaseStatelessWidget {
  const BoxPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        //1、ConstrainedBox组件约束子组件的最大宽高和最小宽高
        ConstrainedBox(
          //BoxConstraints.tight(Size size)和BoxConstraints.expand()
          constraints: const BoxConstraints(maxWidth: 200, maxHeight: 60),
          //子组件是无法突破BoxConstraints设置的最大宽高
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: const Text('ConstrainedBox'),
          ),
        ),
        const Divider(),
        //多级BoxConstraints嵌套约束最大值最终值等于多个BoxConstraints约束中的最小值；
        //同理嵌套约束最小值等于多个BoxConstraints约束中的最大值
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200, maxHeight: 60),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 100),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.red,
              child: const Text('ConstrainedBox'),
            ),
          ),
        ),
        const Divider(),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 200, minHeight: 60),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 250, minHeight: 100),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: const Text('ConstrainedBox'),
            ),
          ),
        ),
        const Divider(),
        SpaceDivider(height: 30),
        Container(
          width: 200,
          height: 200,
          //2、UnconstrainedBox组件不对子组件做任何约束，但仍然受父控件的约束，超出父控件的区域将会截取
          child: UnconstrainedBox(
            //设置对齐方式
            alignment: Alignment.center,
            child: Container(
              width: 250,
              height: 250,
              color: Colors.red,
              child: const Text('UnconstrainedBox'),
            ),
          ),
        ),
        SpaceDivider(height: 30),
        const Divider(),
        //3、SizedBox是具有固定宽高的组件
        SizedBox(
          width: 200,
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("SizedBox"),
          ),
        ),
        const Divider(),
        //4、AspectRatio组件是固定宽高比的组件
        AspectRatio(
          //宽高比，可以直接写成分数的形式，也可以写成小数的形式，但建议写成分数的形式，可读性更高
          aspectRatio: 2 / 1,
          child: Container(
            color: Colors.red,
            child: const Text('AspectRatio 长宽比2/1'),
          ),
        ),
        const Divider(),
        //5、FractionallySizedBox：当我们需要一个控件的尺寸是相对尺寸时，比如当前按钮的宽度占父组件的70%，
        //可以使用FractionallySizedBox来实现此效果
        FractionallySizedBox(
          widthFactor: .7,
          alignment: Alignment.centerLeft, //控制子组件显示的位置，默认为center
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('FractionallySizedBox'),
          ),
        ),
        const Divider(),
        Container(
          height: 200,
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.red,
              ),
              const Flexible(
                //如果想让2个控件之间的间隔是当前父控件的20%，可以使用无子控件的FractionallySizedBox
                child: FractionallySizedBox(
                  heightFactor: .2,
                  child: Text('FractionallySizedBox'),
                ),
              ),
              Container(
                height: 50,
                color: Colors.red,
              ),
            ],
          ),
        ),
        const Divider(),
        Container(
          width: 100,
          height: 100,
          //6、LimitedBox组件是当不受父组件约束时限制它的尺寸
          //上面的组件它们都会对子组件约束，没有约束的父组件有ListView、Row、Column等，
          //如果LimitedBox的父组件受到约束，此时LimitedBox将会不做任何操作，可以认为没有这个组件
          child: LimitedBox(
            maxWidth: 100,
            maxHeight: 50,
            child: Container(
              color: Colors.green,
              child: const Text('LimitedBox\n父组件被约束'),
            ),
          ),
        ),
        const Divider(),
        //下面的ListView不可见，因为在容器不受约束时，大小将会设置0
        ListView(
          shrinkWrap: true,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.red)
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: [
            const Text('LimitedBox 父组件不被约束'),
            LimitedBox(
              maxHeight: 100,
              child: Container(color: Colors.green),
            ),
            LimitedBox(
              maxHeight: 100,
              child: Container(color: Colors.red),
            ),
            const Divider(),
            //7、Container
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: const Text('Container'),
            )
          ],
        )
      ],
    );
  }
}

///Row和Column是多子控件的容器类控件，Row控件水平布局，Column控件垂直布局
class RowColumnPage extends BaseStatelessWidget {
  RowColumnPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        //mainAxisAlignment：主轴对齐方式，默认值是MainAxisAlignment.start
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.start',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.center',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.end',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.spaceBetween',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.spaceEvenly',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式：MainAxisAlignment.spaceAround',
          child: Row(
            //spaceAround和spaceEvenly区别是：
            //spaceAround：第一个子控件距开始位置和最后一个子控件距结尾位置是其他子控件间距的一半
            //spaceEvenly：所有间距一样
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        //crossAxisAlignment：交叉轴对齐方式，默认是CrossAxisAlignment.center
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.start',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.center',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.end',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式：CrossAxisAlignment.stretch',
          child: SizedBox(
            height: 150,
            child: Row(
              //CrossAxisAlignment.stretch表示使子控件填满交叉轴
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 100, height: 50, color: Colors.red),
                Container(width: 100, height: 100, color: Colors.green),
                Container(width: 100, height: 150, color: Colors.yellow),
              ],
            ),
          ),
        ),
        //textDirection
        BlackBorder(
          title: '水平方向布局：TextDirection.ltr',
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '水平方向布局：TextDirection.rtl',
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 100, color: Colors.green),
              Container(width: 100, height: 150, color: Colors.yellow),
            ],
          ),
        ),
        //verticalDirection，默认值是VerticalDirection.down
        BlackBorder(
          title: '垂直方向布局：VerticalDirection.up',
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        BlackBorder(
          title: '垂直方向布局：VerticalDirection.down',
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
        //主轴尺寸，默认值是MainAxisSize.max
        BlackBorder(
          title: '主轴尺寸：MainAxisSize.min',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 100, height: 50, color: Colors.red),
              Container(width: 100, height: 50, color: Colors.green),
              Container(width: 100, height: 50, color: Colors.yellow),
            ],
          ),
        ),
      ],
    );
  }
}

class StackPage extends BaseStatefulWidget {
  StackPage({required super.title});

  @override
  State<StatefulWidget> createState() => StatePageState();
}

class StatePageState extends State<StackPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: '简单叠加',
          child: Stack(
            children: [
              Container(width: 200, height: 200, color: Colors.red),
              Container(width: 170, height: 170, color: Colors.blue),
              Container(width: 140, height: 140, color: Colors.yellow),
            ],
          ),
        ),
        //未定位的子组件：没有使用Positioned包裹的子组件
        //Stack未定位的子组件大小由fit参数决定，默认值是StackFit.loose，表示子组件自己决定，
        //StackFit.expand表示尽可能的大
        TitleLayout(
          title: '未定位的子组件大小：StackFit.loose',
          child: Container(
            width: 250,
            height: 250,
            color: Colors.grey,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(width: 200, height: 200, color: Colors.red),
                Container(width: 170, height: 170, color: Colors.blue),
                Container(width: 140, height: 140, color: Colors.yellow),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '未定位的子组件大小：StackFit.expand',
          child: Container(
            width: 250,
            height: 250,
            color: Colors.grey,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(width: 200, height: 200, color: Colors.red),
                Container(width: 170, height: 170, color: Colors.blue),
                Container(width: 140, height: 140, color: Colors.yellow),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '未定位的子组件对齐方式：Alignment.center',
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.red),
              Container(width: 170, height: 170, color: Colors.blue),
              Container(width: 140, height: 140, color: Colors.yellow),
            ],
          ),
        ),
        //使用Positioned包裹的子组件就是定位的子组件
        //Positioned用于定位Stack子组件，Positioned必须是Stack的子组件
        //提供top、bottom、left、right四种定位属性，分别表示距离上下左右的距离
        //Positioned提供便捷的构建方式，比如Positioned.fromRect、Positioned.fill等
        TitleLayout(
          title: '使用Positioned定位',
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.red),
              Positioned(
                //左边距
                left: 10,
                //上边距
                top: 10,
                //右边距
                right: 10,
                //下边距
                bottom: 10,
                child: Container(color: Colors.green),
              )
            ],
          ),
        ),
        //IndexedStack是Stack的子类，Stack是将所有的子组件叠加显示，而IndexedStack只显示指定的子组件
        TitleLayout(
          title: 'IndexedStack',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IndexedStack(
                index: _index,
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.fastfood,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.cake,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.local_cafe,
                        size: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _index = 0;
                      });
                    },
                    icon: const Icon(Icons.fastfood),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _index = 1;
                      });
                    },
                    icon: const Icon(Icons.cake),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _index = 2;
                      });
                    },
                    icon: const Icon(Icons.local_cafe),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class WrapPage extends BaseStatelessWidget {
  WrapPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        BlackBorder(
          title: 'Wrap流式布局',
          child: Wrap(
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '布局方向\ndirection: Axis.horizontal',
          child: Wrap(
            direction: Axis.horizontal,
            children: List.generate(4, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'direction: Axis.vertical',
          child: Wrap(
            direction: Axis.vertical,
            children: List.generate(4, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '主轴对齐方式\nalignment: WrapAlignment.start',
          child: Wrap(
            alignment: WrapAlignment.start,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.center',
          child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.end',
          child: Wrap(
            alignment: WrapAlignment.end,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.spaceBetween',
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.spaceEvenly',
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'alignment: WrapAlignment.spaceAround',
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '交叉轴对齐方式\ncrossAxisAlignment: WrapCrossAlignment.start',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              double height = 50.0 + 5 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'crossAxisAlignment: WrapCrossAlignment.center',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              double height = 50.0 + 5 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'crossAxisAlignment: WrapCrossAlignment.end',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              double height = 50.0 + 5 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        //runAlignment属性控制Wrap的主轴垂直方向每一行的对齐方式，与alignment的区别：
        //alignment是主轴方向上对齐方式，作用于每一行。
        //runAlignment是垂直主轴方向上将每一行看作一个整体的对齐方式。
        BlackBorder(
          title: '主轴垂直方向每一行的对齐方式\nrunAlignment: WrapAlignment.start',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.start,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.center',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.end',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.end,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.spaceBetween',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.spaceBetween,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.spaceEvenly',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: 'runAlignment: WrapAlignment.spaceAround',
          child: Container(
            height: 200,
            child: Wrap(
              runAlignment: WrapAlignment.spaceAround,
              children: List.generate(9, (index) {
                double width = 50.0 + 10 * index;
                double height = 50;
                return Container(
                  color: Colors.primaries[index],
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: Text('$index'),
                );
              }),
            ),
          ),
        ),
        BlackBorder(
          title: '间隔\nspacing: 10',
          child: Wrap(
            spacing: 10,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'runSpacing: 10',
          child: Wrap(
            runSpacing: 10,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '主轴方向上子控件的方向\ntextDirection: TextDirection.ltr',
          child: Wrap(
            textDirection: TextDirection.ltr,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'textDirection: TextDirection.rtl',
          child: Wrap(
            textDirection: TextDirection.rtl,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: '交叉轴方向上子控件的方向\nverticalDirection: VerticalDirection.up',
          child: Wrap(
            verticalDirection: VerticalDirection.up,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
        BlackBorder(
          title: 'verticalDirection: VerticalDirection.down',
          child: Wrap(
            verticalDirection: VerticalDirection.down,
            children: List.generate(10, (index) {
              double width = 50.0 + 10 * index;
              return Container(
                color: Colors.primaries[index],
                width: width,
                height: 50,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ),
      ],
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

class TabBarPage extends BaseStatefulWidget {
  TabBarPage({required super.title});

  @override
  State<StatefulWidget> createState() => TabBarPageState();
}

class TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  final List<String> _tabValues = [
    '语文',
    '英语',
    '化学',
    '物理',
    '数学',
    '生物',
    '体育',
    '经济',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabValues.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    /**
     * TabBar属性：
     * tabs               	一系列标签控件
     * controller         	标签选择变化控制器
     * isScrollable       	是否可滚动，默认false
     * indicatorColor     	指示器颜色
     * indicatorWeight    	指示器粗细
     * indicator	          指示器，可自定义形状等样式
     * indicatorSize	      指示器长短，tab：和tab一样长，label：和标签label 一样长
     * labelColor         	标签颜色
     * labelStyle	          标签样式
     * labelPadding       	标签padding
     * unselectedLabelColor	未选中标签颜色
     * unselectedLabelStyle	未选中标签样式
     *
     * TabBarView属性：
     * children	  一系列子控件，如果和TabBar一起使用注意和TabBar的长度一样
     * controller	控制器，如果和TabBar一起使用注意和TabBar使用同一个controller
     */
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: TabBar(
          tabs: _tabValues.map((e) => Text(e)).toList(),
          controller: _controller,
          isScrollable: true,
          indicatorColor: Colors.red,
          indicatorWeight: 3.0,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.red,
          labelStyle: const TextStyle(fontSize: 16, height: 2),
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          unselectedLabelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues
            .map((e) => Center(
                child: Text(e,
                    style: const TextStyle(color: Colors.black, fontSize: 20))))
            .toList(),
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
