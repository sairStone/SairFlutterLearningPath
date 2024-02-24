// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

final Logger logger = Logger('MyApp');

class WorldTime {
  String location;
  String time;
  String url;
  String isDaytime;
  String flag;

  WorldTime({
    required this.location,
    required this.time,
    required this.url,
    required this.isDaytime,
    required this.flag,
  });

  Future<void> getData() async{

    Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
    http.Response response = await http.get(uri);

    // print(response.body); 这是显式的输出，需要去避免
    logger.info('Response: ${response.body}');

    /// 将json转换为map对象
    Map data = jsonDecode(response.body);

    /// 获取 时间字段
    String datetime = data['datetime'];
    logger.info(datetime);



    /// 创建 DataTime类型，存储现在时间
    DateTime now = DateTime.parse(datetime);
    logger.info(now);

    /// 时区偏移量
    String utcOffset = data['utc_offset'].substring(2,3);
    now = now.add(Duration(hours: int.parse(utcOffset)));

    /// 使用 intl包将 2024-02-23 14:00:40.046Z 装换为  2:00 PM ，然后传给该对象的字段 time
    time = DateFormat.jm().format(now);
    logger.info(time);

    // 获取现在的小时，然后判断是否是白天
    int hour =int.parse(datetime.substring(11,13));

    isDaytime = hour >6 && hour < 22 ? 'true': 'false';
    logger.info(isDaytime);


  }

  WorldTime copyWith({
    String? location,
    String? time,
    String? url,
    String? isDaytime,
    String? flag,
  }) {
    return WorldTime(
      location: location ?? this.location,
      time: time ?? this.time,
      url: url ?? this.url,
      isDaytime: isDaytime ?? this.isDaytime,
      flag: flag ?? this.flag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'time': time,
      'url': url,
      'isDaytime': isDaytime,
      'flag': flag,
    };
  }

  factory WorldTime.fromMap(Map<String, dynamic> map) {
    return WorldTime(
      location: map['location'] as String,
      time: map['time'] as String,
      url: map['url'] as String,
      isDaytime: map['isDaytime'] as String,
      flag: map['flag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorldTime.fromJson(String source) => WorldTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorldTime(location: $location, time: $time, url: $url, isDaytime: $isDaytime, flag: $flag)';
  }

  @override
  bool operator ==(covariant WorldTime other) {
    if (identical(this, other)) return true;

    return
      other.location == location &&
      other.time == time &&
      other.url == url &&
      other.isDaytime == isDaytime &&
      other.flag == flag;
  }

  @override
  int get hashCode {
    return location.hashCode ^
      time.hashCode ^
      url.hashCode ^
      isDaytime.hashCode ^
      flag.hashCode;
  }
}
