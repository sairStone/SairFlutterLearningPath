import 'package:flutter/material.dart';

class Config {
  // 设置map类型的动态返回内容，按照键值对
  static Map _map = <String, dynamic>{};

  // putIfAbsent(key, ifAbsent)是map类型的方法，用来保存
  static int get windowGrids {
    // 由 ifAbsent 函数计算出的值与给定的 key 关联起来并返回这个新值。如果 key 已经存在，则返回当前关联的 value。也就是_map['windowGrids'] 的值 120
    return _map.putIfAbsent('windowGrids', () => (120));
  }

}
