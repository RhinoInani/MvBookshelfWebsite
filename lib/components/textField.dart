import 'package:bookshelf_website/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.header,
    required this.controller,
    required this.hint,
    required this.textInputType,
    required this.size,
    required this.height,
  }) : super(key: key);

  final String? header;
  final String? hint;
  final TextInputType? textInputType;
  final Size size;
  final TextEditingController? controller;
  final double height;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.all(widget.size.height * 0.02),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: "${widget.header}",
          hintText: "${widget.hint}",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: widget.size.height * 0.02,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.1,
            vertical: widget.size.height * 0.03,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: mainColor,
            ),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: mainColor),
            gapPadding: 10,
          ),
          errorText: errorText == "" ? null : errorText,
          errorStyle: TextStyle(color: Colors.red[400]),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red[400]!,
            ),
            gapPadding: 10,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.red[400]!,
            ),
            gapPadding: 10,
          ),
        ),
        onChanged: (string) {
          try {
            bool emailValid;
            widget.textInputType == TextInputType.emailAddress
                ? emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(string.trim())
                : emailValid = true;
            emailValid
                ? setState(() {
                    errorText = "";
                  })
                : setState(() {
                    errorText = "Please enter a valid email";
                  });
          } catch (FormatException) {
            setState(() {
              errorText = "Please enter a valid email";
            });
          }
        },
      ),
    );
  }
}
