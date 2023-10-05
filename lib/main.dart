import 'dart:io';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ReadWriteFileExample());
  }
}

class ReadWriteFileExample extends StatefulWidget {
  ReadWriteFileExample({super.key});

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
    this._readTextFromLocalFile();
    super.initState();
    setState(() {});
    this._getLocalFile.then((file) => this._localFilePath = file.path);
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
                  this.textController.text = _localFileContetn;
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
            Text(
              'Local file path:',
              style: TextStyle(fontSize: 32),
            ),
            Text('$_localFilePath'),
            Text(
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
