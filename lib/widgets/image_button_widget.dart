import 'package:flutter/material.dart';

class ImageButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final String image;
  final Color color;
  const ImageButtonWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.padding,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
        ),
        onPressed: () {},
        child: Image.asset(
          image,
          color: color,
        ),
      ),
    );
  }
}
