import 'package:flutter/material.dart';
import 'package:flutter_asignment/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.shadowWidth,
    this.shadowHeight,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.secondaryColor,
  });
  final String text;
  final Function onTap;
  final double? width;
  final double? height;
  final double? shadowWidth;
  final double? shadowHeight;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? secondaryColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onTap();
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Container(
        width: width ?? size.width,
        height: height ?? 48,
        decoration: BoxDecoration(color: backgroundColor ?? AppColors.primaryColor, borderRadius: BorderRadius.circular(borderRadius ?? 12)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize ?? 20, fontWeight: fontWeight ?? FontWeight.w600, color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
