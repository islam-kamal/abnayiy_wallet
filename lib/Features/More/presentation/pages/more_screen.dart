import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MoreScreenState();
  }

}
class MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Screen'),
      ),
      body: Center(
        child: Text('Welcome to More Screen!'),
      ),
    );
  }
}