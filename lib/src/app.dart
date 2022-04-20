import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test/src/domain/json_getter.dart';
import 'package:test/src/widgets/json_res_viewer.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool isLoading = false;
  Map<String, dynamic> json = {};
  final JsonGetterServive service = JsonGetterServive();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: ThemeData.dark().backgroundColor,
        appBar: AppBar(
          title: Title(color: Colors.white, child: const Text('Test App')),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: service.getCodeByteJson(),
              builder: (BuildContext context, snapshot) {
                final response = jsonEncode(snapshot.data);
                if (snapshot.hasData) {
                  return ResViewer(response: response);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
