import 'package:flutter/material.dart';
import 'package:lavanda/Model/categories.dart';

class ActivityScreen extends StatefulWidget {
  final Category category;
  ActivityScreen(this.category);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category.name}")),
    );
  }
}
