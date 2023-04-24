import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../../func/constant.dart';

///滚动和大数据组件实战
class ScrollPracticePage extends BaseStatelessWidget {
  ScrollPracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.scrollPractice1,
      ],
    );
  }
}

class ScrollPracticePage1 extends BaseStatefulWidget {
  ScrollPracticePage1({required super.title});

  @override
  State<StatefulWidget> createState() => ScrollPracticePage1State();
}

class ScrollPracticePage1State extends State<ScrollPracticePage1> {
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
    _controller?.dispose();
    super.dispose();
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
