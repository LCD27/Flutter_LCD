

import 'package:fluro/fluro.dart';
import 'package:flutter_base/views/main_page.dart';
import 'package:flutter_base/views/pages/person/mine_page.dart';

var mainHandler = Handler(handlerFunc: (context,params){

  return MainPage();
});

var mineHandler = Handler(handlerFunc: (context,params){

  return MinePage();
});