import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:go_router/go_router.dart';

class BottomNavLoginWidget extends StatelessWidget {
  const BottomNavLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Belum Punya Akun? ",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () => GoRouter.of(context).goNamed(RouteNames.register),
            child: const Text(
              "Daftar disini",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
