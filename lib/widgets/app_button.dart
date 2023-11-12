import 'package:adventure_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.index,
    this.color,
    this.size = 60,
    this.borderColor,
    required this.backgroundColor,
  });

  final Color? color;
  final double? size;
  final int? index;
  final Color? borderColor;
  final Color backgroundColor;

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
      child: Center(
        child: AppText(
          text: (index! + 1).toString(),
        ),
      ),
    );
  }
}
