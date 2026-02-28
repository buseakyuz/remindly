import 'package:flutter/material.dart';
import '../../../../core/constants/layout_constants.dart';
import 'package:remindly/core/extension/context_extension.dart';

class LoginTextField extends StatefulWidget {
  final String label;
  final IconData iconData;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;

  const LoginTextField({
    super.key,
    required this.label,
    required this.iconData,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(LayoutConstants.defaultRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.defaultSize,
            vertical: LayoutConstants.lowSize),
        child: TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          style: context.textTheme.bodyLarge,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            prefixIcon: Icon(widget.iconData,
                color: context.colorScheme.onSurface.withValues(alpha: 0.6)),
            hintText: widget.label,
            hintStyle: TextStyle(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6)),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: _toggleVisibility,
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color:
                          context.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
