import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

///动画组件
class AnimationControllerPage extends BaseStatefulWidget {
  AnimationControllerPage({required super.title});

  @override
  State<StatefulWidget> createState() => AnimationControllerPageState();
}

class AnimationControllerPageState extends State<AnimationControllerPage>
    with TickerProviderStateMixin {
  double _size = 100;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    //vsync：当创建AnimationController时，需要传递一个vsync参数，存在vsync时会防止屏幕外动画消耗不必要的资源，
    //单个AnimationController的时候使用SingleTickerProviderStateMixin，多个AnimationController使用TickerProviderStateMixin。
    //duration：表示动画执行的时间。
    //1.第一种方式
    // _controller = AnimationController(
    //     vsync: this, duration: const Duration(seconds: 1))
    //   ..addListener(() {
    //     //每一帧都会回调addListener，在此回调中设置蓝色盒子大小，蓝色的大小是由100变到200，而AnimationController的值默认是0到1，
    //     //所以蓝色大小等于_size = 100+100*_controller.value
    //     setState(() {
    //       _size = 100 + 100 * _controller!.value;
    //     });
    //   });
    //2.第二种方式
    //也可以通过参数形式设置最大值和最小值，此时_controller.value的值就是从100变化到200。
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: 100,
        upperBound: 200)
      ..addListener(() {
        setState(() {
          _size = _controller!.value;
        });
      })
      ..addStatusListener((status) {
        //监听动画状态的变化
        //动画的状态分为四种：
        //dismissed：动画停止在开始处。
        //forward：动画正在从开始处运行到结束处（正向运行）。
        //reverse：动画正在从结束处运行到开始处（反向运行）。
        //completed：动画停止在结束处。
        print('status:$status');
        //再来看下动画的控制方法：
        //forward：正向执行动画。
        //reverse：反向执行动画。
        //repeat：反复执行动画。
        //reset：重置动画。
        if (status == AnimationStatus.completed) {
          _controller?.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller?.forward();
        }
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
        child: GestureDetector(
          onTap: () {
            setState(() {
              _controller?.forward();
            });
          },
          child: Container(
            width: _size,
            height: _size,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              '点我变大',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class TweenPage extends BaseStatefulWidget {
  TweenPage({required super.title});

  @override
  State<StatefulWidget> createState() => TweenPageState();
}

class TweenPageState extends State<TweenPage> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color?>? _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    //Tween仅仅是映射，动画的控制依然由AnimationController控制，因此需要Tween.animate(_controller)将控制器传递给Tween。
    _animation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller!);
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
        child: GestureDetector(
          onTap: () {
            _controller?.forward();
          },
          child: Container(
            width: 200,
            height: 200,
            color: _animation!.value,
            alignment: Alignment.center,
            child: const Text(
              '点我变色',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePage extends BaseStatelessWidget {
  CurvePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.curve1,
        RouterTable.curve2,
      ],
    );
  }
}

class CurvePage1 extends BaseStatefulWidget {
  CurvePage1({required super.title});

  @override
  State<StatefulWidget> createState() => CurvePage1State();
}

class CurvePage1State extends State<CurvePage1> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    //蓝色盒子大小100变大到200，动画曲线设置为bounceIn（弹簧效果）
    //系统已经提供了38种常用到动画曲线：linear、decelerate、bounceIn、bounceOut、elasticIn
    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(_controller!);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //动画中还有一个重要的概念就是Curve，即动画执行曲线。Curve的作用和Android中的Interpolator（差值器）是一样的，
    //负责控制动画变化的速率，通俗地讲就是使动画的效果能够以匀速、加速、减速、抛物线等各种速率变化。
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller?.forward();
          },
          child: Container(
            width: _animation!.value,
            height: _animation!.value,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              '点我变大',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePage2 extends BaseStatefulWidget {
  CurvePage2({required super.title});

  @override
  State<StatefulWidget> createState() => CurvePage2State();
}

class CurvePage2State extends State<CurvePage2> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    //蓝色盒子大小100变大到200，动画曲线设置为bounceIn（弹簧效果）
    //系统已经提供了38种常用到动画曲线：linear、decelerate、bounceIn、bounceOut、elasticIn
    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: StairsCurve(6)))
        .animate(_controller!);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //动画中还有一个重要的概念就是Curve，即动画执行曲线。Curve的作用和Android中的Interpolator（差值器）是一样的，
    //负责控制动画变化的速率，通俗地讲就是使动画的效果能够以匀速、加速、减速、抛物线等各种速率变化。
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller?.forward();
          },
          child: Container(
            width: _animation!.value,
            height: _animation!.value,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              '点我变大',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class StairsCurve extends Curve {
  //阶梯的数量
  final int num;
  double? _perStairX;
  double? _perStairY;

  StairsCurve(this.num) {
    _perStairX = 1.0 / num;
    _perStairY = 1.0 / (num - 1);
  }

  @override
  double transformInternal(double t) {
    //自定义动画曲线需要继承Curve重写transformInternal方法即可
    //下面是一个楼梯效 的动画曲线
    return _perStairY! *
        (t / _perStairX!).floor(); //直接返回t其实就是线性动画，即Curves.linear
  }
}

class IntervalPage extends BaseStatefulWidget {
  IntervalPage({required super.title});

  @override
  State<StatefulWidget> createState() => IntervalPageState();
}

class IntervalPageState extends State<IntervalPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation _sizeAanimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          });
    //Flutter中组合动画使用Interval，Interval继承自Curve，
    //Interval中begin和end参数值的范围是0.0到1.0，下面实现一个先执行颜色变化，再执行大小变化
    //也可以设置同时动画，只需将2个Interval的值都改为Interval(0.0, 1.0)
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)));
    _sizeAanimation = Tween(begin: 100.0, end: 300.0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: _sizeAanimation.value,
            height: _sizeAanimation.value,
            color: _colorAnimation.value,
            alignment: Alignment.center,
            child: const Text(
              '开始动画',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedListPage extends BaseStatefulWidget {
  AnimatedListPage({required super.title});

  @override
  State<StatefulWidget> createState() => AnimatedListPageState();
}

class AnimatedListPageState extends State<AnimatedListPage>
    with SingleTickerProviderStateMixin {
  List<int> _list = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void _addItem() {
    final int index = _list.length;
    _list.insert(index, index);
    _listKey.currentState?.insertItem(index);
  }

  void _removeItem() {
    final int index = _list.length - 1;
    var item = _list[index].toString();
    _listKey.currentState?.removeItem(
        index, (context, animation) => _buildItem(item, animation));
    _list.removeAt(index);
  }

  Widget _buildItem(String item, Animation<double> animation) {
    //实现“左进右出”的动画效果
    // return SlideTransition(
    //   position: animation
    //       .drive(CurveTween(curve: Curves.easeIn))
    //       .drive(Tween(begin: const Offset(1, 1), end: const Offset(0, 1))),
    //   child: Card(
    //     color: Colors.blue,
    //     child: ListTile(
    //       title: Text(item),
    //     ),
    //   ),
    // );
    //实现从上掉落的效果
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.blue,
        child: ListTile(title: Text(item)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedList(
        key: _listKey,
        //item的个数
        initialItemCount: _list.length,
        //一个函数，列表的每一个索引会调用，这个函数有一个animation参数，可以设置成任何一个动画
        itemBuilder: (context, index, animation) =>
            _buildItem(_list[index].toString(), animation),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => _addItem(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 60),
          FloatingActionButton(
            onPressed: () => _removeItem(),
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

class HeroPage extends BaseStatefulWidget {
  HeroPage({required super.title});

  @override
  State<StatefulWidget> createState() => HeroPageState();
}

class HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    //Hero是我们常用的过渡动画，当用户点击一张图片，切换到另一个页面时，
    //这个页面也有此图，那么使用Hero组件就在合适不过了
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
        children: List.generate(10, (index) {
          if (index == 6) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeroDetailPage(title: '详情页')));
              },
              child: Hero(
                tag: 'hero',
                child: Container(
                  child: Image.asset(
                    'images/cc.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          }
          return Container(color: Colors.red);
        }),
      ),
    );
  }
}

class HeroDetailPage extends BaseStatelessWidget {
  HeroDetailPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: 'hero',
            child: Image.asset('images/cc.png'),
          ),
        ),
      ),
    );
  }
}
