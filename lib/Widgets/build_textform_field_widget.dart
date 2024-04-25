import 'package:flutter/material.dart';


class BuildTexFormFieldWidget extends StatefulWidget {
  final String? Function(String?)? validation;

  final String hintText;
  final Widget suffix;
  final double? radius;

  const BuildTexFormFieldWidget(
      {super.key,
        this.validation,
        required this.hintText,
        required this.suffix,
        this.radius, });

  @override
  State<BuildTexFormFieldWidget> createState() =>
      _BuildTexFormFieldWidgetState();
}

class _BuildTexFormFieldWidgetState extends State<BuildTexFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      validator: (value) => widget.validation!(value),
      onTap: () {},
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontFamily: 'Mulish-VariableFont_wght.ttf',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          borderSide: BorderSide(
            color: Color(0xFDEECFF),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          borderSide: BorderSide(
            color: Color(0xFFF8FBFF),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          borderSide: BorderSide(
            color: Color(0xFFF8FBFF),
          ),
        ),
        suffixIcon: widget.suffix,
      ),
    );
  }
}
