import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({
    super.key,
    this.width,
    this.isResponsive = false,
  });

  final double? width;
  final bool isResponsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff5D69B3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset('assets/images/button-one.png'),
          ),
        ],
      ),
    );
  }
}
