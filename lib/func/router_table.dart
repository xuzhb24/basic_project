import 'package:basic_project/ui/practice/practice_basic.dart';
import 'package:basic_project/ui/widget/widget_text.dart';
import 'package:basic_project/ui/widget_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/practice/practice_text.dart';
import '../ui/widget/widget_basic.dart';
import '../ui/widget_container.dart';
import '../ui/widget_element.dart';

///页面跳转管理
class RouterTable {
  static String div = '\$';
  static String notFound = '404'; //404页面，缺省页
  static String text = 'Text';
  static String richText = 'RichText';
  static String textField = 'TextField';
  static String textPractice = '文本组件实战';
  static String button = 'Button';
  static String form = 'Form';
  static String radio = 'Radio';
  static String checkbox = 'Checkbox';
  static String slider = 'Slider';
  static String Switch = 'Switch';
  static String progressIndicator = 'ProgressIndicator';
  static String image_icon = 'Image&Icon';
  static String basicPractice = '基础组件实战';

  static String row_column = 'Row&Column';
  static String stack = 'Stack';
  static String wrap = 'Wrap';
  static String container = 'Container';
  static String box = 'Box';
  static String inkWell = 'InkWell';
  static String listView = 'ListView';
  static String listView1 = 'ListView$div数据较少时一次加载';
  static String listView2 = 'ListView${div}ListView.builder';
  static String listView3 = 'ListView${div}ListView.separated';
  static String pageView = 'PageView';
  static String pageView1 = 'PageView$div基础用法';
  static String pageView2 = 'PageView$div无限滚动';
  static String pageView3 = 'PageView$div实现指示器';
  static String pageView4 = 'PageView$div切换动画';
  static String dataTable = 'DataTable';
  static String sliverAppBar = 'SliverAppBar';
  static String customScrollView = 'CustomScrollView';
  static String nestedScrollView = 'NestedScrollView';
  static String nestedScrollView1 = 'NestedScrollView$div滚动隐藏AppBar';
  static String nestedScrollView2 = 'NestedScrollView${div}SliverAppBar展开折叠';
  static String nestedScrollView3 = 'NestedScrollView$div与TabBar配合使用';
  static String dateTime = 'DateTime';
  static String dialog = 'Dialog';
  static String draggable = 'Draggable';
  static String willPopScope = 'WillPopScope';
  static String willPopScope1 = 'WillPopScope$div询问用户是否退出(弹出对话框)';
  static String willPopScope2 = 'WillPopScope$div询问用户是否退出(再次点击退出)';
  static String willPopScope3 = 'WillPopScope${div}App中有多个Navigator';
  static String navigator = 'Navigator';
  static String navigator1 = 'Navigator$div弹窗内跳转';
  static String navigator2 = 'Navigator${div}Tab内跳转';
  static String futureBuilder = 'FutureBuilder';
  static String futureBuilder1 = 'FutureBuilder$div模拟加载完成';
  static String futureBuilder2 = 'FutureBuilder$div模拟加载失败';
  static String futureBuilder3 = 'FutureBuilder$div模拟列表数据加载完成';
  static String futureBuilder4 = 'FutureBuilder$div模拟列表数据加载失败';
  static String appBar = 'AppBar';
  static String tabBar = 'TabBar';
  static String bottomNavigationBar = 'BottomNavigationBar';
  static String bottomNavigationBar1 = 'BottomNavigationBar${div}fixed';
  static String bottomNavigationBar2 = 'BottomNavigationBar${div}shifting';
  static String animatedList = 'AnimatedList';
  static String chip = 'Chip';
  static String opacity = 'Opacity';
  static String customPaint = 'CustomPaint';
  static String reorderableListView = 'ReorderableListView';
  static String expansionPanelList = 'ExpansionPanelList';
  static String mergeableMaterial = 'MergeableMaterial';
  static String mergeableMaterial1 = 'MergeableMaterial$div基础用法';
  static String mergeableMaterial2 =
      'MergeableMaterial$div实现ExpansionPanelList效果';

