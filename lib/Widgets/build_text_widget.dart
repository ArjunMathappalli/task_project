
import 'package:flutter/material.dart';

class BuildTextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final TextDecoration? textDecoration;
  final double? size;
  final bool? isUnderlined;
  final FontWeight? fontWeight;

  final Color? backgroundColor;

  const BuildTextWidget({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.textDecoration,
    this.isUnderlined,
    this.backgroundColor,
  });

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      widget.text,
      style: TextStyle(
          decoration: widget.textDecoration ?? TextDecoration.none,
          color: widget.color,
          fontSize: widget.size,
          fontWeight: widget.fontWeight,
          fontFamily: "Mulish",
          backgroundColor: widget.backgroundColor),
    );
  }
}
