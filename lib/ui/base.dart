import 'package:basic_project/func/NoShadowScrollBehavior.dart';
import 'package:basic_project/func/router_table.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key? key, required this.title}) : super(key: key);
  final String title; //标题
}

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key, required this.title}) : super(key: key);
  final String title; //标题
}

///列表滚动布局，通过ListView构建
Widget ListLayout({
  required String title,
  required List<String> widgetList, //组件列表
  List<String>? widgetDescList, //各个组件的描述，如果未设置取widgetList的值，有设置要和widgetList一一对应
  bool centerContent = false, //组件是否居中显示
}) {
  var hasDesc = widgetDescList != null &&
      widgetDescList.isNotEmpty &&
      widgetDescList.length == widgetList.length;
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
    ),
    body: NoShadowScrollLayout(
      Center(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(10, index == 0 ? 12 : 0, 10, 0),
              child: widgetList[index].contains('组件') &&
                      !widgetList[index].contains('实战')
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                        hasDesc ? widgetDescList[index] : widgetList[index],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        //跳转到对应的组件页面，页面路由名称取widgetList[index]的值
                        Navigator.of(context).pushNamed(widgetList[index]);
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size(0, 50)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 16)),
                      ),
                      child: Text(RouterTable.pickTitle(
                          hasDesc ? widgetDescList[index] : widgetList[index])),
                    ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: widgetList.length,
          shrinkWrap: centerContent,
        ),
      ),
    ),
  );
}

Widget ScaffoldLayout({required String title, required Widget child}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
    ),
    body: child,
  );
}

///列表滚动布局，通过SingleChildScrollView构建
Widget ScrollLayout({
  required String title,
  required List<Widget> children,
  bool centerContent = false, //组件是否居中显示
}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
    ),
    body: centerContent
        ? Center(
            child: SingleChildScrollView(
              child: Center(child: Column(children: children)),
            ),
          )
        : NoShadowScrollLayout(
            SingleChildScrollView(
              child: Center(child: Column(children: children)),
            ),
          ),
  );
}

///滚动组件Android去除水波纹效果，iOS保留软性回弹效果
Widget NoShadowScrollLayout(Widget child) =>
    ScrollConfiguration(behavior: NoShadowScrollBehavior(), child: child);

///空白间距
Widget SpaceDivider({double? height = 10.0}) => SizedBox(height: height);

///带标题的布局
Widget TitleLayout({
  required String title, //标题
  required Widget child, //内容组件
  bool centerTitle = true, //标题是否居中
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

///带黑色边框的标题布局
Widget BlackBorder({required String title, required Widget child}) {
  return TitleLayout(
    title: title,
    centerTitle: false,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: child,
    ),
  );
}

//跳转到某个页面
void navigatorToPage(BuildContext context, WidgetBuilder builder) {
  Navigator.push(context, MaterialPageRoute(builder: builder));
}
