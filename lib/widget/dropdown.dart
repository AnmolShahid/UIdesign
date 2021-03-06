import 'package:client/shared/colors.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final value;
  final List? collection;
  final Function(dynamic)? onChanged;
  final Function()? onTapSuffixIcon;
  final Function()? onTapPrefixIcon;
  final IconData? suffixIconData;
  final IconData? prefixIconData;
  final Color? backgrounColor;
  final Color? dropDownColor;
  final Color? hintTextColor;
  final Color? prefixIconColor;
  final Color? sufixIconColor;
  final Color? valueColor;
  final Color? defaultIconColor;

  const DropDownField({
    Key? key,
    this.title,
    this.value,
    this.collection,
    this.onChanged,
    this.hintText,
    this.prefixIconData,
    this.onTapSuffixIcon,
    this.onTapPrefixIcon,
    this.suffixIconData,
    this.dropDownColor,
    this.valueColor = Colors.white,
    this.hintTextColor = Colors.white,
    this.prefixIconColor = Colors.white,
    this.sufixIconColor = Colors.white,
    this.backgrounColor,
    this.defaultIconColor = Colors.grey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 120,
      decoration: BoxDecoration(
          color: this.backgrounColor ?? whiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonFormField(
        value: value,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: valueColor,
            ),

        //  dropdownColor: dropDownColor ?? Colors.black.withOpacity(0.9),
        iconEnabledColor: defaultIconColor,
        decoration: InputDecoration(
            labelText: title,
            labelStyle: Theme.of(context).textTheme.bodyText2,
            hintText: hintText,
            prefixIcon: prefixIconData == null
                ? null
                : GestureDetector(
                    onTap: onTapPrefixIcon,
                    child: Icon(
                      prefixIconData,
                      color: prefixIconColor,
                    ),
                  ),
            suffixIcon: suffixIconData == null
                ? null
                : GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: Icon(
                      suffixIconData,
                      color: sufixIconColor,
                    ),
                  ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none)),
        items: collection!.map<DropdownMenuItem>((value) {
          return DropdownMenuItem(value: value, child: Text(value.toString()));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
