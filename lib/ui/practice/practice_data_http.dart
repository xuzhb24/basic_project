import 'dart:convert';
import 'dart:io';

import 'package:basic_project/func/router_table.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../base.dart';

///数据存储和网络请求实战
class DataHttpPracticePage extends BaseStatelessWidget {
  DataHttpPracticePage({required super.title});

  @override
  Widget build(BuildContext context) {
    return ListLayout(
      title: title,
      widgetList: [
        RouterTable.dataHttpPractice1,
        RouterTable.dataHttpPractice2,
        RouterTable.dataHttpPractice3,
        RouterTable.dataHttpPractice4,
        RouterTable.dataHttpPractice5,
        RouterTable.dataHttpPractice6,
        RouterTable.dataHttpPractice7,
        RouterTable.dataHttpPractice8,
      ],
    );
  }
}

class DataHttpPracticePage1 extends BaseStatefulWidget {
  DataHttpPracticePage1({required super.title});

  @override
  State<StatefulWidget> createState() => DataHttpPracticePage1State();
}

class DataHttpPracticePage1State extends State<DataHttpPracticePage1> {
  late Future<Directory> _tempDirectory;
  late Future<Directory> _appSupportDirectory;
  late Future<Directory> _appLibraryDirectory;
  late Future<Directory> _appDocumentsDirectory;
  late Future<Directory?> _externalStorageDirectory;
  late Future<List<Directory>?> _externalStorageDirectories;
  late Future<List<Directory>?> _externalCacheDirectories;
  late Future<Directory?> _downloadDirectory;

