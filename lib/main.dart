import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const SharedPreferenceExample());
  }
}

//SharedPreference
class SharedPreferenceExample extends StatefulWidget {
  const SharedPreferenceExample({super.key});

  @override
  State<SharedPreferenceExample> createState() =>
      _SharedPreferenceExampleState();
}

class _SharedPreferenceExampleState extends State<SharedPreferenceExample> {
  static const String numberPref = 'number_pref';
  static const String boolPref = 'bool_pref';
  SharedPreferences? _preference;
  int _numberPref = 0;
  bool _booleanPref = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((pref) {
        setState(() {
          _preference = pref;
          _loadNumberPref();
          _loadBoolPref();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Number Preference'),
                Text('$_numberPref'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _setNumberPref(_numberPref + 1);
                    });
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Boolean Preference'),
                Text((_booleanPref).toString().toUpperCase()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _setBoolPref(!_booleanPref);
                    });
                  },
                  child: const Text('Toggle'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: resetData,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }

  Future _setNumberPref(int value) async {
    // SharedPreferences _preference = await SharedPreferences.getInstance();
    await _preference?.setInt(numberPref, value);
    _loadNumberPref();
  }

  Future _setBoolPref(bool value) async {
    // SharedPreferences _preference = await SharedPreferences.getInstance();
    await _preference?.setBool(boolPref, value);
    _loadBoolPref();
  }

  void _loadNumberPref() async {
    // SharedPreferences _preference = await SharedPreferences.getInstance();
    setState(() {
      _numberPref = _preference?.getInt(numberPref) ?? 0;
    });
  }

  void _loadBoolPref() async {
    // SharedPreferences _preference = await SharedPreferences.getInstance();
    setState(() {
      _booleanPref = _preference?.getBool(boolPref) ?? false;
    });
  }

  void resetData() async {
    await _preference!.remove(boolPref);
    await _preference!.remove(numberPref);
    _loadNumberPref();
    _loadBoolPref();
  }
}

class ReadWriteFileExample extends StatefulWidget {
  const ReadWriteFileExample({super.key});

  @override
  State<ReadWriteFileExample> createState() => _ReadWriteFileExampleState();
}

class _ReadWriteFileExampleState extends State<ReadWriteFileExample> {
  final textController = TextEditingController();
  static const String localFileName = 'demon_hitler.txt';
  String _localFileContetn = '';
  String _localFilePath = localFileName;
  @override
  void initState() {
    super.initState();
    this._readTextFromLocalFile();

    this._getLocalFile.then((file) => setState(() {
          this._localFilePath = file.path;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Local file read/write Demo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Write to local file'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: textController,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () async {
                  this._readTextFromLocalFile();
                  this.textController.text = this._localFileContetn;
                },
                child: const Text('Load'),
              ),
              TextButton(
                onPressed: () async {
                  this._writeTextToLocalFile(textController.text);
                  textController.clear();
                  this._readTextFromLocalFile();
                },
                child: const Text('Save'),
              ),
              const Divider(),
            ]),
            const Text(
              'Local file path:',
              style: TextStyle(fontSize: 32),
            ),
            Text('$_localFilePath'),
            const Text(
              'Local file content',
              style: TextStyle(fontSize: 32),
            ),
            Text('$_localFileContetn'),
          ],
        ),
      ),
    );
  }

  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = _getLocalPath;
    return File('$path/$localFileName');
  }

  Future<File> _writeTextToLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async {
    String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch (e) {
      content = '$e';
    }
    setState(() {
      _localFileContetn = content;
    });
  }
}
