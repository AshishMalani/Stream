import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  StreamController<int> _streamController = StreamController();
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // TextField(
        //   decoration: InputDecoration(labelText: "Full Name"),
        // ),
        Center(
            child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text(
              "Count:${snapshot.data}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          },
          initialData: 0,
          stream: _streamController.stream,
        )),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                if (counter < 10) {
                  _streamController.sink.add(++counter);
                }
                print(counter);
              },
            ),
            SizedBox(width: 20),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                if (counter > 0) {
                  _streamController.sink.add(--counter);
                }
                print(counter);
              },
            ),
          ],
        ),
      ]),
    );
  }
}
