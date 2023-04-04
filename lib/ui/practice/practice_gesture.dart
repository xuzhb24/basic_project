import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../../func/router_table.dart';

///手势识别组件实战
class GesturePracticePage extends BaseStatelessWidget {
  GesturePracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.gesturePractice1,
        RouterTable.gesturePractice2,
      ],
    );
  }
}

class GesturePracticePage1 extends BaseStatefulWidget {
  GesturePracticePage1({required super.title});

  @override
  State<StatefulWidget> createState() => GesturePracticePage1State();
}

class GesturePracticePage1State extends State<GesturePracticePage1> {
  ButtonStatus _buttonStatus = ButtonStatus.none;

  _buildChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return const Text(
        '登录',
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return const CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return const Icon(
        Icons.check,
        size: 38,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          minWidth: 240,
          height: 60,
          onPressed: () {
            setState(() {
              _buttonStatus = ButtonStatus.loading;
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _buttonStatus = ButtonStatus.done;
                });
              });
            });
          },
          child: _buildChild(),
        ),
      ),
    );
  }
}

enum ButtonStatus { none, loading, done }

class GesturePracticePage2 extends BaseStatefulWidget {
  GesturePracticePage2({required super.title});

  @override
  State<StatefulWidget> createState() => GesturePracticePage2State();
}

class GesturePracticePage2State extends State<GesturePracticePage2> {
  final List<List<Offset>> _path = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Listener(
        onPointerDown: (v) {
          setState(() {
            _path.add([v.localPosition]);
          });
        },
        onPointerMove: (v) {
          setState(() {
            _path[_path.length - 1].add(v.localPosition);
          });
        },
        onPointerUp: (v) {
          setState(() {
            _path[_path.length - 1].add(v.localPosition);
          });
        },
        onPointerCancel: (v) {
          _path[_path.length - 1].add(v.localPosition);
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: DrawingBoardPainter(_path),
          ),
        ),
      ),
    );
  }
}

class DrawingBoardPainter extends CustomPainter {
  final List<List<Offset>> path;

  DrawingBoardPainter(this.path);

  final Paint _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    for (var list in path) {
      Path path = Path();
      for (int i = 0; i < list.length; i++) {
        if (i == 0) {
          path.moveTo(list[i].dx, list[i].dy);
        } else {
          path.lineTo(list[i].dx, list[i].dy);
        }
      }
      canvas.drawPath(path, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
