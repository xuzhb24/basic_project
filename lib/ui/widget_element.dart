import 'dart:math';
import 'dart:ui';

import 'package:basic_project/func/router_table.dart';
import 'package:basic_project/ui/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 元素类组件合集
 * AppBar：标题栏
 * BottomNavigatorBar：底部导航栏
 * Text：文本
 * ElevatedButton：按钮，下同
 * TextButton
 * OutlineButton
 * DropdownButton
 * RawMaterialButton
 * PopupMenuButton
 * IconButton
 * BackButton
 * CloseButton
 * ButtonBar
 * ToggleButtons
 * Form/FormField/TextFormField：文本输入框，下同
 * RawChip：标签，下同
 * Chip
 * InputChip
 * ChoiceChip
 * FilterChip
 * ActionChip
 * Ink/InkWell：按钮，下同
 * CustomPaint：自定义绘制组件
 * ClipRect：裁剪类组件，下同
 * ClipRRect
 * ClipOval
 * ClipPath
 * CustomClipper
 * AnimatedList：列表动画
 * AlertDialog：对话框，下同
 * CupertinoAlertDialog
 * SimpleDialog
 * Dialog
 * CalendarDatePicker：日期类组件，下同
 * showDatePicker
 * CupertinoDatePicker
 * showTimePicker
 * CupertinoTimerPicker
 * Opacity/AnimatedOpacity：占位
 * DataTable：表格控件
 * Draggable：拖动组件
 * WillPopScope：页面拦截
 * Navigator：管理路由
 * MediaQuery：获取设备信息
 * FutureBuilder：执行异步任务
 */

///元素类组件
class AppBarPage extends BaseStatefulWidget {
  AppBarPage({required super.title});

  @override
  State<StatefulWidget> createState() => AppBarPageState();
}

class AppBarPageState extends State<AppBarPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      centerContent: true,
      children: [
        _buildItem(
          context,
          'leading：设置返回按钮',
          Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: const Text('leading'),
            ),
          ),
        ),
        _buildItem(
          context,
          'drawer：左侧抽屉',
          Scaffold(
            appBar: AppBar(
              title: const Text('drawer'),
            ),
            drawer: const Drawer(),
          ),
        ),
        _buildItem(
          context,
          '默认显示返回图标',
          Scaffold(
            appBar: AppBar(
              title: const Text('默认返回图标'),
            ),
          ),
        ),
        _buildItem(
          context,
          'automaticallyImplyLeading：不自动设置控件',
          Scaffold(
            appBar: AppBar(
              title: const Text('automaticallyImplyLeading'),
              automaticallyImplyLeading: false,
            ),
          ),
        ),
        _buildItem(
          context,
          '标题居中显示',
          Scaffold(
            appBar: AppBar(
              title: const Text('标题居中显示'),
              centerTitle: true,
            ),
          ),
        ),
        _buildItem(
          context,
          'actions：右侧图标',
          Scaffold(
            appBar: AppBar(
              title: const Text('actions'),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
          ),
        ),
        _buildItem(
          context,
          'bottom：设置TabBar',
          Scaffold(
            appBar: AppBar(
              title: const Text('bottom'),
              bottom: TabBar(
                tabs: const [
                  Text('语文'),
                  Text('数学'),
                  Text('英语'),
                  Text('体育'),
                  Text('音乐'),
                ],
                controller: TabController(length: 5, vsync: this),
                isScrollable: true,
              ),
            ),
          ),
        ),
        _buildItem(
          context,
          'elevation | shape | backgroundColor：设置阴影、形状、背景颜色',
          Scaffold(
            appBar: AppBar(
              title: const Text('elevation | shape | backgroundColor'),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        _buildItem(
          context,
          'iconTheme | actionsIconTheme | titleTextStyle：设置icon样式及文字样式',
          Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(size: 50, color: Colors.white),
              actionsIconTheme:
                  const IconThemeData(size: 50, color: Colors.white),
              titleTextStyle: const TextStyle(color: Colors.red, fontSize: 18),
              title:
                  const Text('iconTheme | actionsIconTheme | titleTextStyle'),
              actions: const [Icon(Icons.add)],
            ),
          ),
        ),
      ],
    );
  }

  _buildItem(BuildContext context, String title, Widget widget) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ElevatedButton(
        onPressed: () {
          navigatorToPage(context, (context) => widget);
        },
        child: Text(
          title,
          style: const TextStyle(height: 1.2), //height：行间距
        ),
      ),
    );
  }
}

