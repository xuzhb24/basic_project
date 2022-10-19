import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key? key, required this.title}) : super(key: key);
  final String title; //标题
}

///列表滚动布局，通过ListView构建
Widget ListLayout({
  required String title,
  required List<String> items,
}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
    ),
    body: ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(10, index == 0 ? 12 : 0, 10, 0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(items[index]);
            },
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(0, 50)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 16)),
            ),
            child: Text(items[index]),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: items.length,
    ),
  );
}

///列表滚动布局，通过SingleChildScrollView构建
Widget ScrollLayout({
  required String title,
  required List<Widget> children,
}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: children,
        ),
      ),
    ),
  );
}

///空白间距
Widget SpaceDivider({double? height = 10.0}) => SizedBox(height: height);

///带标题的布局
Widget TitleLayout({
  required String title, //标题
  required Widget child, //内容组件
  bool centerTitle = false, //标题是否居中
}) {
  return Column(
    children: [
      centerTitle
          ? Text(title)
          : Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(title),
            ),
      SpaceDivider(height: 5),
      child,
      const Divider(),
    ],
  );
}
