import 'dart:io';

import 'package:basic_project/ui/practice.dart';
import 'package:basic_project/ui/widget.dart';
import 'package:basic_project/ui/widget/widget_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'func/router_table.dart';

void main() {
  runApp(MyApp());
  setAndroidSystemBar();
}

CustomRouteObserver<PageRoute> routeObserver = CustomRouteObserver<PageRoute>();

//设置android状态栏为透明色
void setAndroidSystemBar() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigationKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //添加国际化支持
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      locale: const Locale('zh'),
      navigatorObservers: [routeObserver],
      //页面跳转管理
      navigatorKey: navigationKey,
      onGenerateRoute: RouterTable.onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        //设置全局字体样式
        // textTheme: const TextTheme(
        //   bodyText2: TextStyle(color: Colors.red, fontSize: 20),
        // ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  Widget _curPage = WidgetPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _curPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              _curPage = WidgetPage();
              break;
            case 1:
              _curPage = PracticePage();
              break;
          }
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: '组件',
            icon: Icon(Icons.dashboard_outlined),
          ),
          BottomNavigationBarItem(
            label: '实战',
            icon: Icon(Icons.earbuds_outlined),
          )
        ],
      ),
    );
  }
}
