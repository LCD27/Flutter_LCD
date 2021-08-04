import 'package:flutter/material.dart' hide NestedScrollView;

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

class PinnedHeaderHeightTabView extends StatefulWidget {
  const PinnedHeaderHeightTabView({Key? key}) : super(key: key);

  @override
  _PinnedHeaderHeightTabViewState createState() =>
      _PinnedHeaderHeightTabViewState();
}

class _PinnedHeaderHeightTabViewState extends State<PinnedHeaderHeightTabView>
    with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  TabController? _tabController;
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestedScrollView(
      pinnedHeaderSliverHeightBuilder: () {
        return MediaQuery.of(context).padding.top + 30.0;
      },
      innerScrollPositionKeyBuilder: () {
        var index = "Tab";
        index += (_tabController!.index.toString());
        print(index);
        return Key(index);
      },
      headerSliverBuilder: (BuildContext context, bool? innerBoxIsScrolled) {
        bool tmpInnerBoxIsScrolled = innerBoxIsScrolled ?? false;
        return [
          SliverToBoxAdapter(
            child: AnimatedContainer(
              color: true ? Colors.black12 : Colors.cyan,
              duration: Duration(microseconds: 200),
              child: Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                // color: Colors.amber,
              ),
            ),
          )
        ];
      },
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            // isScrollable: false,
            unselectedLabelColor: Colors.grey,
            tabs: const <Tab>[
              Tab(text: 'Tab0'),
              Tab(text: 'Tab1'),
              Tab(text: 'Tab2'),
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              NestedScrollViewInnerScrollPositionKeyWidget(
                   Key('Tab0'),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                      // key: Key('Tab00'),
                      key: const PageStorageKey<String>('Tab00'),
                      itemBuilder: (c, i) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          child: Text("tab0 : List$i"),
                        );
                      },
                      itemCount: 100)),
              NestedScrollViewInnerScrollPositionKeyWidget(
                  const Key('tab1'),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      key: const PageStorageKey<String>('Tab01'),
                      // key: Key('Tab01'),
                      itemBuilder: (c, i) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          child: Text("tab1  : List$i"),
                        );
                      },
                      itemCount: 100)),
              NestedScrollViewInnerScrollPositionKeyWidget(
                  const Key('tab2'),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      // key: Key('Tab02'),
                      key: const PageStorageKey<String>('Tab02'),
                      itemBuilder: (c, i) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          child: Text("tab1  : List$i"),
                        );
                      },
                      itemCount: 100)),
            ],
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
    _scrollController!.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
