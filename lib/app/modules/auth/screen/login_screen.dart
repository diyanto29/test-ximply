import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/config/constants/image_consts.dart';
import 'package:fonta_app/app/modules/auth/pods/auth_pod.dart';
import 'package:fonta_app/app/modules/auth/widgets/button_login_widget.dart';
import 'package:fonta_app/app/modules/auth/widgets/button_nav_login_widget.dart';
import 'package:fonta_app/app/modules/auth/widgets/form_login_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isVisiblePassword = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.sp,
              ),
              Center(
                child: Image.asset(
                  ImageConsts.logo,
                  height: 120.w,
                ),
              ),
              Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Form(
                key: _formKey,
                child: FormLoginWidget(
                  controllerEmail: controllerEmail,
                  controllerPassword: controllerPassword,
                  isVisiblePassword: isVisiblePassword,
                  onChangedValuePassword: (value) => setState(() {
                    isVisiblePassword = value;
                  }),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ButtonLoginWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(authPodProvider.notifier).login(
                          email: controllerEmail.text.trim(),
                          password: controllerPassword.text.trim(),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavLoginWidget(),
    );
  }
}
