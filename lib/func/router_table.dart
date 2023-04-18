import 'package:basic_project/ui/practice/practice_basic.dart';
import 'package:basic_project/ui/practice/practice_box.dart';
import 'package:basic_project/ui/practice/practice_gesture.dart';
import 'package:basic_project/ui/practice/practice_layout.dart';
import 'package:basic_project/ui/widget/widget_app.dart';
import 'package:basic_project/ui/widget/widget_gesture.dart';
import 'package:basic_project/ui/widget/widget_sliver.dart';
import 'package:basic_project/ui/widget/widget_text.dart';
import 'package:basic_project/ui/widget_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/practice/practice_scroll.dart';
import '../ui/practice/practice_text.dart';
import '../ui/widget/widget_basic.dart';
import '../ui/widget/widget_box.dart';
import '../ui/widget/widget_function.dart';
import '../ui/widget/widget_layout.dart';
import '../ui/widget/widget_scroll.dart';
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
  static String flow = 'Flow';
  static String layoutPractice = '布局组件实战';
  static String layoutPractice1 = '布局组件实战$div仿掘金-我';
  static String layoutPractice2 = '布局组件实战$div水平展开/收起菜单';
  static String layoutPractice3 = '布局组件实战$div半圆菜单展开/收起';
  static String container = 'Container';
  static String sizedBox = 'SizedBox ';
  static String aspectRatio = 'AspectRatio ';
  static String fractionallySizedBox = 'FractionallySizedBox';
  static String expanded_flexible_spacer = 'Expanded&Flexible&Spacer';
  static String box = 'Box';
  static String boxPractice = '定位装饰权重组件实战';
  static String boxPractice1 = '定位装饰权重组件实战$div仿掘金-我-头部的效果';
  static String boxPractice2 = '定位装饰权重组件实战$div柱状图';
  static String gestureDetector = 'GestureDetector ';
  static String inkWell = 'InkWell';
  static String listener = 'Listener';
  static String gesturePractice = '手势识别组件实战';
  static String gesturePractice1 = '手势识别组件实战$div登录进度按钮';
  static String gesturePractice2 = '手势识别组件实战$div画板';
  static String listView = 'ListView';
  static String listView1 = 'ListView$div数据较少时一次加载';
  static String listView2 = 'ListView${div}ListView.builder';
  static String listView3 = 'ListView${div}ListView.separated';
  static String gridView = 'GridView ';
  static String gridView1 = 'GridView$div基础用法';
  static String gridView2 = 'GridView$div水平滚动';
  static String gridView3 = 'GridView${div}GridView.builder';
  static String gridView4 = 'GridView${div}GridView.custom';
  static String gridView5 = 'GridView${div}GridView.count';
  static String gridView6 = 'GridView${div}GridView.extent';
  static String singleChildScrollView = 'SingleChildScrollView';
  static String pageView = 'PageView';
  static String pageView1 = 'PageView$div基础用法';
  static String pageView2 = 'PageView$div无限滚动';
  static String pageView3 = 'PageView$div实现指示器';
  static String dataTable = 'DataTable';
  static String scrollPractice = '滚动和大数据组件实战';
  static String scrollPractice1 = '滚动和大数据组件实战$div自定义PageView切换动画';
  static String sliverList = 'SliverList';
  static String sliverGrid = 'SliverGrid';
  static String sliverAppBar = 'SliverAppBar';
  static String sliverPersistentHeader = 'SliverPersistentHeader';
  static String sliverToBoxAdapter = 'SliverToBoxAdapter';
  static String customScrollView = 'CustomScrollView';
  static String nestedScrollView = 'NestedScrollView';
  static String nestedScrollView1 = 'NestedScrollView$div滚动隐藏AppBar';
  static String nestedScrollView2 = 'NestedScrollView${div}SliverAppBar展开折叠';
  static String nestedScrollView3 = 'NestedScrollView$div与TabBar配合使用';
  static String dateTime = 'DateTime';
  static String dialog = 'Dialog';
  static String shape = 'Shape';
  static String draggable = 'Draggable';
  static String interactiveViewer = 'InteractiveViewer';
  static String interactiveViewer1 = 'InteractiveViewer$div平移、缩放和拖放';
  static String interactiveViewer2 = 'InteractiveViewer$div通过Matrix4矩阵变换';
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
  static String scaffold = 'Scaffold';
  static String appBar = 'AppBar';
  static String tabBar = 'TabBar';
  static String bottomNavigationBar = 'BottomNavigationBar';
  static String bottomNavigationBar1 = 'BottomNavigationBar${div}fixed';
  static String bottomNavigationBar2 = 'BottomNavigationBar${div}shifting';
  static String drawer = 'Drawer';

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
    flow: (context) => FlowPage(title: flow),
    layoutPractice: (context) => LayoutPracticePage(title: layoutPractice),
    layoutPractice1: (context) =>
        LayoutPracticePage1(title: pickTitle(layoutPractice1)),
    layoutPractice2: (context) =>
        LayoutPracticePage2(title: pickTitle(layoutPractice2)),
    layoutPractice3: (context) =>
        LayoutPracticePage3(title: pickTitle(layoutPractice3)),
    container: (context) => ContainerPage(title: container),
    sizedBox: (context) => SizedBoxPage(title: sizedBox),
    aspectRatio: (context) => AspectRatioPage(title: sizedBox),
    fractionallySizedBox: (context) =>
        FractionallySizedBoxPage(title: fractionallySizedBox),
    expanded_flexible_spacer: (context) =>
        ExpandedFlexibleSpacerPage(title: expanded_flexible_spacer),
    box: (context) => BoxPage(title: box),
    boxPractice: (context) => BoxPracticePage(title: boxPractice),
    boxPractice1: (context) => BoxPracticePage1(title: pickTitle(boxPractice1)),
    boxPractice2: (context) => BoxPracticePage2(title: pickTitle(boxPractice2)),
    gestureDetector: (context) => GestureDetectorPage(title: gestureDetector),
    inkWell: (context) => InkWellPage(title: inkWell),
    listener: (context) => ListenerPage(title: listener),
    gesturePractice: (context) => GesturePracticePage(title: gesturePractice),
    gesturePractice1: (context) =>
        GesturePracticePage1(title: pickTitle(gesturePractice1)),
    gesturePractice2: (context) =>
        GesturePracticePage2(title: pickTitle(gesturePractice2)),
    listView: (context) => ListViewPage(title: listView),
    listView1: (context) => ListViewPage1(title: pickTitle(listView1)),
    listView2: (context) => ListViewPage2(title: pickTitle(listView2)),
    listView3: (context) => ListViewPage3(title: pickTitle(listView3)),
    gridView: (context) => GridViewPage(title: gridView),
    gridView1: (context) => GridViewPage1(title: pickTitle(gridView1)),
    gridView2: (context) => GridViewPage2(title: pickTitle(gridView2)),
    gridView3: (context) => GridViewPage3(title: pickTitle(gridView3)),
    gridView4: (context) => GridViewPage4(title: pickTitle(gridView4)),
    gridView5: (context) => GridViewPage5(title: pickTitle(gridView5)),
    gridView6: (context) => GridViewPage6(title: pickTitle(gridView6)),
    singleChildScrollView: (context) =>
        SingleChildScrollViewPage(title: singleChildScrollView),
    pageView: (context) => PageViewPage(title: pageView),
    pageView1: (context) => PageViewPage1(title: pickTitle(pageView1)),
    pageView2: (context) => PageViewPage2(title: pickTitle(pageView2)),
    pageView3: (context) => PageViewPage3(title: pickTitle(pageView3)),
    dataTable: (context) => DataTablePage(title: dataTable),
    scrollPractice: (context) => ScrollPracticePage(title: scrollPractice),
    scrollPractice1: (context) =>
        ScrollPracticePage1(title: pickTitle(scrollPractice1)),
    sliverList: (context) => SliverListPage(title: sliverList),
    sliverGrid: (context) => SliverGridPage(title: sliverGrid),
    sliverAppBar: (context) => SliverAppBarPage(title: sliverAppBar),
    sliverPersistentHeader: (context) =>
        SliverPersistentHeaderPage(title: sliverPersistentHeader),
    sliverToBoxAdapter: (context) =>
        SliverToBoxAdapterPage(title: sliverToBoxAdapter),
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
    shape: (context) => ShapePage(title: shape),
    draggable: (context) => DraggablePage(title: draggable),
    interactiveViewer: (context) =>
        InteractiveViewerPage(title: interactiveViewer),
    interactiveViewer1: (context) =>
        InteractiveViewerPage1(title: pickTitle(interactiveViewer1)),
    interactiveViewer2: (context) =>
        InteractiveViewerPage2(title: pickTitle(interactiveViewer2)),
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
    scaffold: (context) => ScaffoldPage(title: scaffold),
    appBar: (context) => AppBarPage(title: appBar),
    tabBar: (context) => TabBarPage(title: tabBar),
    bottomNavigationBar: (context) =>
        BottomNavigationBarPage(title: bottomNavigationBar),
    bottomNavigationBar1: (context) => BottomNavigationBarPageX(
        title: bottomNavigationBar, type: BottomNavigationBarType.fixed),
    bottomNavigationBar2: (context) => BottomNavigationBarPageX(
        title: bottomNavigationBar, type: BottomNavigationBarType.shifting),
    drawer: (context) => DrawerPage(title: drawer),

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
