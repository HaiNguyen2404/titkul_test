import 'package:flutter/material.dart';
import 'package:titkul_test/pages/layout.dart';
import 'package:titkul_test/util/app_colors.dart';
import 'package:titkul_test/widgets/circle_image.dart';
import 'package:titkul_test/widgets/custom_button.dart';
import 'package:titkul_test/widgets/custom_text_field.dart';

import '../widgets/custom_outline_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const CircleImage(
                  image: AssetImage('images/titkul_logo.jpg'),
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 60),
                CustomTextFormField(
                  controller: emailController,
                  icon: const Icon(
                    Icons.mail_outline_rounded,
                    size: 25,
                    color: AppColors.subtleDark2,
                  ),
                  hintText: 'Email',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: passwordController,
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    size: 25,
                    color: AppColors.subtleDark2,
                  ),
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Đăng nhập',
                  color: AppColors.red,
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Layout(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Đăng nhập thành công!')));
                  },
                ),
                const SizedBox(height: 20),
                CustomOutlineButton(
                  icon: Icons.phone_outlined,
                  color: Colors.white,
                  text: 'Liên hệ hỗ trợ',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
