import 'package:animation_login_and_register/features/login_or_register/view/widgets/my_button.dart';
import 'package:animation_login_and_register/features/login_or_register/view/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RigesterForm extends StatefulWidget {
  final void Function()? signInOnTap;
  const RigesterForm({super.key, this.signInOnTap});

  @override
  State<RigesterForm> createState() => _RigesterFormState();
}

class _RigesterFormState extends State<RigesterForm> {
  final emailControlller = TextEditingController();
  final pwControlller = TextEditingController();
  final rePwControlller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailControlller.dispose();
    pwControlller.dispose();
    rePwControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Welcome to our App.\n Register now',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ).animate().fade(duration: 300.ms),
          const SizedBox(height: 30),
          CustomTextField(
            hint: 'Email',
            controllerr: emailControlller,
            icon: const Icon(Icons.email),
            bgColor: Colors.amber,
            hintStyleColors: Colors.black,
          ).animate(delay: 300.ms).fade(duration: 300.ms),
          const SizedBox(height: 25),
          CustomTextField(
            hint: 'Password',
            controllerr: pwControlller,
            icon: const Icon(Icons.lock),
            bgColor: Colors.amber,
            hintStyleColors: Colors.black,
          ).animate(delay: 600.ms).fade(duration: 300.ms),
          const SizedBox(height: 25),
          CustomTextField(
            hint: 'Re-Password',
            controllerr: rePwControlller,
            icon: const Icon(Icons.lock),
            bgColor: Colors.amber,
            hintStyleColors: Colors.black,
          ).animate(delay: 900.ms).fade(duration: 300.ms),
          const SizedBox(height: 25),
          MyButton(text: 'Register', onPressed: () {}).animate(delay: 1200.ms).fade(duration: 300.ms),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an Account    '),
              GestureDetector(
                onTap: widget.signInOnTap,
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ).animate(delay: 1500.ms).fade(duration: 300.ms),
        ],
      ),
    );
  }
}
