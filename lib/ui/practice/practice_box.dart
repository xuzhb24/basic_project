import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../../func/router_table.dart';

///定位装饰权重组件实战
class BoxPracticePage extends BaseStatelessWidget {
  BoxPracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.boxPractice1,
        RouterTable.boxPractice2,
      ],
    );
  }
}

class BoxPracticePage1 extends BaseStatelessWidget {
  BoxPracticePage1({required super.title});

  _buildCircleImg() {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('images/logo.png'),
        ),
      ),
    );
  }

  _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('标题', style: TextStyle(fontSize: 20)),
        SizedBox(height: 5),
        Text('这是简介', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.grey.withOpacity(.5),
        alignment: Alignment.center,
        child: Container(
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              const SizedBox(width: 15),
              _buildCircleImg(),
              const SizedBox(width: 20),
              Expanded(child: _buildCenter()),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxPracticePage2 extends BaseStatefulWidget {
  BoxPracticePage2({required super.title});

  @override
  State<StatefulWidget> createState() => BoxPracticePage2State();
}

class BoxPracticePage2State extends State<BoxPracticePage2> {
  final double _width = 20.0;
  List<double> _heightList = [40, 80.0, 140.0, 100.0, 20, 120.0, 60.0, 160];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 200,
          child: Stack(
            children: [
              AxisWidget(),
              Positioned.fill(
                left: 5,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    _heightList.length,
                    (index) => CylinderWidget(
                      _width,
                      _heightList[index],
                      Colors.primaries[index % Colors.primaries.length],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 30,
                child: OutlinedButton(
                  child: const Text('反转'),
                  onPressed: () {
                    setState(() {
                      _heightList = _heightList.reversed.toList();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//坐标轴
class AxisWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black, width: 2),
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}

//单个柱状图
class CylinderWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  CylinderWidget(this.width, this.height, this.color);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: width,
      height: height,
      color: color,
    );
  }
}
