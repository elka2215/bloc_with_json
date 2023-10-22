import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

/// экран анимации
class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            /// тут загрузил анимацию в виде джесон
            'assets/animation/animation.json',
            height: 300,
            reverse: true,
            repeat: true,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
