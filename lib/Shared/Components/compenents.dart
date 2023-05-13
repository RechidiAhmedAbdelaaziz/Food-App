import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void navigateTo({required context, required Widget widget}) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void replaceWith({required context, required Widget widget}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false);
}

typedef Valid = String? Function(String? value);
Widget defaultFromFiled({
  required TextEditingController control,
  TextInputType? type,
  Function? Function(String? value)? submit,
  Function? Function(String? value)? change,
  Function? Function()? ontap,
  Valid? valid,
  Icon? prefix,
  IconButton? suffix,
  required String lable,
  bool secure = false,
  InputBorder? focusBorder,
  GlobalKey<FormState>? key,
  TextStyle? lableStyle,
  bool isEnable = true,
}) =>
    TextFormField(
      
      key: key,
      onChanged: change,
      onFieldSubmitted: submit,
      validator: valid,
      onTap: ontap,
      controller: control,
      keyboardType: type,
      obscureText: secure,
      enabled: isEnable,
      cursorColor: HexColor('FFBF9B'),
      decoration: InputDecoration(
        
        focusedBorder: focusBorder,
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelStyle: lableStyle,
        labelText: lable,
        border: const OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  double height = 40,
  required VoidCallback function,
  Color color = Colors.teal,
  required String text,
  bool isUpperCase = true,
}) {
  return Container(
    width: width,
    height: height,
    color: color,
    child: MaterialButton(
      onPressed: function,
      child: Text(text),
    ),
  );
}

PreferredSizeWidget defaultAppBar(
  context, {
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      elevation: 0,
      titleSpacing: 5.0,
      title: Text('$title'),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      actions: actions,
    );
