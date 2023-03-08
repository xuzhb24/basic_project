import 'package:basic_project/ui/base.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///文本组件实战
class TextPracticePage extends BaseStatelessWidget {
  TextPracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: '过渡颜色的文字',
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: <Color>[Colors.purple, Colors.blue],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: const Text(
              '落叶的位置，谱出一首诗。',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TitleLayout(
          title: '带前后置标签的文本',
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blue,
                    ),
                    child: const Text(
                      '判断题',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const TextSpan(
                  text: '泡沫灭火器可用于带电灭火',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '服务协议',
          child: Text.rich(
            TextSpan(
              text: '登录即代表同意并阅读',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF999999),
              ),
              children: [
                TextSpan(
                  text: '《服务协议》',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('onTap');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('点击《服务协议》')));
                    },
                ),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '登录密码输入框',
          child: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0x30cccccc),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x00FF0000)),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              hintText: '输入密码',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x00000000)),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            textAlign: TextAlign.center,
            obscureText: true,
            onChanged: (value) {
              print('$value');
            },
          ),
        ),
        TitleLayout(
          title: '评论回复',
          child: Text.rich(
            TextSpan(
              text: '回复',
              style: const TextStyle(fontSize: 15, color: Color(0xFF999999)),
              children: [
                TextSpan(
                  text: '@小米：',
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('onTap');
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('点击小米')));
                    },
                ),
                const TextSpan(text: '你好，想知道Flutter发展前景如何？'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
