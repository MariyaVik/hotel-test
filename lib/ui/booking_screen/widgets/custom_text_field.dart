import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? helperText;
  final String? hint;
  final TextInputType? inputType;
  final String initValue;
  final int? maxLength;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final Function(String)? onTextChanged;
  final Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final bool isSingle;
  final bool isPhone;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hint,
    this.helperText,
    this.inputType,
    this.initValue = "",
    this.textEditingController,
    this.validator,
    this.onTextChanged,
    this.onSaved,
    this.inputFormatters,
    this.isSingle = false,
    this.isPhone = false,
    this.maxLength,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late ThemeData theme;

  final FocusNode _focusNode = FocusNode();

  Color _borderColor = AppColors.greyLight;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    widget.textEditingController?.text = widget.initValue;

    _focusNode.addListener(() {
      setState(() {
        if (widget.isPhone && _focusNode.hasFocus) {
          if (widget.textEditingController?.text == '') {
            widget.textEditingController?.text = '+7 (***) ***-**-**';
          }
          int cursorPos = widget.textEditingController!.text.indexOf('*');
          cursorPos = cursorPos == -1
              ? widget.textEditingController!.text.length
              : cursorPos;
          widget.textEditingController?.selection =
              TextSelection.collapsed(offset: cursorPos);
        }
        if (widget.isSingle) {
          String? f =
              widget.validator?.call(widget.textEditingController!.text);
          hasError = f != null;
          _borderColor = hasError && !_focusNode.hasFocus
              ? AppColors.error.withOpacity(0.15)
              : AppColors.greyLight;
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    theme = Theme.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: _borderColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.labelLarge,
        focusNode: _focusNode,
        controller: widget.textEditingController,
        keyboardType: widget.inputType,
        validator: (value) {
          String? f = widget.validator?.call(value);
          setState(() {
            _borderColor = f != null
                ? AppColors.error.withOpacity(0.15)
                : AppColors.greyLight;
          });
          return f;
        },
        inputFormatters: widget.inputFormatters,
        maxLines: 1,
        maxLength: widget.maxLength,
        onChanged: (text) {
          if (text.length == 1) {
            _borderColor = AppColors.greyLight;
            setState(() {});
          }
          widget.onTextChanged?.call(text);
        },
        onSaved: (text) {
          widget.onSaved?.call(text);
        },
        decoration: InputDecoration(
          labelText: widget.labelText,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
