import 'package:adventure_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    this.color,
    this.size = 60,
    this.borderColor,
    required this.backgroundColor,
    this.text,
    this.icon,
    this.isIcon = false,
  });

  final Color? color;
  final double? size;
  final Color? borderColor;
  final Color backgroundColor;
  final String? text;
  IconData? icon;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
        border: Border.all(
          width: 1.0,
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color ?? Colors.white,
              ),
            )
          : Center(
              child: Icon(icon, color: color),
            ),
    );
  }
}
