
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CDNumber{
  static double bottomNavBarHeight = 50.w;

  static double topNavBarHeight = 44.w;
  /// 状态栏高度 dp 刘海屏会更高
  /// The offset from the top, in dp
  static double statusBarHeight = ScreenUtil().statusBarHeight;
  /// 底部安全区距离 dp
  /// The offset from the bottom, in dp
  static double bottomBarHeight = ScreenUtil().bottomBarHeight;
  static double screenWidth = ScreenUtil().screenWidth;
}