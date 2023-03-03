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
        //textAlign只是控制水平方向的对齐方式，值说明如下：
        //left：左对齐
        //right：右对齐
        //center：居中
        //justify：两端对齐，此属性中文存在bug（Flutter版本：1.17.3）
        //start：前端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则左对齐，设置TextDirection.rtl则右对齐
        //end：末端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则右对齐，设置TextDirection.rtl则左对齐
        _buildText(const Text('设置对齐方式：center', textAlign: TextAlign.center)),
        _buildText(const Text('设置文本自动换行', softWrap: true), width: 100),
        //文本溢出的处理方式：
        //clip：直接裁剪。
        //fade：越来越透明。
        //ellipsis：省略号结尾。
        //visible：依然显示，此时将会溢出父组件。
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
