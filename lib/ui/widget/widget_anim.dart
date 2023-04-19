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
