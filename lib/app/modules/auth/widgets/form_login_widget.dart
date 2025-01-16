import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({
    super.key,
    required this.isVisiblePassword,
    required this.onChangedValuePassword,
    required this.controllerEmail,
    required this.controllerPassword,
  });

  final bool isVisiblePassword;
  final ValueChanged<bool> onChangedValuePassword;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controllerEmail,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.white,
            labelText: "Email",
            hintText: "Masukan Email...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty == true) {
              return 'Wajib isi email';
            }
            return null;
          },
          onChanged: (value) {},
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextFormField(
          controller: controllerPassword,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: isVisiblePassword,
          validator: (value) {
            if (value?.isEmpty == true) {
              return 'Wajib isi Password';
            }
            return null;
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            labelText: "Kata Sandi",
            hintText: "Masukan Kata Sandi...",
            suffixIcon: IconButton(
              onPressed: () {
                onChangedValuePassword(!isVisiblePassword);
              },
              icon: Icon(
                isVisiblePassword
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
