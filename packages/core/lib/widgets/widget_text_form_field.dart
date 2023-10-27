import 'package:core/extensions/datetime_extensions.dart';
import 'package:core/extensions/int_extension.dart';
import 'package:core/theme.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum EnumTextField { dropdown, datePicker, timePicker }

enum EnumTextInputType { mobile, email, digitsWithDecimal, password }

const String regExMobileNumber = '^[6-9]{1}[0-9]{9}';
const String regExEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

class WidgetTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? prefixText;
  final EnumTextInputType? enumTextInputType;
  final EnumTextField? enumTextField;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool? isRequired, isEnabled, hideBorder;
  final Function(String)? validate;
  final String? label;
  final int? maxLines;
  final double? labelPadding;
  final EdgeInsets? margin, padding;
  final FocusNode? focusNode;
  final bool? autofocus;
  const WidgetTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.enumTextInputType,
    this.onChange,
    this.prefixText,
    this.labelPadding,
    this.enumTextField,
    this.maxLines,
    this.onTap,
    this.prefixIcon,
    this.suffix,
    this.isEnabled,
    this.hideBorder,
    this.validate,
    this.isRequired,
    this.label,
    this.onFieldSubmitted,
    this.margin,
    this.padding,
    this.focusNode,
    this.autofocus,
  }) : super(key: key);

  @override
  State<WidgetTextFormField> createState() => _WidgetTextFormFieldState();
}

class _WidgetTextFormFieldState extends State<WidgetTextFormField> {
  bool isError = false, showPassword = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
          color: AppColors.light, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: widget.label != null,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: widget.labelPadding ?? 0, top: 8),
                child: Row(
                  children: [
                    10.horizontal,
                    "${widget.label} ${widget.isRequired ?? false ? '*' : ''}"
                        .captionSmall
                        .color(AppColors.caption),
                  ],
                ),
              )),
          widgetInputField(),
        ],
      ),
    );
  }

  Widget widgetInputField() {
    return TextFormField(
      controller: widget.controller,
      inputFormatters: textInputformatter(),
      keyboardType: keyBoardType(),
      textInputAction: TextInputAction.next,
      enabled: widget.isEnabled ?? true,
      readOnly: widget.enumTextField == null ? false : true,
      textCapitalization: textCapitalization(),
      onTap: () {
        // FocusScope.of(context).unfocus();
        if (widget.enumTextField == EnumTextField.dropdown) {
          widget.onTap!();
        } else if (widget.enumTextField == EnumTextField.datePicker) {
          openDatePicker();
        } else if (widget.enumTextField == EnumTextField.timePicker) {
          openTimePicker();
        }
      },
      autofocus: widget.autofocus ?? false,
      onFieldSubmitted: (value) {
        if (widget.onFieldSubmitted != null) widget.onFieldSubmitted!(value);
      },
      obscureText: widget.enumTextInputType == EnumTextInputType.password
          ? showPassword
          : false,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        fillColor: AppColors.light,
        filled: true,
        // Default Border
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        // Focused Border
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        // Disabled border
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        hoverColor: AppColors.light,
        // Error Border
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red, width: 1),
            gapPadding: 20),
        hintText: widget.hintText,
        hintStyle: Styles.body,
        prefixText: widget.prefixText,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColors.secondary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        suffixIcon: () {
          return suffix();
        }(),
        isDense: true,
      ),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      validator: (value) {
        if (widget.isRequired == true) {
          if (value == null || value.isEmpty) {
            return "Please enter ${widget.label} !";
          }
          return validations(value);
        }
        return null;
      },
      focusNode: widget.focusNode,
      onChanged: (value) {
        if (widget.onChange != null) widget.onChange!(value);
      },
    );
  }

  openTimePicker() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        selectedTime = timeOfDay;
        String mainTime = '${selectedTime.hour}:${selectedTime.minute}';
        if (selectedTime.hour < 10) {
          mainTime = '0$mainTime';
        }
        widget.controller.text = mainTime;
      });
    }
  }

  openDatePicker() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = selectedDate.formatted;
      });
    }
  }

  String? validations(String value) {
    if (widget.enumTextInputType == EnumTextInputType.mobile) {
      RegExp regExpMobile = RegExp(regExMobileNumber);
      if (value.length != 10 || !regExpMobile.hasMatch(value)) {
        return "Please enter valid mobile number !";
      }
    } else if (widget.enumTextInputType == EnumTextInputType.email) {
      RegExp regExpEmail = RegExp(regExEmail);
      if (!regExpEmail.hasMatch(value)) {
        return "Please enter valid email id !";
      }
    } else if (widget.enumTextInputType == EnumTextInputType.password) {
      if (value.length < 6) {
        return "Please enter minimum 6 characters !";
      }
    }
    return null;
  }

  suffix() {
    if (widget.enumTextField == EnumTextField.dropdown) {
      return const Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
      );
    }
    if (widget.enumTextField == EnumTextField.datePicker) {
      return const Icon(
        Icons.calendar_today,
        color: Colors.grey,
      );
    }
    if (widget.enumTextField == EnumTextField.timePicker) {
      return const Icon(
        Icons.access_time,
        color: Colors.grey,
      );
    }
    if (widget.isEnabled == false) {
      return widget.suffix ??
          const Icon(
            Icons.block,
            color: Colors.grey,
          );
    }
    if (widget.enumTextInputType == EnumTextInputType.password) {
      return GestureDetector(
        onTap: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        child: Icon(
          !showPassword ? FeatherIcons.eye : FeatherIcons.eyeOff,
          color: Colors.grey,
        ),
      );
    }
    if (widget.suffix != null) {
      return widget.suffix;
    }
  }

  List<TextInputFormatter> textInputformatter() {
    List<TextInputFormatter> listFormatters = [];
    if (widget.enumTextInputType == EnumTextInputType.mobile) {
      listFormatters.add(FilteringTextInputFormatter.digitsOnly);
      listFormatters.add(LengthLimitingTextInputFormatter(10));
    } else if (widget.enumTextInputType ==
        EnumTextInputType.digitsWithDecimal) {
      listFormatters.add(
        FilteringTextInputFormatter.allow(RegExp(r"^(\d+)?([.]?\d{0,3})?$")),
      );
    }
    return listFormatters;
  }

  TextInputType keyBoardType() {
    if (widget.enumTextInputType == EnumTextInputType.mobile) {
      return const TextInputType.numberWithOptions(
          decimal: false, signed: false);
    }
    if (widget.enumTextInputType == EnumTextInputType.email) {
      return TextInputType.emailAddress;
    }
    if (widget.enumTextInputType == EnumTextInputType.digitsWithDecimal) {
      return const TextInputType.numberWithOptions(
          signed: false, decimal: true);
    }
    return TextInputType.text;
  }

  TextCapitalization textCapitalization() {
    if (widget.enumTextInputType == EnumTextInputType.email) {
      return TextCapitalization.none;
    }
    return TextCapitalization.words;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