class BottomNavigationBarPage extends BaseStatelessWidget {
  BottomNavigationBarPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      centerContent: true,
      widgetList: [
        RouterTable.bottomNavigationBar1,
        RouterTable.bottomNavigationBar2,
      ],
    );
  }
}

class BottomNavigationBarPageX extends BaseStatefulWidget {
  BottomNavigationBarPageX({required super.title, required this.type});

  final BottomNavigationBarType type;

  @override
  State<StatefulWidget> createState() => BottomNavigationBarPageXState();
}

class BottomNavigationBarPageXState extends State<BottomNavigationBarPageX> {
  int _curIndex = 0;
  Widget? _curBody;

  @override
  void initState() {
    super.initState();
    _curBody = HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _curBody,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        //BottomNavigationBar有2种显示模式：fixed、shifting
        type: widget.type,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _curIndex,
        //背景颜色
        backgroundColor: Colors.white,
        //图标大小
        iconSize: 20,
        selectedFontSize: 12,
        unselectedFontSize: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '书籍'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '我的'),
        ],
      ),
    );
  }

  _onTap(int index) {
    switch (index) {
      case 0:
        _curBody = HomePage();
        break;
      case 1:
        _curBody = BookPage();
        break;
      case 2:
        _curBody = MyPage();
        break;
    }
    setState(() {
      _curIndex = index;
    });
  }

  HomePage() => Container(color: Colors.red);

  BookPage() => Container(color: Colors.green);

  MyPage() => Container(color: Colors.yellow);
}

class ButtonPage extends BaseStatefulWidget {
  ButtonPage({required super.title});

  @override
  State<StatefulWidget> createState() => ButtonPageState();
}

