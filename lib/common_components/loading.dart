import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: const [
      SizedBox(
        height: 48,
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [Colors.blueGrey, Colors.blue, Colors.blueAccent],
            strokeWidth: 2,
            backgroundColor: Colors.white,
            pathBackgroundColor: Colors.black),
      ),
      Text(
        'Loading',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )
    ]);
  }
}
