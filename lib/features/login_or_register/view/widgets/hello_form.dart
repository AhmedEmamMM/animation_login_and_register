import 'package:animation_login_and_register/features/login_or_register/view/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HelloForm extends StatelessWidget {
  final void Function()? loginOnPressed;
  final void Function()? registerOnPressed;
  const HelloForm({
    super.key,
    this.loginOnPressed,
    this.registerOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = const TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
    return Column(
      children: [
        Text('Hello', style: myStyle),
        const SizedBox(height: 15),
        MyButton(text: 'Login', onPressed: loginOnPressed),
        const SizedBox(height: 15),
        MyButton(text: 'Register', onPressed: registerOnPressed),
      ],
    );
  }
}