class ButtonPageState extends State<ButtonPage> {
  var _dropValue;
  final List<bool> _selecteds = [false, false, true];

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        //ElevatedButton是一个material风格”凸起“的按钮
        TitleLayout(
          title: 'ElevatedButton',
          child: ElevatedButton(
            //MaterialStateProperty.all()方法是设置点击事件所有状态下的样式
            //MaterialStateProperty.resolveWith()可拦截分别设置不同状态下的样式
            style: ButtonStyle(
              //文本的样式，但是对于颜色是不起作用的
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 15)),
              //按钮背景颜色
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey; //禁用状态
                } else if (states.contains(MaterialState.focused) &&
                    !states.contains(MaterialState.pressed)) {
                  return Colors.green; //获取焦点
                } else if (states.contains(MaterialState.pressed)) {
                  return Colors.red; //按下时
                }
                return Colors.blue; //默认状态
              }),
              //文本及图表颜色
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.orange; //禁用状态
                } else if (states.contains(MaterialState.focused) &&
                    !states.contains(MaterialState.pressed)) {
                  return Colors.red; //获取焦点
                } else if (states.contains(MaterialState.pressed)) {
                  return Colors.green; //按下时
                }
                return Colors.white; //默认状态
              }),
              //高亮色，按钮处于focused、hovered or pressed时的背景颜色
              overlayColor: MaterialStateProperty.all(Colors.yellow),
              //阴影颜色
              shadowColor: MaterialStateProperty.all(Colors.green),
              //阴影范围
              elevation: MaterialStateProperty.all(15),
              //按钮内边距
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
              //按钮最小值
              minimumSize: MaterialStateProperty.all(const Size(100, 100)),
              //按钮最大值
              maximumSize: MaterialStateProperty.all(const Size(200, 200)),
              //按钮大小
              fixedSize: MaterialStateProperty.all(const Size(200, 100)),
              //边框
              side: MaterialStateProperty.all(const BorderSide(
                  color: Colors.blue, width: 5, style: BorderStyle.solid)),
              //形状-可设置圆角弧度
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              //按钮子对象的对齐方式
              alignment: Alignment.center,
            ),
            autofocus: true,
            onPressed: () {},
            child: const Text('按钮'),
          ),
        ),
        //TextButton是一个扁平的按钮，用法和ElevatedButton一样，取代FlatButton
        TitleLayout(
          title: 'TextButton',
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {},
            child: const Text('按钮'),
          ),
        ),
        //OutlineButton 是一个带边框的按钮，用法和ElevatedButton一样
        TitleLayout(
          title: 'OutlinedButton',
          child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const BorderSide(color: Colors.green, width: 2);
                }
                return const BorderSide(color: Colors.blue, width: 2);
              }),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return Colors.blue;
              }),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            onPressed: () {},
            child: const Text('按钮'),
          ),
        ),
        //DropdownButton为下拉选择按钮
        TitleLayout(
          title: 'DropdownButton',
          child: DropdownButton(
            hint: const Text('请选择'),
            value: _dropValue,
            //点击时弹出选项
            items: const [
              DropdownMenuItem(value: '语文', child: Text('语文')),
              DropdownMenuItem(value: '数学', child: Text('数学')),
              DropdownMenuItem(value: '英语', child: Text('英语')),
            ],
            //选中的选项样式
            selectedItemBuilder: (context) => const [
              Text('语文', style: TextStyle(color: Colors.red)),
              Text('数学', style: TextStyle(color: Colors.red)),
              Text('英语', style: TextStyle(color: Colors.red)),
            ],
            //选项发生变化时回调
            onChanged: (value) {
              setState(() {
                _dropValue = value;
              });
            },
            //下拉选项的图标，默认是倒立的三角
            icon: const Icon(Icons.add),
            iconSize: 24,
            iconDisabledColor: Colors.blue,
            iconEnabledColor: Colors.red,
          ),
        ),
        //RawMaterialButton是基于Semantics, Material和InkWell创建的组件，
        //不使用当前的系统主题和按钮主题，用于自定义按钮或者合并现有的样式
        TitleLayout(
          title: 'RawMaterialButton',
          child: RawMaterialButton(
            fillColor: Colors.blue,
            onPressed: () {},
            child: const Text('按钮'),
          ),
        ),
        //PopupMenuButton是一个菜单选中按钮
        TitleLayout(
          title: 'PopupMenuButton',
          child: PopupMenuButton(
            initialValue: '语文',
            itemBuilder: (context) => const [
              PopupMenuItem(value: '语文', child: Text('语文')),
              PopupMenuItem(value: '数学', child: Text('数学')),
              PopupMenuItem(value: '英语', child: Text('英语')),
              PopupMenuItem(value: '生物', child: Text('生物')),
              PopupMenuItem(value: '化学', child: Text('化学')),
            ],
            onSelected: (value) {
              print(value);
            },
            onCanceled: () {
              print('未选中');
            },
            //长按时弹出的提示
            tooltip: '这是一个PopupMenuButton',
            //阴影值
            elevation: 15,
            //内边距
            padding: const EdgeInsets.all(5),
            //弹出菜单的背景颜色
            color: Colors.red,
            //弹出菜单边框
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            //设置其他图标，默认显示3个小圆点
            icon: const Icon(Icons.menu),
            //设置文字，默认显示3个小圆点
            // child: const Text('学科'),
          ),
        ),
        //IconButton是一个图标按钮
        TitleLayout(
          title: 'IconButton',
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            iconSize: 30,
            color: Colors.red,
            tooltip: '这是一个IconButton',
          ),
        ),
        //BackButton是一个material风格的返回按钮，本身是一个IconButton，适用于全屏页面的退出
        TitleLayout(title: 'BackButton', child: const BackButton()),
        //CloseButton是一个material风格的关闭按钮，木身是一个IconButton，适用于弹出Dialog的退出
        TitleLayout(title: 'CloseButton', child: const CloseButton()),
        //ButtonBar并不是一个单独的按钮控件，而是末端对齐的容器类控件，当在水平方向上没有足够空间时候，按钮将整体垂直排列，而不是换行
        TitleLayout(
          title: 'ButtonBar',
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('ButtonBar')),
              ElevatedButton(
                  onPressed: () {}, child: const Text('ButtonBarButtonBar')),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('ButtonBarButtonBarButtonBar')),
            ],
          ),
        ),
        //ToggleButtons组件将多个组件组合在一起，并让用户从中选择
        TitleLayout(
          title: 'ToggleButtons',
          child: ToggleButtons(
            //bool类型集合，数量和children的数量一致
            isSelected: _selecteds,
            //默认子组件颜色
            color: Colors.green,
            //选中子组件颜色
            selectedColor: Colors.orange,
            //背景颜色
            fillColor: Colors.blue,
            //是否需要边框
            renderBorder: true,
            //边框的圆角半径
            borderRadius: BorderRadius.circular(30),
            //边框的颜色
            borderColor: Colors.orange,
            //边框的宽度
            borderWidth: 3,
            //边框选中时的颜色
            selectedBorderColor: Colors.green,
            //点击水波纹颜色
            splashColor: Colors.purple,
            //按下时的高亮颜色
            highlightColor: Colors.yellow,
            //禁用状态下按钮颜色
            disabledColor: Colors.grey,
            //禁用状态下按钮边框颜色
            disabledBorderColor: Colors.blueGrey,
            //点击回调，禁用设置为null即可
            onPressed: (index) {
              setState(() {
                _selecteds[index] = !_selecteds[index];
              });
            },
            children: const [
              Icon(Icons.local_cafe),
              Icon(Icons.fastfood),
              Icon(Icons.cake),
            ],
          ),
        ),
      ],
    );
  }
}

