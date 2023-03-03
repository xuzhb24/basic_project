import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../base.dart';

///文本组件
class TextPage extends BaseStatelessWidget {
  TextPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        const Text('基本用法'),
        SpaceDivider(),
        const Text('设置文本大小和颜色',
            style: TextStyle(color: Colors.red, fontSize: 20)),
        SpaceDivider(),
        //字体粗细共有9个级别，为w100至w900，FontWeight.bold是w700。
        const Text('设置字体粗细', style: TextStyle(fontWeight: FontWeight.bold)),
        SpaceDivider(),
        const Text('设置斜体', style: TextStyle(fontStyle: FontStyle.italic)),
        SpaceDivider(),
        //下载字体库后放到根目录下的fonst文件夹，配置pubspec.yaml
        const Text(
          '设置自定义的字体',
          style: TextStyle(fontFamily: 'lishu', fontSize: 25),
        ),
        /**
         * textAlign只是控制水平方向的对齐方式，值说明如下：
         * left：左对齐
         * right：右对齐
         * center：居中
         * justify：两端对齐，此属性中文存在bug（Flutter版本：1.17.3）
         * start：前端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则左对齐，设置TextDirection.rtl则右对齐
         * end：末端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则右对齐，设置TextDirection.rtl则左对齐
         */
        _buildText(const Text('设置对齐方式：center', textAlign: TextAlign.center)),
        _buildText(const Text('设置文本自动换行', softWrap: true), width: 100),
        /**
         * 文本溢出的处理方式：
         * clip：直接裁剪。
         * fade：越来越透明。
         * ellipsis：省略号结尾。
         * visible：依然显示，此时将会溢出父组件。
         */
        _buildText(
            const Text('文本超出范围时的处理',
                overflow: TextOverflow.ellipsis, softWrap: false),
            width: 100),
        //设置全局字体样式，见main.dart中MaterialApp => textTheme => bodyText2设置
      ],
    );
  }

  _buildText(Widget child, {double width = 200, double height = 50}) {
    return Column(
      children: [
        SpaceDivider(),
        Container(
          width: width,
          height: height,
          color: Colors.blue.withOpacity(.5),
          child: child,
        )
      ],
    );
  }
}

class RichTextPage extends BaseStatelessWidget {
  RichTextPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        /**
         * RichText参数
         * text：必传参数,用来展示文本
         * overflow：文本溢出的处理方式
         * maxLines：用来设置最大行数
         * textAlign：对齐属性
         * textDirection：文本排列方式，TextDirection.rtl文本从右到左，TextDirection.ltr文本从左到右
         * textScaleFactor：文字放大缩小倍数
         * recognizer：手势监听
         */
        RichText(
          text: const TextSpan(
            // style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(text: '红色', style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: '，黑色字体，大小为20',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ],
          ),
        ),
        SpaceDivider(),
        _buildRichText(
          RichText(
            text: const TextSpan(
                text:
                    '设置对齐效果：TextAlign.start 设置对齐效果：TextAlign.start 设置对齐效果：TextAlign.start'),
            textAlign: TextAlign.start,
          ),
        ),
        SpaceDivider(),
        _buildRichText(
          RichText(
            text: const TextSpan(
                text:
                    '设置对齐效果：TextAlign.center 设置对齐效果：TextAlign.center 设置对齐效果：TextAlign.center'),
            textAlign: TextAlign.center,
          ),
        ),
        SpaceDivider(),
        _buildRichText(
          RichText(
            text: const TextSpan(
                text:
                    '设置对齐效果：TextAlign.end 设置对齐效果：TextAlign.end 设置对齐效果：TextAlign.end'),
            textAlign: TextAlign.end,
          ),
        ),
        SpaceDivider(),
        RichText(
            text: TextSpan(children: [
          const TextSpan(
            text: '登陆即视为同意',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: '《隐私协议》',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('点击《隐私协议》')));
              },
          ),
        ]))
      ],
    );
  }

  _buildRichText(Widget child, {double width = 250, double height = 80}) {
    return Column(
      children: [
        SpaceDivider(),
        Container(
          width: width,
          height: height,
          color: Colors.blue,
          child: child,
        )
      ],
    );
  }
}
