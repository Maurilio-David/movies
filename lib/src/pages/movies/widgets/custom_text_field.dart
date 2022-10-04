import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/theme/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.label,
      this.isSecret = false,
      this.inputFormatters,
      this.initialValue,
      this.controller,
      this.onChanged,
      this.readOnly = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
            fillColor: ice,
            filled: true,
            prefixIcon: Icon(
              widget.icon,
              size: 24,
              color: gray2,
            ),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off))
                : null,
            hintText: widget.label,
            labelStyle: GoogleFonts.montserrat(
                color: gray2, fontWeight: FontWeight.w400, fontSize: 14),
            isDense: true,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(30)),
            focusColor: gray,
            hoverColor: gray),
      ),
    );
  }
}
