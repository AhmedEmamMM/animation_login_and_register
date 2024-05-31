import 'package:animation_login_and_register/features/login_or_register/view/widgets/my_button.dart';
import 'package:animation_login_and_register/features/login_or_register/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function()? registerNowOnTap;
  const LoginForm({super.key, this.registerNowOnTap});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailControlller = TextEditingController();
  final pwControlller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailControlller.dispose();
    pwControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Welcome Back.\n Sign-in now',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          const SizedBox(height: 30),
          CustomTextField(
            hint: 'Email',
            controllerr: emailControlller,
            icon: const Icon(Icons.email),
            bgColor: Colors.amber,
            hintStyleColors: Colors.black,
          ),
          const SizedBox(height: 25),
          CustomTextField(
            hint: 'Password',
            controllerr: pwControlller,
            icon: const Icon(Icons.lock),
            bgColor: Colors.amber,
            hintStyleColors: Colors.black,
          ),
          const SizedBox(height: 25),
          MyButton(text: 'Sign-in', onPressed: () {}),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an Account    '),
              GestureDetector(
                onTap: widget.registerNowOnTap,
                child: const Text(
                  'RegisterNow',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
