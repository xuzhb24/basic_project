import 'package:basic_project/func/constant.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/material.dart';

///基础组件实战
class BasicPracticePage extends BaseStatelessWidget {
  BasicPracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: '聊天气泡(.9图实现)',
          child: Container(
            width: 200,
            padding: const EdgeInsets.only(
              left: 8,
              top: 8,
              right: 20,
              bottom: 8,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                centerSlice: Rect.fromLTWH(20, 20, 1, 60),
                image: AssetImage('images/chat.9.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: const Text('这是一段很长很长的文本'),
          ),
        ),
        TitleLayout(
          title: '圆形带边框的头像',
          child: Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/cc.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        TitleLayout(
          title: '图片占位符',
          child: Image.network(
            Constant.bannerImageUrl1,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (frame == null) {
                return Image.asset(
                  'images/place_holder.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                );
              }
              return child;
            },
          ),
        ),
      ],
    );
  }
}
