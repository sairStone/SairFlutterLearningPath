import 'package:flutter/material.dart';
import 'package:flutter_app_worldtime/model/word_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'uk.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'greece.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        time: '',
        isDaytime: ''),
    WorldTime(
        url: 'Asia/Shanghai',
        location: 'Shanghai',
        flag: 'china.png',
        time: '',
        isDaytime: ''),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    /// 根据对象获取对应接口数据
    await instance.getData();

    /// 带参路由跳转
    Navigator.of(context).pushReplacementNamed('/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
      ),
      body:
          /// ListView.builder是一个用于构建列表的widget，它可以根据列表项的索引动态创建子widget，适用于大量数据的列表展示。
          /// itemBuilder属性指定了根据索引index创建列表项的方式
          /// ListTile是ListView中常用的列表项，使用ListView和ListTile的组合，可以快速构建出具有交互性和动态性的列表界面。
          ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${locations[index].flag}'),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
