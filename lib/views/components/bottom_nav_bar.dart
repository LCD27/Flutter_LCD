import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/index.dart';

class BottomNavBar extends StatefulWidget {
  final PageController? pageController;

  const BottomNavBar({Key? key, this.pageController}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  VoidCallback? _callback;
  VoidCallback? _itemCallback;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _callback = () {};
    widget.pageController!.addListener(_callback!);
    _currentIndex = widget.pageController!.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomNavBarItems = [];
    for (int i = 0; i < _bottomNavBarData.length; i++) {
      String imagePath = _bottomNavBarData[i]['imagePath'];
      String text = _bottomNavBarData[i]['text'];
      Color color = _bottomNavBarData[i]['color'];
      if (i == _currentIndex) {
        imagePath = _bottomNavBarData[i]['imageFocusPath'];
        color = _bottomNavBarData[i]['colorFocus'];
      }
      Widget item = Container(
        child: BottomNavBarItem(
          callback: onTap,
          index: i,
          imagePath: imagePath,
          color: color,
          text: text,
        ),
        width: ScreenUtil().screenWidth/_bottomNavBarData.length,
      );
      bottomNavBarItems.add(item);
    }

    return Container(
      height: CDNumber.bottomNavBarHeight+CDNumber.bottomBarHeight,
      padding: EdgeInsets.only(bottom:CDNumber.bottomBarHeight ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 1.0, spreadRadius: 1.0, color: Colors.grey.shade200)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarItems,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.pageController!.removeListener(_callback!);
  }

  List _bottomNavBarData = [
    {
      'imagePath': CDImage.assetsPath + 'home.png',
      'imageFocusPath': CDImage.assetsPath + 'home_focus.png',
      'color': CDColor.color_333,
      'colorFocus': CDColor.color_blue,
      'text': "首页",
    },
    {
      'imagePath': CDImage.assetsPath + 'course.png',
      'imageFocusPath': CDImage.assetsPath + 'course_focus.png',
      'color': CDColor.color_333,
      'colorFocus': CDColor.color_blue,
      'text': "课程中心",
    },
    {
      'imagePath': CDImage.assetsPath + 'study.png',
      'imageFocusPath': CDImage.assetsPath + 'study_focus.png',
      'color': CDColor.color_333,
      'colorFocus': CDColor.color_blue,
      'text': "学习中心",
    },
    {
      'imagePath': CDImage.assetsPath + 'mine.png',
      'imageFocusPath': CDImage.assetsPath + 'mine_focus.png',
      'color': CDColor.color_333,
      'colorFocus': CDColor.color_blue,
      'text': "我的",
    },
  ];

  void onTap(int index) {
    if (index == _currentIndex) return;
    widget.pageController!.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }
}

typedef IndexCallBack = void Function(int index);

class BottomNavBarItem extends StatefulWidget {
  final String imagePath;
  final Color color;
  final String text;
  final IndexCallBack callback;
  final int index;

  const BottomNavBarItem({
    Key? key,
    required this.imagePath,
    required this.color,
    required this.text,
    required this.callback,
    required this.index,
  }) : super(key: key);

  @override
  _BottomNavBarItemState createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                width: 20.w,
                height: 20.w,
                gaplessPlayback: true,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.color,
                  // color: Colors.black12,
                  fontSize: CDFont.font_10,
                ),
              )
            ],
          ),
      ),
      onTap: () {
        widget.callback(widget.index);
      },
    );
  }
}
