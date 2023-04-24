import 'dart:math';
import 'dart:ui' as ui;

import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

import '../../func/router_table.dart';

///基础组件实战
class AnimPracticePage extends BaseStatelessWidget {
  AnimPracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      widgetList: [
        RouterTable.animPractice1,
        RouterTable.animPractice2,
        RouterTable.animPractice3,
        RouterTable.animPractice4,
        RouterTable.animPractice5,
        RouterTable.animPractice6,
        RouterTable.animPractice7,
        // RouterTable.animPractice8,
        // RouterTable.animPractice9,
      ],
    );
  }
}

class AnimPracticePage1 extends BaseStatefulWidget {
  AnimPracticePage1({required super.title});

  @override
  State<StatefulWidget> createState() => AnimPracticePage1State();
}

class AnimPracticePage1State extends State<AnimPracticePage1>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _colorController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() {
        setState(() {});
      });
    _sizeAnimation = _sizeController
        .drive(CurveTween(curve: Curves.linear))
        .drive(Tween(begin: 100.0, end: 200.0));
    _colorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..addListener(() {
        setState(() {});
      });
    _colorAnimation = _colorController
        .drive(CurveTween(curve: Curves.bounceIn))
        .drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }

  @override
  void dispose() {
    _colorController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //AnimationController 、Tween 、Curve是整个动画的基础：
    //AnimationController：动画控制器，控制动画的播放、停止等。继承自Animation<double>，是一个特殊的Animation对象，
    //默认情况下它会线性的生成一个0.0到1.0的值，类型只能是double类型，不设置动画曲线的情况下，可以设置输出的最小值和最大值。
    //Curve：动画曲线，作用和Android中的Interpolator（差值器）类似，负责控制动画变化的速率，
    //通俗地讲就是使动画的效果能够以匀速、加速、减速、抛物线等各种速率变化。
    //Tween：将AnimationController生成的[0,1]值映射成其他属性的值，比如颜色、样式等。
    //完成一个动画效果的过程如下：
    //1.创建AnimationController 。
    //2.如果需要Tween或者Curve，将AnimationController与其关联，Tween和Curve并不是必须的，当然大部分情况都需要。
    //3.将动画值作用于组件，当没有Tween和Curve时，动画值来源于AnimationController，如果有Tween和Curve，动画值来源于Tween或者Curve的Animation。
    return ScaffoldLayout(
      title: widget.title,
      child: Center(
        child: GestureDetector(
          onTap: () {
            _sizeController.forward();
            _colorController.forward();
          },
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: _colorAnimation.value,
            alignment: Alignment.center,
            child: const Text(
              '点我变化',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimPracticePage2 extends BaseStatelessWidget {
  AnimPracticePage2({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: title,
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(context, CustomPageRoute(this, TwoPage()));
          },
          child: const Text('跳转'),
        ),
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget currentPage;
  final Widget nextPage;

  //pageBuilder表示跳转的页面。
  //transitionsBuilder表示页面的动画效果，默认没有动画效果。
  CustomPageRoute(this.currentPage, this.nextPage)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => currentPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              Stack(
            children: [
              SlideTransition(
                position: Tween(
                  begin: const Offset(0, 0),
                  end: const Offset(0, -1),
                ).animate(animation),
                child: currentPage,
              ),
              SlideTransition(
                position: Tween(
                  begin: const Offset(0, 1),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: nextPage,
              )
            ],
          ),
        );
}

class AnimPracticePage3 extends BaseStatelessWidget {
  AnimPracticePage3({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: title,
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
                context, CirclePageRoute(builder: (context) => TwoPage()));
          },
          child: const Text('跳转'),
        ),
      ),
    );
  }
}

class CirclePageRoute extends PageRoute {
  CirclePageRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder? builder;

  @override
  Color? barrierColor;

  @override
  String? barrierLabel;

  @override
  final bool maintainState;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => ClipPath(
        clipper: CirclePath(animation.value),
        child: child,
      ),
      child: builder!(context),
    );
  }
}

class CirclePath extends CustomClipper<Path> {
  final double value;

  CirclePath(this.value);

  @override
  Path getClip(Size size) {
    var path = Path();
    double radius =
        value * sqrt(size.width * size.width + size.height * size.height);
    path.addOval(Rect.fromLTRB(
        size.width - radius, -radius, size.width + radius, radius));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: '页面二',
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}

class AnimPracticePage4 extends BaseStatelessWidget {
  AnimPracticePage4({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: title,
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 3),
            builder: (context, double value, child) => CustomPaint(
              painter: CircleProgressPainter(value),
              child: Center(
                child: Text('${(value * 100).floor()}%'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;

  CircleProgressPainter(this.progress);

  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;
    Gradient gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: pi * 2 * progress,
      colors: const [
        Color(0xFFD32D2F),
        Color(0xFFEA4886),
      ],
    );
    var rect = Rect.fromLTWH(0, 0, radius * 2, radius * 2);
    _paint.shader = gradient.createShader(rect);
    canvas.save();
    canvas.translate(0.0, size.height);
    canvas.rotate(-pi / 2);
    canvas.drawArc(rect, 0, pi * 2 * progress, false, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AnimPracticePage5 extends BaseStatelessWidget {
  AnimPracticePage5({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
        title: title,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              JumpButton('3D变换Demo', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimPracticePage51(title: '3D变换Demo'),
                  ),
                );
              }),
              const SizedBox(height: 12),
              JumpButton('翻书效果', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimPracticePage52(title: '翻书效果'),
                  ),
                );
              })
            ],
          ),
        ));
  }
}

class AnimPracticePage51 extends BaseStatefulWidget {
  AnimPracticePage51({required super.title});

