import 'package:flutter/material.dart';

class ResultNotice extends StatefulWidget {
  // 设置需要接受的参数
  final Color color;
  final String info;

  const ResultNotice({super.key, required this.color, required this.info});

  @override
  State<ResultNotice> createState() => _ResultNoticeState();
}

// 使用动画，需要混入SingleTickerProviderStateMixin，要创建Ticker,在vsync入参可以传入当前状态类
class _ResultNoticeState extends State<ResultNotice>
    with SingleTickerProviderStateMixin {

// 添加动画控制器,需要 改为statefulWidget
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // 必须使用下面这个forward方法，动画才会动起来
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            alignment: Alignment.center,
            color: widget.color,
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, child) => Text(
                '${widget.info}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35 * (controller.value) ),
              ),
            )));
  }
}
