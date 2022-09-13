import 'package:flutter/material.dart';

class IntroOne extends StatelessWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: const Center(
        child: Text(
          'Page One',
        ),
      ),
    );
  }
}
