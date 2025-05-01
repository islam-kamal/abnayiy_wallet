import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransferScreenState();
  }

}
class TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer Screen'),
      ),
      body: Center(
        child: Text('Welcome to Transfer Screen!'),
      ),
    );
  }
}