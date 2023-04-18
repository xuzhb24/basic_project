import 'dart:io';

import 'package:basic_project/func/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base.dart';

///基础组件
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

class RadioPage extends BaseStatefulWidget {
  RadioPage({required super.title});

  @override
  State<StatefulWidget> createState() => RadioPageState();
}

class RadioPageState extends State<RadioPage> {
  var _radioGroupValue1 = '语文';
  var _radioGroupValue2 = '语文';

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      centerContent: true,
      children: [
        TitleLayout(
          title: 'Radio',
          child: Row(
            children: [
              //Radio控件本身没有State状态，当value的值和groupValue值相等时，Radio显示选中状态
              //有多个单选按钮，当选中一个时，其他自动变为未选中状态
              Radio(
                //activeColor是选中状态下颜色
                activeColor: Colors.red,
                value: '语文',
                groupValue: _radioGroupValue1,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue1 = value as String;
                  });
                },
              ),
              Radio(
                value: '数学',
                groupValue: _radioGroupValue1,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue1 = value as String;
                  });
                },
              ),
              Radio(
                value: '英语',
                groupValue: _radioGroupValue1,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue1 = value as String;
                  });
                },
              ),
            ],
          ),
        ),
        TitleLayout(
          title: 'RadioListTile',
          child: Row(
            children: [
              Flexible(
                //RadioListTile是一个Radio和ListTile组合的控件
                child: RadioListTile(
                  title: const Text('语文'),
                  value: '语文',
                  contentPadding: const EdgeInsets.all(0),
                  groupValue: _radioGroupValue2,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue2 = value as String;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: const Text('数学'),
                  value: '数学',
                  contentPadding: const EdgeInsets.all(0),
                  groupValue: _radioGroupValue2,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue2 = value as String;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: const Text('英语'),
                  value: '英语',
                  contentPadding: const EdgeInsets.all(0),
                  groupValue: _radioGroupValue2,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue2 = value as String;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CheckboxPage extends BaseStatefulWidget {
  CheckboxPage({required super.title});

  @override
  State<StatefulWidget> createState() => CheckboxPageState();
}

class CheckboxPageState extends State<CheckboxPage> {
  var _checkValue = false;
  var _checkValue1 = false;
  var _checkValue2 = false;
  var _checkValue3 = false;

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: 'Checkbox',
      centerContent: true,
      children: [
        TitleLayout(
          title: widget.title,
          child: Checkbox(
            //value值为bool类型，true表示选择状态
            value: _checkValue,
            //activeColor为激活状态下颜色，是矩形区域内的颜色
            activeColor: Colors.red,
            //checkColor是选中后“对勾”的颜色
            checkColor: Colors.blue,
            //onChanged为发生变化时回调，即点击控件时回调，方法内的参数为新的值
            onChanged: (value) {
              setState(() {
                _checkValue = value!;
              });
            },
          ),
        ),
        TitleLayout(
          title: 'CheckboxListTile',
          child: Column(
            children: [
              //CheckboxListTile默认是充满父组件的，因此需要Container限制其宽度
              SizedBox(
                width: 129,
                child: CheckboxListTile(
                  title: const Text('语文'),
                  //ListTileControlAffinity取值范围说明如下
                  //leading：勾选框在开头位置
                  //trailing：勾选框在结尾位置
                  //platform：根据平台确定
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _checkValue1,
                  onChanged: (value) {
                    setState(() {
                      _checkValue1 = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 129,
                child: CheckboxListTile(
                  title: const Text('数学'),
                  value: _checkValue2,
                  onChanged: (value) {
                    setState(() {
                      _checkValue2 = value!;
                    });
                  },
                ),
              ),
              CheckboxListTile(
                title: const Text('英语'),
                value: _checkValue3,
                //设置其子标题和第二图标
                subtitle: const Text('子标题'),
                secondary: const Icon(Icons.person),
                onChanged: (value) {
                  setState(() {
                    _checkValue3 = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SliderPage extends BaseStatefulWidget {
  SliderPage({required super.title});

  @override
  State<StatefulWidget> createState() => SliderPageState();
}

class SliderPageState extends State<SliderPage> {
  double _sliderValue1 = 0;
  double _sliderValue2 = 50;
  double _sliderValue3 = 0;
  double _sliderValue4 = 0;
  double _sliderValue5 = 0;
  double _sliderValue6 = 0;
  RangeValues _rangeValues = const RangeValues(0, 25);

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: '基础用法',
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('值：$_sliderValue1'),
                Slider(
                  //value：当前值
                  value: _sliderValue1,
                  //onChanged：滑块值改变时回调
                  onChanged: (value) {
                    setState(() {
                      _sliderValue1 = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '设置滑动范围',
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('值：$_sliderValue2'),
                Slider(
                  value: _sliderValue2,
                  min: 25,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue2 = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '设置滑块的滑动为离散的',
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('值：$_sliderValue3'),
                Slider(
                  value: _sliderValue3,
                  label: '$_sliderValue3',
                  min: 0,
                  max: 100,
                  divisions: 4,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue3 = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        TitleLayout(
          title: '自定义样式',
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red,
              thumbColor: Colors.blue,
              overlayColor: Colors.green,
              valueIndicatorColor: Colors.purpleAccent,
            ),
            child: Slider(
              value: _sliderValue4,
              label: '$_sliderValue4',
              min: 0,
              max: 100,
              divisions: 4,
              onChanged: (value) {
                setState(() {
                  _sliderValue4 = value;
                });
              },
            ),
          ),
        ),
        //RangeSlider和Slider几乎一样，RangeSlider是范围滑块，想要选择一段值，可以使用RangeSlider。
        TitleLayout(
          title: 'RangeSlider',
          child: RangeSlider(
            values: _rangeValues,
            labels: RangeLabels('${_rangeValues.start}', '${_rangeValues.end}'),
            min: 0,
            max: 100,
            divisions: 4,
            onChanged: (value) {
              setState(() {
                _rangeValues = value;
              });
            },
          ),
        ),
        //ios风格的Slider，使用CupertinoSlider
        TitleLayout(
          title: 'iOS风格的Slider',
          child: CupertinoSlider(
            value: _sliderValue5,
            onChanged: (value) {
              setState(() {
                _sliderValue5 = value;
              });
            },
          ),
        ),
        //当然也可以根据平台显示不同风格的Slider，ios平台显示CupertinoSlider效果，其他平台显示Material风格
        TitleLayout(
          title: '根据平台显示不同风格的Slider',
          child: Slider.adaptive(
            value: _sliderValue6,
            onChanged: (value) {
              setState(() {
                _sliderValue6 = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class SwitchPage extends BaseStatefulWidget {
  SwitchPage({required super.title});

  @override
  State<StatefulWidget> createState() => SwitchPageState();
}

class SwitchPageState extends State<SwitchPage> {
  var _switchValue1 = false;
  var _switchValue2 = false;
  var _switchValue3 = false;
  var _switchValue4 = false;
  var _switchValue5 = false;

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      centerContent: true,
      children: [
        TitleLayout(
          title: '基础用法',
          child: Switch(
            value: _switchValue1,
            onChanged: (value) {
              setState(() {
                _switchValue1 = value;
              });
            },
          ),
        ),
        TitleLayout(
          title: '设置激活和未激活样式',
          child: Switch(
            value: _switchValue2,
            //设置激活状态下thumb及track颜色
            activeColor: Colors.red,
            activeTrackColor: Colors.blue,
            //设置未激活样式
            inactiveThumbColor: Colors.black54,
            inactiveTrackColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                _switchValue2 = value;
              });
            },
          ),
        ),
        TitleLayout(
          title: '设置图片',
          child: Switch(
            value: _switchValue3,
            inactiveThumbImage: const AssetImage('images/bird.png'),
            activeThumbImage: const AssetImage('images/bird.png'),
            onChanged: (value) {
              setState(() {
                _switchValue3 = value;
              });
            },
          ),
        ),
        //SwitchListTile是Switch和ListTile组合控件
        TitleLayout(
          title: 'SwitchListTile',
          child: SwitchListTile(
            title: const Text('是否允许4G下载'),
            value: _switchValue4,
            onChanged: (value) {
              setState(() {
                _switchValue4 = value;
              });
            },
          ),
        ),
        //CupertinoSwitch是ios风格控件
        TitleLayout(
          title: 'CupertinoSwitch',
          child: CupertinoSwitch(
            value: _switchValue5,
            onChanged: (value) {
              setState(() {
                _switchValue5 = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ProgressIndicatorPage extends BaseStatelessWidget {
  ProgressIndicatorPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        TitleLayout(
          title: 'LinearProgressIndicator—基础用法',
          centerTitle: false,
          child: const LinearProgressIndicator(),
        ),
        TitleLayout(
          title: 'LinearProgressIndicator—设置具体进度值',
          centerTitle: false,
          child: const LinearProgressIndicator(
            //value的值范围是0-1
            value: 0.6,
          ),
        ),
        TitleLayout(
          title: 'LinearProgressIndicator—设置背景颜色及进度值',
          centerTitle: false,
          child: const LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.greenAccent,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
        TitleLayout(
          title: 'CircularProgressIndicator—基础用法',
          centerTitle: false,
          child: const CircularProgressIndicator(),
        ),
        TitleLayout(
          title: 'CircularProgressIndicator—设置进度值及颜色值',
          centerTitle: false,
          child: const CircularProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.greenAccent,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
        //CupertinoActivityIndicator是ios风格的指示器，CupertinoActivityIndicator不能设置进度，只能一直转“菊花”
        TitleLayout(
          title: 'CupertinoActivityIndicator',
          child: const CupertinoActivityIndicator(
            //radius参数是半径，值越大，控件越大。
            radius: 20,
          ),
        ),
      ],
    );
  }
}

class ImageIconPage extends BaseStatelessWidget {
  ImageIconPage({required super.title});

  @override
  Widget build(BuildContext context) {
    //在项目中建议优先使用Icon组件，Icon本质上是一种字体，只不过显示的不是文字，而是图标，
    //而Image组件先通过图片解码器将图片解码，所以Icon有如下优点：
    //1.通常情况下，图标比图片体积更小，显著的减少App包体积。
    //2.图标不会出现失真或者模糊的现象，例如将20x20的图片，渲染在200x200的屏幕上，图片会失真或模糊，而图标是矢量图，不会失真，就像字体一样。
    //3.多个图标可以存放在一个文件中，方便管理。
    //4.全平台通用。
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        TitleLayout(
          title: '加载网络图片',
          child: Image.network(Constant.imageUrl, height: 100),
        ),
        //当加载图片的时候回调frameBuilder，当此参数为null时，此控件将会在图片加载完成后显示，
        //未加载完成时显示空白，尤其在加载网络图片时会更明显。
        //因此此参数可以用于处理图片加载时显示占位图片和加载图片的过渡效果，比如淡入淡出效果。
        TitleLayout(
          title: '加载网络图片：实现淡入淡出效果',
          child: Image.network(
            Constant.bannerImageUrl1,
            height: 100,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                child: child,
              );
            },
          ),
        ),
        //loadingBuilder参数比frameBuilder控制的力度更细，可以获取图片加载的进度
        TitleLayout(
          title: '加载网络图片：显示进度条',
          child: Image.network(
            Constant.bannerImageUrl2,
            height: 100,
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
        //在项目根目录下新建images目录，然后拷贝图片到images目录，在pubspec.yaml的flutter根节点下配置文件
        //第一种方式：
        //assets:
        //   - images/
        //第二种方式：
        //assets:
        //   - images/bird.png
        //通常情况下，使用第一种方式，因为图片会有很多张，增加一张就这里配置一个太麻烦。
        TitleLayout(
          title: '加载项目中图片',
          child: Image.asset('images/aa.png'),
        ),
        //要加载设备（手机）上的图片首先需要获取设备图片的路径，由于不同平台的路径不同，因此路径的获取必须依靠原生支持，
        //如果了解原生（Android和iOS）开发，可以直接使用MethodChannel获取路径,
        //如果不懂原生（Android和iOS）开发，可以使用第三方插件获取路径，这里推荐官方的path_provider
        //安卓需要申请权限"android.permission.READ_EXTERNAL_STORAGE"
        TitleLayout(
          title: '加载设备上的图片',
          child: Image.file(File('/sdcard/aa.png')),
        ),
        TitleLayout(
          title: '设置图片大小',
          child: Container(
            color: Colors.green.withOpacity(.3),
            child: Image.asset('images/aa.png', width: 100, height: 100),
          ),
        ),
        //填充模式BoxFit取值：
        //fill：完全填充，宽高比可能会变。
        //contain：等比拉伸，直到一边填充满。
        //cover：等比拉伸，直到2边都填充满，此时一边可能超出范围。
        //fitWidth：等比拉伸，宽填充满。
        //fitHeight：等比拉伸，高填充满。
        //none：当组件比图片小时，不拉伸，超出范围截取。
        //scaleDown：当组件比图片小时，图片等比缩小，效果和contain一样。
        TitleLayout(
          title: '设置填充模式BoxFit.fill',
          child: Container(
            color: Colors.green.withOpacity(.3),
            child: Image.asset(
              'images/aa.png',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
        ),
        TitleLayout(
          title: '设置填充模式BoxFit.cover',
          child: Container(
            color: Colors.green.withOpacity(.3),
            child: Image.asset(
              'images/aa.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        //BoxFit.none的裁减和alignment相关，默认居中
        TitleLayout(
          title: '设置填充模式BoxFit.none',
          child: Container(
            color: Colors.green.withOpacity(.3),
            child: Image.asset(
              'images/aa.png',
              width: 30,
              height: 60,
              fit: BoxFit.none,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        //repeat表示当组件有空余位置时，将会重复显示图片
        //重复的模式有：
        //repeat：x,y方向都充满。
        //repeatX：x方向充满。
        //repeatY：y方向充满。
        //noRepeat：不重复。
        TitleLayout(
          title: '重复显示图片',
          child: Container(
            color: Colors.green.withOpacity(.3),
            child: Image.asset(
              'images/aa.png',
              width: double.infinity,
              height: 60,
              repeat: ImageRepeat.repeatX,
            ),
          ),
        ),
        //matchTextDirection设置为true时，图片的绘制方向为TextDirection设置的方向，其父组件必须为Directionality
        TitleLayout(
          title: '设置图片绘制方向从右到左',
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Image.asset(
              'images/aa.png',
              matchTextDirection: true,
              //filterQuality表示绘制图像的质量，从高到低为：high->medium->low->none。越高效果越好，越平滑，当然性能损耗越大，
              //默认是low，如果发现图片有锯齿，可以设置此参数。
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        //centerSlice用于.9图，.9图用于拉伸图片的特定区域，centerSlice设置的区域（Rect）就是拉伸的区域。
        //.9图通常用于控件大小、宽高比不固定的场景，比如聊天背景图片等。
        //如果使用centerSlice属性，图片必须比组件的尺寸小
        TitleLayout(
          title: '使用centerSlice拉伸图片的特定区域',
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                centerSlice: Rect.fromLTWH(20, 20, 10, 10),
                image: AssetImage('images/bb.9.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        //Icon是图标组件，Icon不具有交互属性，如果想要交互，可以使用IconButton
        //Icons官网地址：https://api.flutter.dev/flutter/material/Icons-class.html
        TitleLayout(
          title: '设置图标的大小和颜色',
          child: const Icon(
            Icons.add,
            size: 100,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
