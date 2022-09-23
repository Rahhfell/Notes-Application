import 'package:flutter/material.dart';

class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextControlState();
  }
}

class TextControlState extends State {
  String name = 'Raphael';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        ElevatedButton(
          child: Text('Change name'),
          onPressed: () {
            setState(() {
              name = 'Uche';
            });
          },
        ),
      ],
    );
  }
}
