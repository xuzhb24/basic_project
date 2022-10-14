import 'package:flutter/material.dart';

import '../func/router_table.dart';

/// 组件
class WidgetPage extends StatelessWidget {
  const WidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('组件'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          _buildItem(context, RouterTable.container),
        ],
      ),
    );
  }
}

Widget _buildItem(BuildContext context, String label) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(label);
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(0, 50)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
      ),
      child: Text(label),
    ),
  );
}
