import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_asignment/utils/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.hintText,
    this.obscureText,
    this.suffixWidget,
    this.keyboardType,
    this.labelText,
    this.labelColor,
    this.requiredLabelText,
    this.maxLines,
    this.maxLength,
    this.validation,
    this.onTap,
    this.onSumbit,
    this.onChanged,
    this.textController,
    this.readOnly,
    this.fillColor,
    this.prefixWidget,
    this.hintStyle,
    this.borderRadius,
    this.borderColor,
    this.bottomPadding,
    this.insideLableText,
    this.labelFontWeight,
    this.labelFontSize,
    this.textColor,
    this.inputFormatters,
  });

  final String? hintText;
  final String? labelText;
  final Color? labelColor;
  final bool? requiredLabelText;
  final String? insideLableText;
  final bool? obscureText;
  final bool? readOnly;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validation;
  final TextEditingController? textController;
  final void Function()? onTap;
  final void Function(String)? onSumbit;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final Widget? prefixWidget;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Color? borderColor;
  final double? bottomPadding;
  final FontWeight? labelFontWeight;
  final double? labelFontSize;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    if (widget.textController != null) {
      _hasText = widget.textController!.text.isNotEmpty;
      widget.textController!.addListener(() {
        final hasTextNow = widget.textController!.text.trim().isNotEmpty;
        if (hasTextNow != _hasText) {
          if (mounted) {
            setState(() {
              _hasText = hasTextNow;
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(color: widget.borderColor ?? AppColors.greyColor.withOpacity(0.5)),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          RichText(
            text: TextSpan(
              text: widget.labelText,
              style: TextStyle(fontSize: widget.labelFontSize ?? 16, fontWeight: widget.labelFontWeight ?? FontWeight.w400, color: widget.labelColor ?? Colors.black),
              children: [
                if (widget.requiredLabelText == true)
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        Padding(
          padding: EdgeInsets.only(bottom: widget.bottomPadding ?? 20),
          child: TextFormField(
            readOnly: widget.readOnly ?? false,
            controller: widget.textController,
            validator: widget.validation,
            maxLines: widget.maxLines ?? 1,
            buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
            maxLength: widget.maxLength,
            obscureText: widget.obscureText ?? false,
            obscuringCharacter: "*",
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters ?? [],
            decoration: InputDecoration(
              prefixIcon: widget.prefixWidget,
              fillColor: widget.fillColor ?? Colors.white,
              filled: true,
              suffixIcon: widget.suffixWidget,
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
              errorMaxLines: 3,
              hintText: widget.hintText ?? "",
              errorStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
              hintStyle: widget.hintStyle ?? TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.greyColor),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: widget.textColor ?? Colors.black),
            onTap: widget.onTap,
            onFieldSubmitted: widget.onSumbit,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
