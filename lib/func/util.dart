import 'package:flutter/material.dart';

///工具类
class Util {
  static Widget buildListWidget({
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

  ///构造列表滚动布局
  static Widget buildScrollWidget({
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
}
