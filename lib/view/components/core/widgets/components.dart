
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   onSubmit,
   onChange,
   onTap,
  bool isPassword = false,
  required validate,
  required String label,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator:validate,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: (){
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : SizedBox(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

Widget defaultFormFieldForNote({
  required TextEditingController controller,
  required TextInputType type,
   onSubmit,
   onChange,
   onTap,
  bool isPassword = false,
  required validate,
  required String label,
  String? date,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  bool readOnly = false,
  bool enabled = true,
}) =>
    TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        hintText: date,
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: (){
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : SizedBox(),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
            )
        )
      ),
    );

Widget defaultFormFieldForSupport({
  required TextEditingController controller,
  required TextInputType type,
   onSubmit,
   onChange,
   onTap,
  bool isPassword = false,
  required  validate,
  String? label,
  String? date,
  IconData? suffix,
  IconData? prefix,
  Function? suffixPressed,
  bool isClickable = true,
  bool readOnly = false,
  bool enabled = true,
  double? vertical,
}) =>
    TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        hintText: date,
        labelText: label,
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: (){
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : SizedBox(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

Widget defaultTextButton({
  required  function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          decoration: TextDecoration.underline,
          color: Colors.orange,
          fontWeight: FontWeight.w500
        ),
      ),
    );


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.orange,
  Color textColor = Colors.white,
  bool isUpperCase = false,
  double radius = 10.0,
   function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        border: Border.all(
          color: Colors.orange,
          width: 1
        ),
        color: background,
      ),
    );


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ), (route) {
      return false;
    },
    );


Widget loading(BuildContext context){
  return Center(
    child: LoadingAnimationWidget.prograssiveDots(
      color: Colors.orange,
      size : MediaQuery.of(context).size.width / 10,
    ),
  );
}

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}