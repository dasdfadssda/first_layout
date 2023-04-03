import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('About Page'),
        ),
        body: Column(children: [
          Center(
            child: TextButton(
              child: Text('전 페이지로 돌아가기'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          )
        ]),
    );
  }
}