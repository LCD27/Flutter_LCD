import 'package:flutter/material.dart';
import '../../utils/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CDDiver extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final double? height;

  const CDDiver({Key? key, this.margin, this.height}) : super(key: key);

  @override
  _CDDiverState createState() => _CDDiverState();
}

class _CDDiverState extends State<CDDiver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: widget.margin ?? EdgeInsets.symmetric(horizontal: 0.w),
      height: widget.height ?? 1.w,
      color: CDColor.color_line,
    );
  }
}
