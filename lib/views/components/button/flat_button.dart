import 'package:flutter/material.dart';
import '../../../utils/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CDFlatButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? text;
  final VoidCallback? onTap;
  final Color? bgColor;
  final double? radius;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  const CDFlatButton(
      {Key? key, required this.width, this.height,  this.text, this.onTap, this.bgColor, this.radius, this.textStyle, this.borderSide})
      : super(key: key);

  @override
  _CDFlatButtonState createState() => _CDFlatButtonState();
}

class _CDFlatButtonState extends State<CDFlatButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.radius??4.w),side:widget.borderSide?? BorderSide.none),
     color: widget.bgColor??CDColor.color_blue,
      child: InkWell(
        onTap: (){
          if(widget.onTap!=null){
            widget.onTap!();
          }
        },
        // splashColor:Colors.grey,
        child: Container(
          width: widget.width,
          height: widget.height ?? 44.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Center(
            child: Text(
              widget.text ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:widget.textStyle?? TextStyle(
                  fontSize: CDFont.font_16,
                  color: CDColor.color_white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
