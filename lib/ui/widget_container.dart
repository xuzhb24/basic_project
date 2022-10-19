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

  //黑色边框
  Widget BlackBorder({required String title, required Widget child}) {
    return TitleLayout(
      title: title,
      centerTitle: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: child,
      ),
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
