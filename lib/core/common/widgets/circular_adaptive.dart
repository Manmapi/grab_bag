import 'package:flutter/material.dart';

class CircularAdaptive extends StatelessWidget {
  final Color? color;
  const CircularAdaptive({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color ?? Colors.white,
      ),
    );
  }
}
