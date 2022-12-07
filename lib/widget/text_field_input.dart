import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_admin_app/utils/app_theme.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final bool isReadOnly;
  final String hintText;
  final TextInputType textInputType;
  final IconData iconData;
  final int? maxLines;
  final String errorMsg;
  final int? maxLength;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? textInputFormatter;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    this.isReadOnly = false,
    this.iconData = Icons.import_contacts_sharp,
    required this.hintText,
    required this.textInputType,
    this.maxLines = 1,
    this.maxLength,
    this.errorMsg = "",
    this.onChanged,
    this.textInputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            inputFormatters: textInputFormatter,
            controller: textEditingController,
            maxLines: maxLines,
            maxLength: maxLength,
            onChanged: onChanged,
            textInputAction: TextInputAction.done,
            keyboardType: textInputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorMsg == "" ? Theme.of(context).colorScheme.primary : AppTheme.errorRed,
                  width: 1.0
                ),
              ),
              labelText: hintText,
              prefixIcon: iconData != Icons.import_contacts_sharp ? Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(iconData),
              )  : null,
            ),
            obscureText: isPass,
            enabled: !isReadOnly,
          ),

          errorMsg == "" ?
            SizedBox()
           : Text(
            errorMsg,
            style: TextStyle(
            color: AppTheme.errorRed,
            ),
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      padding: iconData != Icons.import_contacts_sharp ? const EdgeInsets.symmetric(horizontal: 5.0) : const EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery. of(context).size.width,
      decoration: BoxDecoration(
        color: AppTheme.nearlyWhite,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [ AppTheme.boxShadow ],
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: iconData != Icons.import_contacts_sharp ? Icon(iconData) : null,
          border: InputBorder.none,
          labelText: hintText,
        ),
        obscureText: isPass,
        enabled: !isReadOnly,
      ),
    );
  }
}
