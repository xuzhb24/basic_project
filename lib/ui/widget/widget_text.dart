import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base.dart';

///文本组件
class TextPage extends BaseStatelessWidget {
  TextPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        const Text('基本用法'),
        SpaceDivider(),
        const Text('设置文本大小和颜色',
            style: TextStyle(color: Colors.red, fontSize: 20)),
        SpaceDivider(),
        //字体粗细共有9个级别，为w100至w900，FontWeight.bold是w700。
        const Text('设置字体粗细', style: TextStyle(fontWeight: FontWeight.bold)),
        SpaceDivider(),
        const Text('设置斜体', style: TextStyle(fontStyle: FontStyle.italic)),
        SpaceDivider(),
        //下载字体库后放到根目录下的fonst文件夹，配置pubspec.yaml
        const Text(
          '设置自定义的字体',
          style: TextStyle(fontFamily: 'lishu', fontSize: 25),
        ),
        /**
         * textAlign只是控制水平方向的对齐方式，值说明如下：
         * left：左对齐
         * right：右对齐
         * center：居中
         * justify：两端对齐，此属性中文存在bug（Flutter版本：1.17.3）
         * start：前端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则左对齐，设置TextDirection.rtl则右对齐
         * end：末端对齐，和TextDirection属性有关，如果设置TextDirection.ltr，则右对齐，设置TextDirection.rtl则左对齐
         */
        _buildText(const Text('设置对齐方式：center', textAlign: TextAlign.center)),
        _buildText(const Text('设置文本自动换行', softWrap: true), width: 100),
        /**
         * 文本溢出的处理方式：
         * clip：直接裁剪。
         * fade：越来越透明。
         * ellipsis：省略号结尾。
         * visible：依然显示，此时将会溢出父组件。
         */
        _buildText(
            const Text('文本超出范围时的处理',
                overflow: TextOverflow.ellipsis, softWrap: false),
            width: 100),
        //设置全局字体样式，见main.dart中MaterialApp => textTheme => bodyText2设置
      ],
    );
  }

  _buildText(Widget child, {double width = 200, double height = 50}) {
    return Column(
      children: [
        SpaceDivider(),
        Container(
          width: width,
          height: height,
          color: Colors.blue.withOpacity(.5),
          child: child,
        )
      ],
    );
  }
}

class RichTextPage extends BaseStatelessWidget {
  RichTextPage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        /**
         * RichText参数
         * text：必传参数,用来展示文本
         * overflow：文本溢出的处理方式
         * maxLines：用来设置最大行数
         * textAlign：对齐属性
         * textDirection：文本排列方式，TextDirection.rtl文本从右到左，TextDirection.ltr文本从左到右
         * textScaleFactor：文字放大缩小倍数
         * recognizer：手势监听
         */
        RichText(
          text: const TextSpan(
            // style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(text: '红色', style: TextStyle(color: Colors.red)),
              TextSpan(
                  text: '，黑色字体，大小为20',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ],
          ),
        ),
        SpaceDivider(),
        _buildRichText(
          RichText(
            text: const TextSpan(
                text:
                    '设置对齐效果：TextAlign.start 设置对齐效果：TextAlign.start 设置对齐效果：TextAlign.start'),
            textAlign: TextAlign.start,
          ),
        ),
        SpaceDivider(),
        _buildRichText(
          RichText(
            text: const TextSpan(
                text:
                    '设置对齐效果：TextAlign.center 设置对齐效果：TextAlign.center 设置对齐效果：TextAlign.center'),
            textAlign: TextAlign.center,
          ),
        ),
        SpaceDivider(),
        _buildRichText(
          RichText(
            text: const TextSpan(
                text:
                    '设置对齐效果：TextAlign.end 设置对齐效果：TextAlign.end 设置对齐效果：TextAlign.end'),
            textAlign: TextAlign.end,
          ),
        ),
        SpaceDivider(),
        RichText(
            text: TextSpan(children: [
          const TextSpan(
            text: '登陆即视为同意',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: '《隐私协议》',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('点击《隐私协议》')));
              },
          ),
        ]))
      ],
    );
  }

  _buildRichText(Widget child, {double width = 250, double height = 80}) {
    return Column(
      children: [
        SpaceDivider(),
        Container(
          width: width,
          height: height,
          color: Colors.blue,
          child: child,
        )
      ],
    );
  }
}