  @override
  void initState() {
    super.initState();
    setState(() {
      //path_provider提供了8个方法获取不同的文件路径：http://laomengit.com/guide/data_storage/path_provider.html
      //1.getTemporaryDirectory：临时目录，适用于下载的缓存文件，此目录随时可以清除，此目录为应用程序私有目录，
      //  其他应用程序无法访问此目录。Android上对应getCacheDir，iOS上对应NSCachesDirectory。
      //2.getApplicationSupportDirectory：应用程序可以在其中放置应用程序支持文件的目录的路径。将此文件用于您不想向用户公开的文件。
      //  您的应用不应将此目录用于存放用户数据文件。在iOS上，对应NSApplicationSupportDirectory，如果此目录不存在，则会自动创建。在Android上，对应getFilesDir。
      //3.getLibraryDirectory：应用程序可以在其中存储持久性文件，备份文件以及对用户不可见的文件的目录路径，例如storage.sqlite.db。
      //  在Android上，此函数抛出[UnsupportedError]异常，没有等效项路径存在。
      //4.getApplicationDocumentsDirectory：应用程序可能在其中放置用户生成的数据或应用程序无法重新创建的数据的目录路径。
      //  在iOS上，对应NSDocumentDirectory API。如果数据不是用户生成的，考虑使用[getApplicationSupportDirectory]。
      //  在Android上，对应getDataDirectory API。如果要让用户看到数据，请考虑改用[getExternalStorageDirectory]。
      //5.getExternalStorageDirectory：应用程序可以访问顶级存储的目录的路径。由于此功能仅在Android上可用，因此应在发出此函数调用之前确定当前操作系统。
      //  在iOS上，此功能会引发[UnsupportedError]异常，因为无法在应用程序的沙箱外部访问。
      //  在Android上，对应getExternalFilesDir（null）。
      //6.getExternalCacheDirectories：存储特定于应用程序的外部缓存数据的目录的路径。 这些路径通常位于外部存储（如单独的分区或SD卡）上。
      //  电话可能具有多个可用的存储目录。 由于此功能仅在Android上可用，因此应在发出此函数调用之前确定当前操作系统。 在iOS上，此功能会抛出UnsupportedError，
      //  因为这是不可能的在应用程序的沙箱外部访问。在Android上，对应Context.getExternalCacheDirs（）或API Level 低于19的Context.getExternalCacheDir（）。
      //7.getExternalStorageDirectories：可以存储应用程序特定数据的目录的路径。 这些路径通常位于外部存储（如单独的分区或SD卡）上。
      //  由于此功能仅在Android上可用，因此应在发出此函数调用之前确定当前操作系统。 在iOS上，此功能会抛出UnsupportedError，因为这是不可能的在应用程序的沙箱外部访问。
      //  在Android上，对应Context.getExternalFilesDirs（String type）或API Level 低于19的Context.getExternalFilesDir（String type）。
      //8.getDownloadsDirectory：存储下载文件的目录的路径，这通常仅与台式机操作系统有关。 在Android和iOS上，此函数将引发[UnsupportedError]异常。
      _tempDirectory = getTemporaryDirectory();
      _appSupportDirectory = getApplicationSupportDirectory();
      _appLibraryDirectory = getLibraryDirectory();
      _appDocumentsDirectory = getApplicationDocumentsDirectory();
      _externalStorageDirectory = getExternalStorageDirectory();
      _externalCacheDirectories = getExternalCacheDirectories();
      _externalStorageDirectories = getExternalStorageDirectories();
      _downloadDirectory = getDownloadsDirectory();
    });
  }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text(
          'Error:${snapshot.error}',
          style: const TextStyle(color: Colors.red),
        );
      } else if (snapshot.hasData) {
        text = Text('path:${snapshot.data?.path}');
      } else {
        text = const Text(
          'path unavailable',
          style: TextStyle(color: Colors.blue),
        );
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: text,
    );
  }

  Widget _buildDirectories(
      BuildContext context, AsyncSnapshot<List<Directory>?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text(
          'Error:${snapshot.error}',
          style: const TextStyle(color: Colors.red),
        );
      } else if (snapshot.hasData) {
        String combined = snapshot.data!.map((e) => e.path).join(', ');
        text = Text('paths:$combined');
      } else {
        text = const Text(
          'path unavailable',
          style: TextStyle(color: Colors.blue),
        );
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: text,
    );
  }

  Widget _buildItem(String title, Future<Directory?> future) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        FutureBuilder(future: future, builder: _buildDirectory),
      ],
    );
  }

  Widget _buildItems(String title, Future<List<Directory>?> future) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title),
        ),
        FutureBuilder(future: future, builder: _buildDirectories),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: widget.title,
      child: Center(
        child: ListView(
          itemExtent: 120,
          children: [
            _buildItem('getTemporaryDirectory', _tempDirectory),
            _buildItem('getApplicationSupportDirectory', _appSupportDirectory),
            _buildItem('getLibraryDirectory', _appLibraryDirectory),
            _buildItem(
                'getApplicationDocumentsDirectory', _appDocumentsDirectory),
            _buildItem(
                'getExternalStorageDirectory', _externalStorageDirectory),
            _buildItem('getDownloadsDirectory', _downloadDirectory),
            _buildItems(
                'getExternalStorageDirectories', _externalStorageDirectories),
            _buildItems(
                'getExternalCacheDirectories', _externalCacheDirectories),
          ],
        ),
      ),
    );
  }
}

class DataHttpPracticePage2 extends BaseStatelessWidget {
  DataHttpPracticePage2({required super.title});

  _createDir(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //Platform.pathSeparator表示路径分隔符，对于Android和iOS来说表示‘/’
    String path = '${documentsDirectory.path}${Platform.pathSeparator}dir';
    var dir = Directory(path);
    var exist = dir.existsSync();
    if (exist) {
      _showMsg(context, '当前文件夹已经存在');
    } else {
      //create中有一个可选参数recursive，默认值为false，false表示只能创建最后一级文件夹，
      var result = await dir.create();
      _showDialog(context, '$result');
      //如果创建“dir/dir1”这种嵌套文件夹，recursive为false时将抛出异常，设置为true可以创建嵌套文件夹。下面在根目录创建“dir1/dir2”文件夹，代码如下：
      var dir1 = await Directory(
              '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}dir1${Platform.pathSeparator}')
          .create(recursive: true);
      var dir2 = await Directory(
              '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}dir2${Platform.pathSeparator}')
          .create(recursive: true);
    }
    print('${dir.path}');
  }

