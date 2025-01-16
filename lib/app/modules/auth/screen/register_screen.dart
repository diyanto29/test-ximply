import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/modules/auth/pods/auth_pod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ref.read(authPodProvider.notifier).register(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            name: _nameController.text.trim(),
            referalCode: _referralCodeController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Form Registrasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration:
                    _inputDecoration('Nama Lengkap', 'Masukkan nama Anda...'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('Email', 'Masukkan email Anda...'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Masukkan email yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration:
                    _inputDecoration('Password', 'Masukkan password Anda...'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 8) {
                    return 'Password harus minimal 8 karakter';
                  }
                  if (!RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])')
                      .hasMatch(value)) {
                    return 'Password harus mengandung huruf besar, kecil, angka, dan simbol';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordConfirmationController,
                obscureText: true,
                decoration: _inputDecoration(
                    'Konfirmasi Password', 'Masukkan ulang password Anda...'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Konfirmasi password tidak boleh kosong';
                  }
                  if (value != _passwordController.text) {
                    return 'Password tidak cocok';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _referralCodeController,
                textInputAction: TextInputAction.done,
                decoration: _inputDecoration(
                    'Kode Referral', 'Masukkan kode referral (opsional)...'),
              ),
              const SizedBox(height: 20),
              SizedBox(
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
                  onPressed: _submitForm,
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
