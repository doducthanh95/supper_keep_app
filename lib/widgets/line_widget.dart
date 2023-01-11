import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.withOpacity(0.5),
    );
  }
}
