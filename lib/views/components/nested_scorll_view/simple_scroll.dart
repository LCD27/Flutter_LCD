import 'package:flutter/material.dart';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended_nsv;

class SimpleNestedSingleScrollView extends StatefulWidget {
  const SimpleNestedSingleScrollView({Key? key}) : super(key: key);

  @override
  _SimpleNestedSingleScrollViewState createState() =>
      _SimpleNestedSingleScrollViewState();
}

class _SimpleNestedSingleScrollViewState
    extends State<SimpleNestedSingleScrollView> {
  @override
  Widget build(BuildContext context) {
    return extended_nsv.NestedScrollView(
      pinnedHeaderSliverHeightBuilder: () {
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
}
