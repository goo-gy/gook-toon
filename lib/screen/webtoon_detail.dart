import 'package:flutter/material.dart';

class WebtoonDetail extends StatelessWidget {
  final String id, title, thumbnail;
  const WebtoonDetail({
    super.key,
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          elevation: 1,
        ),
        backgroundColor: Colors.white,
        body: Container());
  }
}
