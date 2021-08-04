import 'package:flutter/material.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended_nsv;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return extended_nsv.NestedScrollView(
      pinnedHeaderSliverHeightBuilder: (){
        return MediaQuery.of(context).padding.top;
      },
      headerSliverBuilder: (BuildContext context, bool? innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
            ),
          )
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.cyan,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.cyan,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.cyan,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.cyan,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.cyan,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
    _scrollController!.dispose();
  }
}
