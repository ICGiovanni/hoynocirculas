import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? initialValue;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.initialValue,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isActive = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey[300]!),
    );

    return TextFormField(
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: !isActive ? widget.obscureText : false,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: outlineInputBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red)),
        suffixIconColor: Colors.grey[600],
        suffixIcon: !widget.obscureText
            ? null
            : IconButton(
                onPressed: () {
                  isActive = !isActive;

                  setState(() {});
                },
                icon: Icon(
                  isActive ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                ),
              ),
        floatingLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 120, 120, 120), fontSize: 17),
        isDense: true,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        label: widget.label != null ? Text(widget.label!) : null,
        hintText: widget.hint,
        errorText: widget.errorMessage,
        focusColor: colors.primary,
      ),
    );
  }
}