  @override
  State<StatefulWidget> createState() => AnimPracticePage51State();
}

class AnimPracticePage51State extends State<AnimPracticePage51> {
  double _rotateX = .0;
  double _rotateY = .0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(_rotateX)
        ..rotateY(_rotateY),
      alignment: Alignment.center,
      child: ScaffoldLayout(
        title: widget.title,
        child: GestureDetector(
          onPanUpdate: (v) {
            setState(() {
              _rotateX += v.delta.dy * .01;
              _rotateY += v.delta.dx * -.01;
            });
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const Text('3D变换Demo'),
          ),
        ),
      ),
    );
  }
}

class AnimPracticePage52 extends BaseStatefulWidget {
  AnimPracticePage52({required super.title});

  @override
  State<StatefulWidget> createState() => AnimPracticePage52State();
}

class AnimPracticePage52State extends State<AnimPracticePage52>
    with TickerProviderStateMixin {
  final child1 = Container(
    width: 300,
    height: 400,
    child: Image.asset(
      'images/flower1.jpg',
      fit: BoxFit.cover,
    ),
  );
  final child2 = Container(
    width: 300,
    height: 400,
    child: Image.asset(
      'images/flower2.jpg',
      fit: BoxFit.cover,
    ),
  );

  late AnimationController _controller;
  late Animation _animation1;
  late Animation _animation2;
  late Widget _child1;
  late Widget _child2;
  late Widget _child3;
  late Widget _child4;

  @override
  void initState() {
    super.initState();
    _child1 = ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: 0.5,
        child: child1,
      ),
    );
    _child2 = ClipRect(
      child: Align(
        alignment: Alignment.centerRight,
        widthFactor: 0.5,
        child: child1,
      ),
    );
    _child3 = ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: 0.5,
        child: child2,
      ),
    );
    _child4 = ClipRect(
      child: Align(
        alignment: Alignment.centerRight,
        widthFactor: 0.5,
        child: child2,
      ),
    );

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    _animation1 = Tween(begin: .0, end: pi / 2).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(.0, .5)));
    _animation2 = Tween(begin: -pi / 2, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(.5, 1.0)));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: '翻书效果',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              _child1,
              Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animation2.value),
                child: _child3,
              ),
            ],
          ),
          Container(
            width: 3,
            color: Colors.white,
          ),
          Stack(
            children: [
              _child4,
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animation1.value),
                child: _child2,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AnimPracticePage6 extends BaseStatelessWidget {
  AnimPracticePage6({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: title,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: WaterRipple(),
        ),
      ),
    );
  }
}

class WaterRipple extends StatefulWidget {
  WaterRipple({
    this.count = 3,
    this.color = const Color(0xFF0080ff),
  });

  final int count;
  final Color color;

  @override
  State<StatefulWidget> createState() => WaterRippleState();
}

class WaterRippleState extends State<WaterRipple>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => CustomPaint(
        painter:
            WaterRipplePainter(_controller.value, widget.count, widget.color),
      ),
    );
  }
}

class WaterRipplePainter extends CustomPainter {
  WaterRipplePainter(this._progress, this._count, this._color);

  final double _progress;
  final int _count;
  final Color _color;

  final Paint _paint = Paint()..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width / 2, size.height / 2);
    for (int i = _count; i >= 0; i--) {
      _paint.color =
          _color.withOpacity((1.0 - ((i + _progress) / (_count + 1))));
      double radius1 = radius * ((i + _progress) / (_count + 1));
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), radius1, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AnimPracticePage7 extends BaseStatelessWidget {
  AnimPracticePage7({required super.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1532),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            left: 10,
            right: 10,
            child: Center(
              child: Stack(children: [
                Positioned.fill(
                  child: RadarView(),
                ),
                Positioned(
                  child: Center(
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: const DecorationImage(
                            image: AssetImage('images/logo.png')),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(.5),
                            blurRadius: 5.0,
                            spreadRadius: 3.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class RadarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RadarViewState();
}

class RadarViewState extends State<RadarView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = Tween(begin: .0, end: pi * 2).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => CustomPaint(
        painter: RadarPainter(_animation.value),
      ),
    );
  }
}

class RadarPainter extends CustomPainter {
  RadarPainter(this.angle);

  final double angle;

  final Paint _bgPaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;

  final _paint = Paint()..style = PaintingStyle.fill;

  int circleCount = 3;

  @override
  void paint(Canvas canvas, Size size) {
    var radius = min(size.width / 2, size.height / 2);
    canvas.drawLine(Offset(size.width / 2, size.height / 2 - radius),
        Offset(size.width / 2, size.height / 2 + radius), _bgPaint);
    canvas.drawLine(Offset(size.width / 2 - radius, size.height / 2),
        Offset(size.width / 2 + radius, size.height / 2), _bgPaint);
    for (var i = 1; i <= circleCount; i++) {
      canvas.drawCircle(Offset(size.width / 2, size.height / 2),
          radius * i / circleCount, _bgPaint);
    }
    _paint.shader = ui.Gradient.sweep(
        Offset(size.width / 2, size.height / 2),
        [Colors.white.withOpacity(.01), Colors.white.withOpacity(.5)],
        [.0, 1.0],
        TileMode.clamp,
        .0,
        pi / 12);
    canvas.save();
    double r = sqrt(pow(size.width, 2) + pow(size.height, 2));
    double startAngle = atan(size.height / size.width);
    Point p0 = Point(r * cos(startAngle), r * sin(startAngle));
    Point px = Point(r * cos(angle + startAngle), r * sin(angle + startAngle));
    canvas.translate((p0.x - px.x) / 2, (p0.y - px.y) / 2);
    canvas.rotate(angle);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        0,
        pi / 12,
        true,
        _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
