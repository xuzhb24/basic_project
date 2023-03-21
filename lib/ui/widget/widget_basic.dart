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
