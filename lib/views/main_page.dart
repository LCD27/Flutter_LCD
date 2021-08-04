import 'package:flutter/material.dart';
import 'package:flutter_base/router_config/routers.dart';
import 'package:flutter_base/views/pages/main/home_view.dart';
import 'package:flutter_base/views/pages/person/mine_page.dart';

import 'components/nested_scorll_view/pinned_header_height.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
//页面控制器，初始 0
  final PageController _controller = PageController();

  // 禁止 PageView 滑动
  final ScrollPhysics neverScroll = const NeverScrollableScrollPhysics();
  // final ScrollPhysics neverScroll = const BouncingScrollPhysics();
  int _curIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('主页'),),
      body: PageView(
        physics: neverScroll,
        controller: _controller,
        children: [
          HomeView(),
          MinePage(),
          // MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _curIndex = index;
            _controller.jumpToPage(index);
          });
        },
        currentIndex: _curIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.amber,
              ),
              label: '首页'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.amber,
              ),
              label: '个人'),

        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); //释放控制器
    super.dispose();
  }


}
