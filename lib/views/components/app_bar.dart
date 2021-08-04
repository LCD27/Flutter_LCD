import 'package:flutter/material.dart';
import '../../utils/index.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'divider.dart';

class CDAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? titleTextStyle;
  final VoidCallback? onTapBackCallback;
  final Color? bgColor;
  final bool? isShowBack;
  final bool? isShowDiver;
  final Widget? right;

  const CDAppBar(
      {Key? key,
      this.title,
      this.titleTextStyle,
      this.onTapBackCallback,
      this.bgColor,
      this.isShowBack,
      this.isShowDiver,
      this.right})
      : super(key: key);

  @override
  _CDAppBarState createState() => _CDAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(CDNumber.topNavBarHeight);
}

class _CDAppBarState extends State<CDAppBar> {
  @override
  Widget build(BuildContext context) {
    bool isShowBack = widget.isShowBack ?? true;
    bool isShowDiver = widget.isShowDiver ?? false;
    return Material(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: CDNumber.statusBarHeight,
        ),
        color: widget.bgColor ?? CDColor.color_white,
        child: Stack(
          children: [
            Center(
              child: Text(
                widget.title ?? '',
                style: widget.titleTextStyle ??
                    TextStyle(
                      color: CDColor.color_333,
                      fontWeight: FontWeight.bold,
                      fontSize: CDFont.font_16,
                    ),
              ),
            ),
            Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: isShowBack
                    ? Container(
                        width: 100.w,
                        padding: EdgeInsets.only(left: 24.w),
                        child: InkWell(
                          child: Align(
                            // child: Image.asset(
                            //   CDImage.assetsPath + "back.png",
                            //   width: 18.w,
                            //   height: 18.w,
                            //   fit: BoxFit.contain,
                            // ),
                            child: Icon(Icons.arrow_back_ios,size: 18.w,),
                            alignment: Alignment.centerLeft,
                          ),
                          onTap: () {
                            if (widget.onTapBackCallback != null) {
                              widget.onTapBackCallback!();
                              return;
                            }
                            Navigator.pop(context);
                          },
                        ),
                        color: Colors.transparent,
                      )
                    : Container()),
            Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: widget.right ?? Container()),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: isShowDiver ? CDDiver() : Container()),
          ],
        ),
      ),
    );
  }
}