  _dirList(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}${Platform.pathSeparator}dir';
    //可选参数recursive，默认值为false，表示只遍历当前目录；设置为true时表示遍历当前目录及子目录。
    Stream<FileSystemEntity> fileList = Directory(path).list();
    var result = '';
    await for (FileSystemEntity entity in fileList) {
      //文件的类型：
      //file：文件
      //directory：文件夹
      //link：链接文件
      //notFound：未知
      FileSystemEntityType type = FileSystemEntity.typeSync(entity.path);
      result = "$result$entity 类型：$type\n\n";
    }
    print(result);
    _showDialog(context, result.isEmpty ? "文件夹为空" : result);
  }

  _dirRename(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =
        '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}dir1';
    var dir = Directory(path);
    var result = await dir
        .rename('${dir.parent.absolute.path}${Platform.pathSeparator}dir3');
    _showDialog(context, '$result');
  }

  _deleteDir(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = '${documentsDirectory.path}${Platform.pathSeparator}dir';
    //delete中有一个可选参数recursive，默认值为false,为false时如果删除的文件夹下还有内容将无法删除，
    //抛出异常；设置为true时，删除当前文件夹及文件夹下所有内容。
    var result = await Directory(path).delete(recursive: true);
    _showMsg(context, '删除成功');
  }

  _createFile(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =
        '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}file.txt';
    //create中有一个可选参数recursive，默认值为false,为false时只创建文件，文件夹路径不存在抛出异常；
    //设置为true时，创建文件及不存在的路径文件夹。
    var result = await File(path).create(recursive: true);
    _showDialog(context, '$result');
  }

  _writeAsString(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =
        '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}file.txt';
    var file = File(path);
    if (file.existsSync()) {
      //向file.txt文件写入字符串
      file.writeAsString('向file.txt文件写入字符串\n第一行\n第二行\n');
      var result = '';
      //一行一行的读取数据
      List<String> lines = await file.readAsLines();
      lines.forEach((element) {
        result = '$result$element\n';
      });
      _showDialog(context, '$result');
    } else {
      _showMsg(context, '文件不存在，请先创建文件');
    }
  }

  _writeAsBytes(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =
        '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}file.txt';
    var file = File(path);
    if (file.existsSync()) {
      //向file.txt文件写入bytes数据
      file.writeAsBytes(const Utf8Encoder().convert('向file.txt文件写入bytes数据\n'));
      //读取bytes并转换为String
      var result = const Utf8Decoder().convert(await file.readAsBytes());
      _showDialog(context, '$result');
    } else {
      _showMsg(context, '文件不存在，请先创建文件');
    }
  }

  _append(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =
        '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}file.txt';
    var file = File(path);
    if (file.existsSync()) {
      //向末尾追加内容
      file.openWrite(mode: FileMode.append).write('向末尾追加内容\n');
      var result = await file.readAsString();
      _showDialog(context, '$result');
    } else {
      _showMsg(context, '文件不存在，请先创建文件');
    }
  }

  _deleteFile(BuildContext context) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path =
        '${documentsDirectory.path}${Platform.pathSeparator}dir${Platform.pathSeparator}file.txt';
    var file = File(path);
    if (file.existsSync()) {
      file.delete();
      _showMsg(context, '文件已删除');
    } else {
      _showMsg(context, '文件不存在');
    }
  }

  _loadAsset(BuildContext context) async {
    var jsonStr =
        await DefaultAssetBundle.of(context).loadString('json/data.json');
    var list = json.decode(jsonStr);
    var result = '';
    list.forEach((e) {
      result = '$result$e\n';
    });
    _showDialog(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        _buildButton(() {
          _createDir(context);
        }, '创建文件夹'),
        _buildButton(() {
          _dirList(context);
        }, '遍历文件夹'),
        _buildButton(() {
          _dirRename(context);
        }, '重命名文件夹'),
        _buildButton(() {
          _deleteDir(context);
        }, '删除文件夹'),
        _buildButton(() {
          _createFile(context);
        }, '创建文件'),
        _buildButton(() {
          _writeAsString(context);
        }, '写入字符串'),
        _buildButton(() {
          _writeAsBytes(context);
        }, '写入bytes'),
        _buildButton(() {
          _append(context);
        }, '追加内容'),
        _buildButton(() {
          _deleteFile(context);
        }, '删除文件'),
        _buildButton(() {
          _loadAsset(context);
        }, '读取asset文件'),
      ],
    );
  }

  _buildButton(VoidCallback onPressed, String title) {
    return ElevatedButton(onPressed: onPressed, child: Text(title));
  }

  _showMsg(BuildContext context, String content) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  _showDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Text(content),
        ),
      ),
    );
  }
}

