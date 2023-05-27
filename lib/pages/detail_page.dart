import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final matchId;
  const DetailPage({Key? key, required this.matchId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match ID: ' + widget.matchId.toString()),
      ),
      body: SafeArea(
        child: Container(
          child: Column(),
        ),
      ),
    );
  }
}
