import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_first_station/guess/guess_app_bar.dart';
import 'package:flutter_first_station/guess/result_notice.dart';

// _random.nextInt(100);

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});


  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  bool _guessing = false;
  // 设置游戏状态

  final _random = Random();
  // 实例随机数

  int _counter = 0;
  // 生成的随机数

  bool? _isBig = null;
  // 判断值

  void _generatNum() {
    setState(() {
      _guessing = true; // 表示游戏开始
      _counter = _random.nextInt(100);
    });
  }

  final TextEditingController _guessCtrl = TextEditingController();

  void _onCheck() {
    print('-----Check:目标数值：$_counter === ${_guessCtrl.text}');

    int _guessNum = int.parse(_guessCtrl.text);

    if (_counter == _guessNum) {
      _isBig = null;
      _guessing = false;
    }else if(_counter > _guessNum){
      _isBig = false;
    }else{
      _isBig = true;
    }
    // 重新 build,因为要让浮动按钮的颜色恢复
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(
        onCheck: _onCheck,
        controller: _guessCtrl,
      ),
      body: Stack(
        children: [
          if (_isBig != null)
            Column(
              children: [
                if (_isBig == true)
                  const ResultNotice(
                    color: Colors.redAccent,
                    info: '大了',
                  ),
                  const Spacer(),
                if (_isBig == false)
                  const ResultNotice(
                    color: Colors.blueAccent,
                    info: '小了',
                  ),
              ],
            ),
          Center(
            child: Text(
             _guessing? '**' :'${_counter}',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),

      /**
       * 根据状态设置设置是否允许点击
       */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _guessing ? null : _generatNum();
        },
        child: Icon(
          Icons.generating_tokens_rounded,
          color: _guessing ? Colors.grey : Colors.green,
        ),
        tooltip: '生成随机数',
      ),
    );
  }
}