  static Map<String, WidgetBuilder> routerTables = {
    notFound: (context) => const NotFoundPage(),
    text: (context) => TextPage(title: text),
    richText: (context) => RichTextPage(title: richText),
    textField: (context) => TextFieldPage(title: textField),
    textPractice: (context) => TextPracticePage(title: textPractice),
    button: (context) => ButtonPage(title: button),
    form: (context) => FormPage(title: form),
    radio: (context) => RadioPage(title: radio),
    checkbox: (context) => CheckboxPage(title: checkbox),
    slider: (context) => SliderPage(title: slider),
    Switch: (context) => SwitchPage(title: Switch),
    progressIndicator: (context) =>
        ProgressIndicatorPage(title: progressIndicator),
    image_icon: (context) => ImageIconPage(title: image_icon),
    basicPractice: (context) => BasicPracticePage(title: basicPractice),

    row_column: (context) => RowColumnPage(title: row_column),
    stack: (context) => StackPage(title: stack),
    wrap: (context) => WrapPage(title: wrap),
    container: (context) => ContainerPage(title: container),
    box: (context) => BoxPage(title: box),
    inkWell: (context) => InkWellPage(title: inkWell),
    listView: (context) => ListViewPage(title: listView),
    listView1: (context) => ListViewPage1(title: pickTitle(listView1)),
    listView2: (context) => ListViewPage2(title: pickTitle(listView2)),
    listView3: (context) => ListViewPage3(title: pickTitle(listView3)),
    pageView: (context) => PageViewPage(title: pageView),
    pageView1: (context) => PageViewPage1(title: pickTitle(pageView1)),
    pageView2: (context) => PageViewPage2(title: pickTitle(pageView2)),
    pageView3: (context) => PageViewPage3(title: pickTitle(pageView3)),
    pageView4: (context) => PageViewPage4(title: pickTitle(pageView4)),
    dataTable: (context) => DataTablePage(title: dataTable),
    sliverAppBar: (context) => SliverAppBarPage(title: sliverAppBar),
    customScrollView: (context) =>
        CustomScrollViewPage(title: customScrollView),
    nestedScrollView: (context) =>
        NestedScrollViewPage(title: nestedScrollView),
    nestedScrollView1: (context) =>
        NestedScrollViewPage1(title: pickTitle(nestedScrollView1)),
    nestedScrollView2: (context) =>
        NestedScrollViewPage2(title: pickTitle(nestedScrollView1)),
    // nestedScrollView3: (context) => NestedScrollViewPage3(title: '与TabBar配合使用'),
    dateTime: (context) => DateTimePage(title: dateTime),
    dialog: (context) => DialogPage(title: dialog),
    draggable: (context) => DraggablePage(title: draggable),
    willPopScope: (context) => WillPopScopePage(title: willPopScope),
    willPopScope1: (context) =>
        WillPopScopePage1(title: pickTitle(willPopScope1)),
    willPopScope2: (context) =>
        WillPopScopePage2(title: pickTitle(willPopScope2)),
    willPopScope3: (context) =>
        WillPopScopePage3(title: pickTitle(willPopScope3)),
    navigator: (context) => NavigatorPage(title: navigator),
    navigator1: (context) => NavigatorPage1(title: pickTitle(navigator1)),
    navigator2: (context) => NavigatorPage2(),
    futureBuilder: (context) => FutureBuilderPage(title: futureBuilder),
    futureBuilder1: (context) =>
        FutureBuilderPage1(title: pickTitle(futureBuilder1)),
    futureBuilder2: (context) =>
        FutureBuilderPage2(title: pickTitle(futureBuilder2)),
    futureBuilder3: (context) =>
        FutureBuilderPage3(title: pickTitle(futureBuilder3)),
    futureBuilder4: (context) =>
        FutureBuilderPage4(title: pickTitle(futureBuilder4)),
    appBar: (context) => AppBarPage(title: appBar),
    tabBar: (context) => TabBarPage(title: tabBar),
    bottomNavigationBar: (context) =>
        BottomNavigationBarPage(title: bottomNavigationBar),
    bottomNavigationBar1: (context) => BottomNavigationBarPageX(
        title: bottomNavigationBar, type: BottomNavigationBarType.fixed),
    bottomNavigationBar2: (context) => BottomNavigationBarPageX(
        title: bottomNavigationBar, type: BottomNavigationBarType.shifting),
    animatedList: (context) => AnimatedListPage(title: animatedList),
    chip: (context) => ChipPage(title: chip),
    opacity: (context) => OpacityPage(title: opacity),
    customPaint: (context) => CustomPaintPage(title: customPaint),
    reorderableListView: (context) =>
        ReorderableListViewPage(title: reorderableListView),
    expansionPanelList: (context) =>
        ExpansionPanelListPage(title: expansionPanelList),
    mergeableMaterial: (context) =>
        MergeableMaterialPage(title: mergeableMaterial),
    mergeableMaterial1: (context) =>
        MergeableMaterialPage1(title: pickTitle(mergeableMaterial1)),
    mergeableMaterial2: (context) =>
        MergeableMaterialPage2(title: pickTitle(mergeableMaterial2)),
  };

  ///路由拦截
  static Route onGenerateRoute<T extends Object>(RouteSettings settings) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (routerTables[name] == null) {
          name = notFound;
        }
        return routerTables[name]!(context);
      },
    );
  }

  ///提取字符串中$后面的字符，如PageView$基础用法只会显示基础用法
  static String pickTitle(String text) {
    if (text.contains(div)) {
      return text.substring(text.indexOf(div) + 1);
    }
    return text;
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: const Center(
          child: Text(
            '页面找不到啦！',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
