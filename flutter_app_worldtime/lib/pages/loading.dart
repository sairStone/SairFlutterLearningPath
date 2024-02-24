import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app_worldtime/model/word_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Shanghai', flag: '',time: '', isDaytime: '',url: 'Asia/Shanghai', );

    await instance.getData();
    Navigator.of(context).pushReplacementNamed( '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    // Navigator.pushNamed(context, '/home');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: const Center(
        /// flutter_spinkit的加载动画
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