class TextFieldPage extends BaseStatefulWidget {
  TextFieldPage({required super.title});

  @override
  State<StatefulWidget> createState() => TextFieldPageState();
}

class TextFieldPageState extends State<TextFieldPage> {
  var _textFieldValue = '';
  TextEditingController? _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        if (_controller != null) {
          ////获取输入框的内容，变为大写
          _controller!.text = _controller!.text.toUpperCase();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: widget.title,
      children: [
        SpaceDivider(),
        _buildTextField(
          '最简单的文本输入框',
          const TextField(),
        ),
        _buildTextField(
          '设置icon',
          const TextField(
              //decoration是TextField组件的装饰（外观）参数，类型是InputDecoration。
              decoration: InputDecoration(
            //icon显示在输入框的前面
            icon: Icon(Icons.person),
          )),
        ),
        _buildTextField(
          '设置labelText',
          const TextField(
            decoration: InputDecoration(
              //当输入框是空而且没有焦点时，labelText显示在输入框上边，当获取焦点或者不为空时labelText往上移动一点，labelStyle参数表示文本样式
              labelText: '姓名',
              labelStyle: TextStyle(color: Colors.red),
            ),
          ),
        ),
        _buildTextField(
          '设置helperText',
          const TextField(
            decoration: InputDecoration(
              //helperText显示在输入框的左下部，用于提示用户，helperStyle参数表示文本样式
              helperText: '用户名长度为6-10个字母',
              helperStyle: TextStyle(color: Colors.blue),
              helperMaxLines: 1,
            ),
          ),
        ),
        _buildTextField(
          '设置hintText',
          const TextField(
            decoration: InputDecoration(
              //hintText是当输入框为空时的提示，不为空时不在显示
              hintText: '请输入用户名',
              hintStyle: TextStyle(color: Colors.grey),
              hintMaxLines: 1,
            ),
          ),
        ),
        _buildTextField(
          '设置errorText',
          const TextField(
            decoration: InputDecoration(
              //errorText显示在输入框的左下部，默认字体为红色
              errorText: '用户名输入错误',
              errorStyle: TextStyle(fontSize: 12),
              errorMaxLines: 1,
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            ),
          ),
        ),
        _buildTextField(
          '设置prefix',
          const TextField(
            decoration: InputDecoration(
              //prefix系列的组件是输入框前面的部分
              prefix: Icon(Icons.person),
            ),
          ),
        ),
        _buildTextField(
          '设置suffix',
          const TextField(
            decoration: InputDecoration(
              //suffix在输入框的尾部
              suffixIcon: Icon(Icons.person),
            ),
          ),
        ),
        _buildTextField(
          '统计输入框文字的个数',
          TextField(
            onChanged: (value) {
              setState(() {
                _textFieldValue = value;
              });
            },
            decoration: InputDecoration(
              //counter仅仅是展示效果，不具备自动统计字数的功能
              counterText: '${_textFieldValue.length}/32',
            ),
          ),
        ),
        _buildTextField(
          '统计输入框文字的个数（推荐）',
          TextField(
            maxLength: 20,
            buildCounter: (
              BuildContext context, {
              int? currentLength,
              int? maxLength,
              bool isFocused = true,
            }) {
              return Text(
                '$currentLength/$maxLength',
              );
            },
          ),
        ),
        _buildTextField(
          '仿QQ登录输入框',
          Container(
            width: 250,
            height: 50,
            child: const TextField(
              decoration: InputDecoration(
                //filled为true时，输入框将会被fillColor填充
                filled: true,
                fillColor: Color(0x30cccccc),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x00FF0000)),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                hintText: 'QQ号/手机号/邮箱',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x00000000)),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
          ),
        ),
        _buildTextField(
          '设置controller，将输入的英文变为大写',
          TextField(
            //controller是输入框文本编辑的控制器，可以获取TextField的内容、设置TextField的内容
            //有时输入框后面带有“清除”功能，需要controller来实现。
            //如果需要2个TextField的内容进行同步，只需要给2个TextField设置同一个controller即可实现。
            controller: _controller,
          ),
        ),
        /**
         * keyboardType参数控制软键盘的类型
         * text：通用键盘。
         * multiline：当TextField为多行时（maxLines设置大于1），右下角的为“换行” 按键。
         * number：数字键盘。
         * phone：手机键盘，比数字键盘多"*"和 "#"。
         * datetime：在ios上和text一样，在android上出现数字键盘、":"和 "-"。
         * emailAddress：邮箱键盘，有"@" 和 "."按键。
         * url：url键盘，有"/" 和 "."按键。
         * visiblePassword：既有字母又有数字的键盘。
         */
        _buildTextField(
          '设置keyboardType',
          const TextField(
            keyboardType: TextInputType.number,
          ),
        ),
        /**
         * textInputAction参数控制软键盘右下角的按键，说明如下：
         * none：android上显示返回键，ios不支持。
         * unspecified：让操作系统自己决定哪个合适，一般情况下，android显示“完成”或者“返回”。
         * done：android显示代表“完成”的按钮，ios显示“Done”（中文：完成）。
         * go：android显示表达用户去向目的地的图标，比如向右的箭头，ios显示“Go”（中文：前往）。
         * search：android显示表达搜索的按钮，ios显示"Search"（中文：搜索）。
         * send：android显示表达发送意思的按钮，比如“纸飞机”按钮，ios显示"Send"（中文：发送）。
         * next：android显示表达“前进”的按钮，比如“向右的箭头”,ios显示"Next"（中文：下一项）。
         * previous：android显示表达“后退”的按钮，比如“向左的箭头”,ios不支持。
         * continueAction：android 不支持，ios仅在ios9.0+显示"Continue"（中文：继续）。
         * join：Android和ios显示"Join"（中文：加入）。
         * route：android 不支持，ios显示"Route"（中文：路线）。
         * emergencyCall：android 不支持，ios显示"Emergency Call"（中文：紧急电话）。
         * newline：android显示表达“换行”的按钮，ios显示”换行“。
         */
        _buildTextField(
          '设置textInputAction',
          const TextField(
            textInputAction: TextInputAction.search,
          ),
        ),
        /**
         * textCapitalization参数是配置键盘是大写还是小写，仅支持键盘模式为text，其他模式下忽略此配置，说明如下：
         * words：每一个单词的首字母大写。
         * sentences：每一句话的首字母大写。
         * characters：每个字母都大写
         * none：都小写
         */
        _buildTextField(
          '设置textCapitalization',
          const TextField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        //textAlignVertical表示垂直方向的对齐方式，textDirection表示文本方向
        _buildTextField(
          '设置textAlignVertical和textDirection',
          Container(
            color: Colors.grey.withOpacity(.5),
            child: const TextField(
              textAlignVertical: TextAlignVertical.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        //toolbarOptions表示长按时弹出的菜单，有copy、cut、paste、selectAll
        _buildTextField(
          '设置toolbarOptions',
          const TextField(
            toolbarOptions: ToolbarOptions(
              copy: false,
              cut: false,
              paste: false,
              selectAll: false,
            ),
          ),
        ),
        //cursor表示光标
        _buildTextField(
          '设置光标',
          const TextField(
            showCursor: true,
            cursorWidth: 3,
            cursorRadius: Radius.circular(10),
            cursorColor: Colors.red,
          ),
        ),
        //将输入框设置为密码框，只需obscureText属性设置true即可
        _buildTextField(
          '设置密码框',
          const TextField(
            obscureText: true,
          ),
        ),
        //通过inputFormatters可以限制用户输入的内容，比如只想让用户输入字符
        _buildTextField(
          '设置inputFormatters',
          TextField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
            ],
          ),
        ),
        _buildTextField(
          '设置输入监听事件',
          TextField(
            //onChanged是当内容发生变化时回调
            onChanged: (value) {
              print('onChanged:$value');
            },
            //onEditingComplete是点击回车或者点击软键盘上的完成回调
            onEditingComplete: () {
              print('onEditingComplete');
            },
            //onTap点击输入框时回调
            onTap: () {
              print('onTap');
            },
          ),
        ),
        _buildTextField(
          '处理焦点',
          Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //动态获取焦点
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    child: const Text('获取焦点'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      //动态失去焦点
                      _focusNode.unfocus();
                    },
                    child: const Text('移除焦点'),
                  ),
                ],
              ),
              TextField(focusNode: _focusNode),
            ],
          ),
        ),
      ],
    );
  }

  _buildTextField(String title, Widget child) {
    return TitleLayout(
      title: title,
      centerTitle: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: child,
      ),
    );
  }
}
