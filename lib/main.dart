import 'package:flutter/material.dart';
import 'package:testchartsapp/components/bar_graph.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Charts'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(child: StackedBarChart.withSampleData()),
          Expanded(child: Center(child: Text("LOG entries here"))),
        ],
      )),
    );
  }
}