class FormPage extends BaseStatefulWidget {
  FormPage({required super.title});

  @override
  State<StatefulWidget> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  var _name = '';
  var _pwd = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        //TextFormField继承自FormField，是一个输入框表单
        TitleLayout(
          title: 'TextFormField',
          centerTitle: false,
          child: TextFormField(
            //可选参数，当Form调用FormState.save时才会回调此方法
            onSaved: (value) {
              print(value);
            },
            //枚举类型，disabled不自动验证，always实时验证，onUserInteraction，用户输入完成验证
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //验证函数，输入的值不匹配的时候返回的字符串显示在TextField的errorText属性位置，返回nul1，表示没有错误
            validator: (value) =>
                value != null && value.length >= 6 ? null : '账号最少6个字符',
          ),
        ),
        TitleLayout(
          title: 'Form',
          child: Form(
            key: _formKey,
            //在输入表单时点击返回按钮提示用户"确认退出吗？"
            //onWillPop回调决定Form所在的路由是否可以直接返回，该回调需要返回Future<bool>，返回false表示当前路由不会返回；
            //为true，则会返回到上一个路由。此属性通常用于拦截返回按钮。
            onWillPop: () async {
              return await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('提示'),
                  content: const Text('确认退出吗？'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('取消'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('确认'),
                    )
                  ],
                ),
              );
            },
            //onChanged：当子表单控件发生变化时回调
            onChanged: () {
              print('onChanged,name:$_name,pwd:$_pwd');
            },
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: '输入账号'),
                  onSaved: (value) {
                    if (value != null) {
                      _name = value;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value != null && value.length >= 6 ? null : '账号最少6个字符',
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: '输入密码'),
                  onSaved: (value) {
                    if (value != null) {
                      _pwd = value;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value != null && value.length >= 6 ? null : '密码最少6个字符',
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.save();
                    print('name:$_name password:$_pwd');
                  },
                  child: const Text('登录'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChipPage extends BaseStatefulWidget {
  ChipPage({required super.title});

  @override
  State<StatefulWidget> createState() => ChipPageState();
}

class ChipPageState extends State<ChipPage> {
  bool _selected = false;
  int _selectIndex = 0;
  List<String> _filters = [];

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        //Material风格标签控件，此控件是其他标签控件的基类
        const RawChip(label: Text('RawChip')),
        const Divider(),
        TitleLayout(
          title: '设置禁用状态',
          child: const RawChip(
            label: Text('RawChip'),
            isEnabled: false,
          ),
        ),
        TitleLayout(
          title: '设置左侧控件',
          child: const RawChip(
            avatar: CircleAvatar(child: Text('R')),
            label: Text('RawChip'),
          ),
        ),
        TitleLayout(
          title: '设置label的样式和内边距',
          child: const RawChip(
            label: Text('RawChip'),
            labelStyle: TextStyle(color: Colors.blue),
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
        TitleLayout(
          title: '设置删除相关属性',
          child: RawChip(
            label: const Text('RawChip'),
            //点击删除图标，回调onDeleted
            onDeleted: () {
              print('RawChip onDeleted');
            },
            deleteIcon: const Icon(Icons.delete),
            deleteIconColor: Colors.red,
            deleteButtonTooltipMessage: '删除',
          ),
        ),
        TitleLayout(
          title: '设置形状、背景颜色及内边距',
          child: RawChip(
            label: const Text('RawChip'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        TitleLayout(
          title: '设置阴影',
          child: const RawChip(
            label: Text('RawChip'),
            elevation: 8,
            shadowColor: Colors.blue,
            //配置组件点击区域大小的属性，有2个值，分别为：
            //padded：最小点击区域为48*48
            //shrinkWrap：子组件的实际大小
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
        ),
        TitleLayout(
          title: '设置选中状态、颜色',
          child: RawChip(
            label: const Text('RawChip'),
            selected: _selected,
            onSelected: (v) {
              setState(() {
                _selected = v;
              });
            },
            selectedColor: Colors.blue,
            selectedShadowColor: Colors.red,
          ),
        ),
        TitleLayout(
          title: '设置选中状态下“前置对勾”图标',
          child: const RawChip(
            label: Text('RawChip'),
            selected: true,
            //showCheckmark为false时，无“前置对勾”图标
            showCheckmark: true,
            checkmarkColor: Colors.red,
          ),
        ),
        TitleLayout(
          title: '设置点击属性',
          child: RawChip(
            label: const Text('RawChip'),
            onPressed: () {
              print('RawChip onPressed');
            },
            //点击时有水波纹效果
            pressElevation: 12,
          ),
        ),
        //Chip是一个简单的标签控件，仅显示信息和删除相关属性，是一个简化版的RawChip，用法和RawChip一样。
        const Chip(label: Text('Chip')),
        const Divider(),
        //InputChip以紧凑的形式表示一条复杂的信息，例如实体（人，地方或事物）或对话文本。InputChip 本质上也是RawChip，用法和RawChip一样。
        const InputChip(label: Text('InputChip')),
        const Divider(),
        //ChoiceChip允许从一组选项中进行单个选择，创建一个类似于单选按钮的标签，本质上ChoiceChip也是一个RawChip，ChoiceChip本身不具备单选属性。
        TitleLayout(
          title: 'ChoiceChip实现单选',
          child: Wrap(
            spacing: 15,
            children: List.generate(
              10,
              (index) => ChoiceChip(
                label: Text('ChoiceChip$index'),
                selected: _selectIndex == index,
                onSelected: (v) {
                  setState(() {
                    _selectIndex = index;
                  });
                },
                selectedColor: Colors.blue,
              ),
            ).toList(),
          ),
        ),
        //FilterChip可以作为过滤标签，本质上也是一个RawChip
        TitleLayout(
          title: 'FilterChip实现多选',
          child: Column(
            children: [
              Wrap(
                spacing: 15,
                children: List.generate(
                  10,
                  (index) => FilterChip(
                    label: Text('FilterChip$index'),
                    selected: _filters.contains('$index'),
                    onSelected: (v) {
                      setState(() {
                        if (v) {
                          _filters.add('$index');
                        } else {
                          _filters
                              .removeWhere((element) => element == '$index');
                        }
                      });
                    },
                  ),
                ).toList(),
              ),
            ],
          ),
        ),
        //ActionChip显示与主要内容有关的一组动作，本质上也是一个RawChip，效果很像按钮类控件。
        ActionChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: const Text('A'),
          ),
          label: const Text('ActionChip'),
          onPressed: () {
            print('ActionChip onPressed');
          },
        ),
      ],
    );
  }
}

class InkWellPage extends BaseStatelessWidget {
  InkWellPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: "InkWell",
          child: InkWell(
            //onTap是点击事件回调，如果不设置无法出现“水波纹”效果
            onTap: () {
              print('点击回调');
            },
            //设置水波纹颜色
            splashColor: Colors.red,
            //设置高亮颜色颜色，高亮颜色是按住时显示的颜色
            highlightColor: Colors.blue,
            child: const Text(
              '这是InkWell点击效果',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        TitleLayout(
          title: 'Ink',
          child: Ink(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: const Text(
                  '这是Ink的点击效果',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPaintPage extends BaseStatelessWidget {
  CustomPaintPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        _buildPainter('绘制点 drawPoints', PointsPainter()),
        _buildPainter('绘制线 drawLine', LinePainter()),
        _buildPainter('绘制路径 drawPath', PathPainter(PaintingStyle.stroke)),
        _buildPainter('绘制路径 drawPath', PathPainter(PaintingStyle.fill)),
        _buildPainter('绘制圆形 drawCircle', CirclePainter()),
        _buildPainter('绘制椭圆 drawOval', OvalPainter(), height: 50),
        _buildPainter('绘制弧 drawArc', ArcPainter()),
        _buildPainter('绘制圆角矩形 drawRRect', RRectPainter()),
      ],
    );
  }

  _buildPainter(
    String title,
    CustomPainter? painter, {
    double width = 100,
    double height = 100,
  }) {
    return TitleLayout(
      title: title,
      child: CustomPaint(
        size: Size(width, height),
        painter: painter,
      ),
    );
  }
}

class PointsPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 6;

  @override
  void paint(Canvas canvas, Size size) {
    var points = [
      const Offset(0, 0),
      Offset(size.width / 2, size.height / 2),
      Offset(size.width, size.height),
    ];
    //PointMode有3种模式：
    //points：点
    //lines：将2个点绘制为线段，如果点的个数为奇数，最后一个点将会被忽略
    //polygon：将整个点绘制为一条线
    canvas.drawPoints(PointMode.points, points, _paint);
  }

  @override
  bool shouldRepaint(PointsPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class LinePainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        const Offset(0, 0), Offset(size.width, size.height), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class PathPainter extends CustomPainter {
  PathPainter(this.style);

  final PaintingStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    print('size:$size');
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = style
      ..strokeWidth = 3;
    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class OvalPainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class ArcPainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
        Rect.fromLTRB(0, 0, size.width, size.height), 0, pi / 2, true, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class RRectPainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromLTRBR(
            0, 0, size.width, size.height, const Radius.circular(10)),
        _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class DialogPage extends BaseStatelessWidget {
  DialogPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        _buildDialog("AlertDialog默认样式", "showDialog", () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('提示'),
                  content: const Text('确认删除吗？'),
                  actions: [
                    TextButton(onPressed: () {}, child: const Text('取消')),
                    TextButton(onPressed: () {}, child: const Text('确认')),
                  ],
                );
              });
        }),
        _buildDialog("AlertDialog自定义样式", "showDialog", () async {
          var result = await showDialog(
              context: context,
              barrierDismissible: false, //控制点击空白处是否退出对话框
              builder: (context) {
                return AlertDialog(
                  title: const Text('提示'),
                  content: const Text('确认删除吗？'),
                  backgroundColor: Colors.lightBlueAccent,
                  elevation: 24,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop('cancel');
                        },
                        child: const Text('取消')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop('ok');
                        },
                        child: const Text('确认')),
                  ],
                );
              });
          print('$result');
        }),
        _buildDialog('CupertinoAlertDialog样式', "showCupertinoDialog", () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('提示'),
                  content: const Text('确认删除吗？'),
                  actions: [
                    CupertinoDialogAction(
                        child: const Text('取消'),
                        onPressed: () {
                          Navigator.of(context).pop('cancel');
                        }),
                    CupertinoDialogAction(
                        child: const Text('确定'),
                        onPressed: () {
                          Navigator.of(context).pop('ok');
                        }),
                  ],
                );
              });
        }),
        _buildDialog('SimpleDialog样式', "showDialog", () {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: const Text('提示'),
                  children: [
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: const Text('确认删除吗？'),
                    ),
                    const Divider(height: 1),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop('cancel');
                      },
                      child: const Text('取消'),
                    ),
                    const Divider(height: 1),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop('ok');
                      },
                      child: const Text('确定'),
                    ),
                  ],
                );
              });
        }),
        _buildDialog('Dialog样式', "showDialog", () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('提示', style: TextStyle(fontSize: 25)),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        const Text('确认删除吗？'),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {}, child: const Text('取消')),
                            TextButton(
                                onPressed: () {}, child: const Text('确定')),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }),
      ],
    );
  }

  _buildDialog(String title, String btnText, VoidCallback? onPressed) {
    return TitleLayout(
      title: title,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(btnText),
      ),
    );
  }
}

