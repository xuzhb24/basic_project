import 'package:flutter/material.dart';

import '../func/constant.dart';

///容器类组件
///Container
class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 10),
                //设置对齐方式后，Container将会充满其父控件，相当于Android中match_parent,不再是根据子控件调整大小
                // alignment: Alignment.center,
                child: const Text('Container'),
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Text('圆形的背景'),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text('圆角矩形填充背景'),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text('圆角矩形边框背景'),
              ),
              const SizedBox(height: 10),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(Constant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '圆角图片',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(Constant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  '圆形图片',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text('设置固定宽高（200 x 60）'),
              ),
              const SizedBox(height: 10),
              Container(
                //constraints如果不设置，默认最小宽高是0，最大宽高是无限大（double.infinity）
                constraints: const BoxConstraints.tightForFinite(height: 60),
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text('设置固定宽高（不限宽度）'),
              ),
              const SizedBox(height: 10),
              Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                color: Colors.blue,
                //Matrix4.rotationZ()参数的单位是弧度而不是角度
                transform: Matrix4.rotationZ(0.5),
                child: const Text('transform变换'),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
