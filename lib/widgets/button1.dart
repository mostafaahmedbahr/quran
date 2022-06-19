
import 'package:flutter/material.dart';
class Button1 extends StatelessWidget {
 final double? height;
 final double? width;
 final Function()? onPress;
 final String? text;
 final Color? color;
 final double? raduis;
  const Button1({
    Key? key,
    this.height,
    this.width,
    this.onPress,
    this.text,
    this.color,
    this.raduis,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width : width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis!),
          ),
        ),
        onPressed: onPress,
        child: Text(text!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}