class DateTimePage extends BaseStatefulWidget {
  DateTimePage({required super.title});

  @override
  State<StatefulWidget> createState() => DateTimePageState();
}

class DateTimePageState extends State<DateTimePage> {
  var _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        _buildPicker('DatePicker', 'showDatePicker', () async {
          var result = await showDatePicker(
              context: context,
              //添加国际化支持
              locale: const Locale('zh'),
              //初始化时间，通常情况下设置为当前时间
              initialDate: DateTime.now(),
              //开始时间，设置后，选择器不能选择小于此值的时间
              firstDate: DateTime(2020),
              //结束时间，设置后，选择器不能选择大于此值的时间
              lastDate: DateTime(2030),
              //控制可选日期，返回true表示日期可选，如下表示后天之前的时间可选
              selectableDayPredicate: (day) =>
                  day.difference(DateTime.now()).inDays < 2,
              //设置子控件，比如设置深色主题用法如下
              builder: (context, child) {
                return Theme(data: ThemeData.dark(), child: child!);
              });
          print('$result');
        }),
        _buildPicker('TimePicker', 'showTimePicker', () async {
          var result = await showTimePicker(
              context: context,
              //初始化时间
              initialTime: TimeOfDay.now(),
              //控制子控件，可以向DatePicker一样设置深色主题，还可以设置其显示24小时
              builder: (context, child) =>
                  Theme(data: ThemeData.dark(), child: child!)
              //设置其显示24小时
              // builder: (context, child) => MediaQuery(
              //     data: MediaQuery.of(context)
              //         .copyWith(alwaysUse24HourFormat: true),
              //     child: child!),
              //添加国际化支持,但showTimePicker并没有local参数，使用builder参数设置
              // builder: (context, child) => Localizations(
              //     locale: const Locale('en'),
              //     delegates: const <LocalizationsDelegate>[
              //       GlobalMaterialLocalizations.delegate,
              //       GlobalWidgetsLocalizations.delegate,
              //     ],
              //     child: child),
              );
          print('$result');
        }),
        _buildPicker('CalendarDatePicker', 'showDialog', () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 300,
                    child: CalendarDatePicker(
                      //可选日期的开始值
                      firstDate: DateTime(2020),
                      //可选日期的结束值
                      lastDate: DateTime(2026),
                      //选中的日期，选中的日期有圆形背景
                      initialDate: DateTime(2022, 9, 13),
                      //当前日期,文字高亮
                      currentDate: DateTime(2022, 9, 11),
                      //用户选择的日期发生变化时回调
                      onDateChanged: (date) {
                        print('$date');
                      },
                    ),
                  ),
                );
              });
        }),
        _buildPicker('CupertinoDatePicker', 'showDialog', () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      //初始化时间
                      initialDateTime: _dateTime,
                      //使用24小时制
                      use24hFormat: true,
                      //设置日期的格式：time(只显示时间)date(只显示日期)dateAndTime(日期和时间都显示)
                      mode: CupertinoDatePickerMode.dateAndTime,
                      //最小日期
                      minimumDate: DateTime.now().add(const Duration(days: -1)),
                      //最大日期
                      maximumDate: DateTime.now().add(const Duration(days: 1)),
                      //日期变化回调
                      onDateTimeChanged: (date) {
                        setState(() {
                          _dateTime = date;
                        });
                      },
                    ),
                  ),
                );
              });
        }),
        _buildPicker('CupertinoTimerPicker', 'showDialog', () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 300,
                    child: CupertinoTimerPicker(
                      //初始化时间
                      initialTimerDuration: Duration(
                          hours: DateTime.now().hour,
                          minutes: DateTime.now().minute,
                          seconds: DateTime.now().second),
                      //设置日期的格式：time(只显示时间)date(只显示日期)dateAndTime(日期和时间都显示)
                      mode: CupertinoTimerPickerMode.hms,
                      //日期变化回调
                      onTimerDurationChanged: (duration) {
                        print('$duration');
                      },
                    ),
                  ),
                );
              });
        }),
      ],
    );
  }

  _buildPicker(String title, String btnText, VoidCallback? onPressed) {
    return TitleLayout(
      title: title,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(btnText),
      ),
    );
  }
}

class OpacityPage extends BaseStatefulWidget {
  OpacityPage({required super.title});

  @override
  State<StatefulWidget> createState() => OpacityPageState();
}

class OpacityPageState extends State<OpacityPage> {
  bool _click = false;

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: 'Opacity',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text('1', style: TextStyle(color: Colors.white)),
              ),
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text('2', style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('3', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        TitleLayout(
          title: 'AnimatedOpacity',
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _click = !_click;
                  });
                },
                child: const Text('开始动画'),
              ),
              Stack(
                children: [
                  Image.network(
                      'https://img2.baidu.com/it/u=1003272215,1878948666&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800'),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      onEnd: () {
                        setState(() {
                          _click = !_click;
                        });
                      },
                      duration: const Duration(seconds: 3),
                      opacity: _click ? 0.2 : 0.8,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
