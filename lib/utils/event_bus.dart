//订阅者回调签名
import 'package:flutter/cupertino.dart';

typedef void EventCallback(arg);
///
/// 观察者模式
///
/// 事件总线
class CDEventBus{
  //私有构造函数
  CDEventBus._internal();

  //保存单例
  static CDEventBus _singleton = new CDEventBus._internal();

  //工厂构造函数
  factory CDEventBus()=> _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  Map _ebMap = new Map<Object, List<EventCallback>>();

  //添加订阅者
  void on(String? eventName, EventCallback? f) {
    if (eventName == null || f == null) return;
    _ebMap[eventName] ??= <EventCallback>[];
    _ebMap[eventName]!.add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback? f]) {
    var list = _ebMap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _ebMap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(String eventName, [arg]) {
    var list = _ebMap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

//定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
var bus = new CDEventBus();