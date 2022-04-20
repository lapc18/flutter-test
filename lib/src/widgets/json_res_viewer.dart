import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_viewer/flutter_json_viewer.dart';
import 'package:test/src/utils/json_cleaner.dart';

class ResViewer extends StatelessWidget {
  final String response;
  const ResViewer({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text('Response from coderbyte with clean up',
            style: TextStyle(
              fontSize: 15,
              height: 5,
            ),
            textDirection: TextDirection.ltr),
        JsonViewer(cleanJson(response)),
        const SizedBox(height: 10),
        const Text('Response from coderbyte without clean up',
            style: TextStyle(fontSize: 15, height: 5),
            textDirection: TextDirection.ltr),
        JsonViewer(jsonDecode(response))
      ],
    );
  }
}