class DataHttpPracticePage3 extends BaseStatelessWidget {
  DataHttpPracticePage3({required super.title});

  final String Key_Int = 'Key_Int';
  final String Key_Double = 'Key_Double';
  final String Key_Bool = 'Key_Bool';
  final String Key_String = 'Key_String';
  final String Key_StringList = 'Key_StringList';

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      children: [
        SpaceDivider(),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            //检测是否Key是否存在
            var result = sp.containsKey(Key_Int);
            _showMsg(context, result ? "Key已存在" : "Key不存在");
          },
          child: const Text('int数据对应Key是否存在'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.setInt(Key_Int, 12);
            _showMsg(context, '值12已保存');
          },
          child: const Text('保存int数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.remove(Key_Int);
            _showMsg(context, '删除成功');
          },
          child: const Text('删除int数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            var result = sp.getInt(Key_Int) ?? 0;
            _showMsg(context, '读取值为$result');
          },
          child: const Text('读取int数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.setDouble(Key_Double, 12.2);
            _showMsg(context, '值12.2已保存');
          },
          child: const Text('保存double数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.remove(Key_Double);
            _showMsg(context, '删除成功');
          },
          child: const Text('删除double数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            var result = sp.getDouble(Key_Double) ?? 0.0;
            _showMsg(context, '读取值为$result');
          },
          child: const Text('读取double数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.setBool(Key_Bool, true);
            _showMsg(context, '值true已保存');
          },
          child: const Text('保存bool数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.remove(Key_Bool);
            _showMsg(context, '删除成功');
          },
          child: const Text('删除bool数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            var result = sp.getBool(Key_Bool) ?? false;
            _showMsg(context, '读取值为$result');
          },
          child: const Text('读取bool数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.setString(Key_String, 'flutter');
            _showMsg(context, '值flutter已保存');
          },
          child: const Text('保存String数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.remove(Key_String);
            _showMsg(context, '删除成功');
          },
          child: const Text('删除String数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            var result = sp.getString(Key_String) ?? '';
            _showMsg(context, '读取值为$result');
          },
          child: const Text('读取String数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.setStringList(Key_StringList, ['flutter', 'android', 'iOS']);
            _showMsg(context, '值[flutter, android, iOS]已保存');
          },
          child: const Text('保存StringList数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.remove(Key_StringList);
            _showMsg(context, '删除成功');
          },
          child: const Text('删除StringList数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            var result = sp.getStringList(Key_StringList) ?? [];
            _showMsg(context, '读取值为$result');
          },
          child: const Text('读取StringList数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            sp.clear();
            _showMsg(context, '清除成功');
          },
          child: const Text('清除所有数据'),
        ),
        ElevatedButton(
          onPressed: () async {
            var sp = await SharedPreferences.getInstance();
            var keys = sp.getKeys();
            _showMsg(context, '所有key为$keys');
          },
          child: const Text('获取所有的Key'),
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  _showMsg(BuildContext context, String content) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}

class DataHttpPracticePage4 extends BaseStatefulWidget {
  DataHttpPracticePage4({required super.title});

  @override
  State<StatefulWidget> createState() => DataHttpPracticePage4State();
}

