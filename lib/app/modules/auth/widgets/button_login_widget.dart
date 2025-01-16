import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          side: const BorderSide(
            color: Colors.greenAccent,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          "Masuk",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
