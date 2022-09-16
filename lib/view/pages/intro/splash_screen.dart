import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
              text: 'Orange',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              children: <TextSpan>[
                TextSpan(
                    text: " Digital Center",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),
              ]
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.7),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            animation: true,
            lineHeight: 10.0,
            animationDuration: 3000,
            percent: 1.0,
            barRadius: const Radius.circular(10.0),
            progressColor: Colors.orange,
          ),
        ),
      ],
    );
  }
}