class DataHttpPracticePage4State extends State<DataHttpPracticePage4> {
  List<User> _list = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _list = await DBProvider().findAll();
    //根据条件查询，比如查询年龄为12的数据
    // _list = await DBProvider().find(12);
    setState(() {});
  }

  _deleteData() async {
    var result = await DBProvider().deleteAll();
    _loadData();
    return result;
  }

  _delete(int id) async {
    var result = await DBProvider().delete(id);
    _loadData();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: widget.title,
      child: Column(
        children: [
          SpaceDivider(),
          Row(
            children: [
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  _loadData();
                },
                child: const Text('查询数据'),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () async {
                  var result = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddUserPage()));
                  if (result > 0) {
                    _loadData();
                  }
                },
                child: const Text('添加数据'),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  _deleteData();
                },
                child: const Text('删除全部数据'),
              ),
            ],
          ),
          Table(
            children: [
              TableRow(children: [
                _createTextTableCell('id'),
                _createTextTableCell('姓名'),
                _createTextTableCell('年龄'),
                _createTextTableCell('性别'),
                _createTextTableCell('修改'),
                _createTextTableCell('删除'),
              ]),
              ..._list
                  .map(
                    (user) => TableRow(children: [
                      _createTextTableCell('${user.id}'),
                      _createTextTableCell(user.name),
                      _createTextTableCell('${user.age}'),
                      _createTextTableCell(user.sex == 0 ? '男' : '女'),
                      _createButtonTableCell(() async {
                        var result = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => AddUserPage(user: user)));
                        if (result > 0) {
                          _loadData();
                        }
                      }, '修改'),
                      _createButtonTableCell(() {
                        _delete(user.id);
                      }, '删除'),
                    ]),
                  )
                  .toList(),
            ],
          )
        ],
      ),
    );
  }

  _createTextTableCell(String content) {
    return TableCell(
      child: SizedBox(
        height: 50,
        child: Center(child: Text(content)),
      ),
    );
  }

  _createButtonTableCell(VoidCallback? onPressed, String content) {
    return TableCell(
      child: SizedBox(
        height: 50,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 30,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(content, style: const TextStyle(fontSize: 9)),
            ),
          ),
        ),
      ),
    );
  }
}

class AddUserPage extends StatefulWidget {
  User? user;

  AddUserPage({this.user});

  @override
  State<StatefulWidget> createState() => AddUserPageState();
}

class AddUserPageState extends State<AddUserPage> {
  String _radioGroupValue = '0';
  TextEditingController? _nameController;
  TextEditingController? _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    if (widget.user != null) {
      var name = widget.user!.name;
      _nameController?.value = TextEditingValue(
        text: name,
        selection: TextSelection.fromPosition(
          TextPosition(
            affinity: TextAffinity.downstream,
            offset: name.length,
          ),
        ),
      );
      var age = "${widget.user!.age}";
      _ageController?.value = TextEditingValue(
        text: age,
        selection: TextSelection.fromPosition(
          TextPosition(
            affinity: TextAffinity.downstream,
            offset: age.length,
          ),
        ),
      );
      _radioGroupValue = "${widget.user!.sex}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: '保存数据',
      child: Column(
        children: [
          Row(
            children: [
              const Text('姓名'),
              Flexible(
                child: TextField(
                  controller: _nameController,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('年龄'),
              Flexible(
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text('先别'),
              Flexible(
                child: RadioListTile(
                  title: const Text('男'),
                  value: '0',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value as String;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile(
                  title: const Text('女'),
                  value: '1',
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value as String;
                    });
                  },
                ),
              ),
            ],
          ),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                if (widget.user == null) {
                  //新增数据
                  var user = User(
                    name: '${_nameController?.text}',
                    age: int.parse('${_ageController?.text}'),
                    sex: int.parse(_radioGroupValue),
                  );
                  int result = await DBProvider().saveData(user);
                  if (result > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('保存数据成功，result：$result')));
                    Navigator.of(context).pop(result);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('保存数据失败，result：$result')));
                  }
                } else {
                  //修改数据
                  var user = User(
                    id: widget.user!.id,
                    name: '${_nameController?.text}',
                    age: int.parse('${_ageController?.text}'),
                    sex: int.parse(_radioGroupValue),
                  );
                  int result = await DBProvider().update(user);
                  if (result > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('修改数据成功，result：$result')));
                    Navigator.of(context).pop(result);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('修改数据失败，result：$result')));
                  }
                }
              },
              child: const Text('保存'),
            ),
          ),
        ],
      ),
    );
  }
}

//使用SQLite并不是一定要使用单例模式，单例模式是为了保证整个应用程序仅有一个数据库实例和全局访问。
class DBProvider {
  static final DBProvider _singleton = DBProvider._internal();

