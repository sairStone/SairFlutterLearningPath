import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class PositionCurve extends Curve {
  @override
  double transformInternal(double t) {
    if (t < 0.1) {
      return t * 5;
    } else if (t > 0.9) {
      return 1 - ((1 - t) * 5);
    } else {
      return 0.5;
    }
  }
}

class OpacityCurve extends Curve {
  @override
  double transformInternal(double t) {
    if (t < 0.1) {
      return t * 10;
    } else if (t > 0.9) {
      return ((1 - t) * 10);
    } else {
      return 1;
    }
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  // 根据随机出来的id值，制造每次打开应用出现splash不同，制造惊喜感
  var id = Random().nextInt(6) + 1;

  // 动画效果
  late AnimationController controller;
  late Animation position;
  late Animation<double> opacity;
  Timer? timer;
  var alive = true;

  @override
  void dispose() {
    destoryTimer();
    controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    destoryTimer();
    alive = false;
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
    alive = true;
    createTimer();
  }

  void createTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (!(alive && mounted)) return;

      var nid = Random().nextInt(6) + 1;
      while (nid == id) {
        nid = Random().nextInt(6) + 1;
      }
      id = nid;
      controller.reset();
      controller.forward(); // 动画启用
    });
  }

  void destoryTimer() {
    timer?.cancel();
  }

  @override
  void initState() {
    // 动画控制器
    controller =
        AnimationController(duration: const Duration(seconds: 8), vsync: this)
          ..addListener(() {
            if (mounted && alive) setState(() {});
          });

    position = Tween(begin: 100.00, end: 0.00)
        .animate(CurvedAnimation(parent: controller, curve: PositionCurve()));
    opacity = Tween(begin: 0.00, end: 1.00)
        .animate(CurvedAnimation(parent: controller, curve: OpacityCurve()));

    controller.forward();

    createTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width + 100,
              margin: EdgeInsets.fromLTRB(
                  0, position.value, 0, 100.00 - position.value),
              child: Image.asset(
                'assets/splash/splash$id.png',
                opacity: opacity,
              )),
        ));
  }
}