  factory DBProvider() {
    return _singleton;
  }

  DBProvider._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'dbName');
    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  //创建Table
  Future _onCreate(Database db, int version) async {
    return await db.execute("CREATE TABLE User ("
        "id integer primary key AUTOINCREMENT,"
        "name TEXT,"
        "age integer,"
        "sex integer"
        ")");
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  //保存数据
  Future saveData(User user) async {
    var _db = await db;
    return await _db.insert('User', user.toJson());
  }

  //保存数据
  Future rawInsert(User user) async {
    var _db = await db;
    return await _db.rawInsert('INSERT Into User (name,age,sex) VALUES (?,?,?)',
        [user.name, user.age, user.sex]);
  }

  //查询全部数据
  Future<List<User>> findAll() async {
    var _db = await db;
    List<Map<String, dynamic>> result = await _db.query('User');
    return result.isNotEmpty
        ? result.map((e) => User.fromJson(e)).toList()
        : [];
  }

  //根据条件查询，比如查询年龄为12的数据
  Future<List<User>> find(int age) async {
    var _db = await db;
    List<Map<String, dynamic>> result =
        await _db.query('User', where: 'age = ?', whereArgs: [age]);
    return result.isNotEmpty
        ? result.map((e) => User.fromJson(e)).toList()
        : [];
  }

  //根据id新数据
  Future<int> update(User user) async {
    var _db = await db;
    return await _db
        .update('User', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  }

  //根据id删除数据
  Future<int> delete(int id) async {
    var _db = await db;
    return await _db.delete('User', where: 'id = ?', whereArgs: [id]);
  }

  //删除全部数据
  Future<int> deleteAll() async {
    var _db = await db;
    return await _db.delete('User');
  }
}

class User {
  late int id;

  late String name;
  late int age;
  late int sex;

  User({this.id = 0, required this.name, required this.age, required this.sex});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['sex'] = sex;
    return data;
  }
}

class DataHttpPracticePage5 extends BaseStatefulWidget {
  DataHttpPracticePage5({required super.title});

  @override
  State<StatefulWidget> createState() => DataHttpPracticePage5State();
}

class DataHttpPracticePage5State extends State<DataHttpPracticePage5> {
  String _data = "";

  getData() async {
    //HttpClient是Dart标准库的一部分，无需引入第三方，但其本身功能较弱，对开发者不友好，
    //使用比较麻烦，因此并不建议直接使用HttpClient进行网络请求。
    //1.创建HttpClient
    var client = HttpClient();
    //2.构建Uri
    //API：https://www.wanandroid.com/blog/show/2 -> 2.体系 -> 2.2 知识体系下的文章
    var uri = Uri(
      scheme: 'https',
      //服务器的域名
      host: 'www.wanandroid.com',
      path: 'article/list/0/json',
      //请求参数
      queryParameters: {
        "cid": "60",
        "page_size": "1",
      },
    );
    //3.打开http连接
    HttpClientRequest request = await client.getUrl(uri);
    //4.如果需要，设置header，也可不设置
    //request.headers.add('name', 'value');
    //5.关闭请求, 等待响应
    HttpClientResponse response = await request.close();
    //6.解析返回的数据
    String responseBody = await response.transform(utf8.decoder).join();
    print('responseBody:$responseBody');
    setState(() {
      _data = responseBody;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: widget.title,
      child: Center(
        child: Text(_data),
      ),
    );
  }
}

class DataHttpPracticePage6 extends BaseStatefulWidget {
  DataHttpPracticePage6({required super.title});

  @override
  State<StatefulWidget> createState() => DataHttpPracticePage6State();
}

class DataHttpPracticePage6State extends State<DataHttpPracticePage6> {
  String _data = "";

  getData() async {
    //http是一个可组合，基于Future的库，用于HTTP请求。该软件包包含高级功能和类，可轻松使用HTTP资源。
    //它是多平台的，并且支持移动设备，台式机和浏览器。此软件包为官方出品。
    var client = http.Client();
    var uri = Uri(
      scheme: 'https',
      //服务器的域名
      host: 'www.wanandroid.com',
      path: 'article/list/0/json',
      //请求参数
      queryParameters: {
        "cid": "60",
        "page_size": "1",
      },
    );
    http.Response response = await client.get(uri);
    setState(() {
      _data = response.body;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      title: widget.title,
      child: Center(
        child: Text(_data),
      ),
    );
  }
}

class DataHttpPracticePage7 extends BaseStatelessWidget {
  DataHttpPracticePage7({required super.title});

  _showDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Text(content),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //开放的API：https://www.wanandroid.com/blog/show/2
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        ElevatedButton(
          onPressed: () async {
            var dio = Dio()..interceptors.add(MyInterceptor(context));
            var response = await dio.get(
              "https://www.wanandroid.com/article/list/0/json?cid=60&page_size=1",
            );
            _showDialog(context, response.data.toString());
          },
          child: const Text('发起get请求（方式一）'),
        ),
        ElevatedButton(
          onPressed: () async {
            var dio = Dio()..interceptors.add(MyInterceptor(context));
            var response = await dio.get(
              "https://www.wanandroid.com/article/list/0/json",
              queryParameters: {
                'cid': 60,
                "page_size": 1,
              },
            );
            _showDialog(context, response.data.toString());
          },
          child: const Text('发起get请求（方式二）'),
        ),
        ElevatedButton(
          onPressed: () async {
            var dio = Dio()..interceptors.add(MyInterceptor(context));
            var response = await dio.post(
              "https://www.wanandroid.com/article/query/0/json",
              queryParameters: {
                'k': 'android',
                "page_size": 1,
              },
            );
            _showDialog(context, response.data.toString());
          },
          child: const Text('发送post请求'),
        ),
        ElevatedButton(
          onPressed: () async {
            var formData = FormData.fromMap({
              'k': 'android',
              "page_size": 1,
            });
            var dio = Dio()..interceptors.add(MyInterceptor(context));
            Response response = await dio.post(
              "https://www.wanandroid.com/article/query/0/json",
              data: formData,
            );
            _showDialog(context, response.data.toString());
          },
          child: const Text('发送FormData'),
        ),
        ElevatedButton(
          onPressed: () async {
            var formData = FormData.fromMap({
              'name': 'laomeng',
              'file': await MultipartFile.fromFile("./text.txt",
                  filename: "upload.txt"),
              'files': [
                await MultipartFile.fromFile("./text1.txt",
                    filename: "text1.txt"),
                await MultipartFile.fromFile("./text2.txt",
                    filename: "text2.txt"),
              ]
            });
            var dio = Dio()..interceptors.add(MyInterceptor(context));
            var response = await dio.post(
              'https://xxx.com/test',
              data: formData,
              //监听上传进度
              onSendProgress: (send, total) {
                print('$send $total');
              },
            );
            _showDialog(context, response.data.toString());
          },
          child: const Text('上传文件'),
        ),
        ElevatedButton(
          onPressed: () async {
            CancelToken cancelToken = CancelToken();
            Response response = await Dio().get(
              "https://www.wanandroid.com/article/list/0/json?cid=60&page_size=1",
              cancelToken: cancelToken,
            );
            cancelToken.cancel();
            if (!cancelToken.isCancelled) {
              _showDialog(context, response.data.toString());
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('请求已取消')));
            }
          },
          child: const Text('请求取消'),
        ),
      ],
    );
  }
}

class DataHttpPracticePage8 extends BaseStatelessWidget {
  DataHttpPracticePage8({required super.title});

  @override
  Widget build(BuildContext context) {
    return ScrollLayout(
      title: title,
      centerContent: true,
      children: [
        const Text('推荐JsonToDart插件'),
      ],
    );
  }
}

//自定义拦截器
class MyInterceptor extends Interceptor {
  final BuildContext context;

  MyInterceptor(this.context);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //onRequest请求前调用，一般是添加请求的公共部分，比如添加token
    //options.headers['token'] = 'token';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    //onResponse响应后调用，一般用于通用数据解析等
    print('MyInterceptor onResponse $response');
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(content: Text('请求成功')));
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    //onError请求发生异常时调用，一般用于异常功能处理
    print('MyInterceptor onError $err');
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('请求失败，$err')));
  }
}
