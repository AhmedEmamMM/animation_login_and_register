import 'package:animation_login_and_register/features/login_or_register/view/widgets/hello_form.dart';
import 'package:animation_login_and_register/features/login_or_register/view/widgets/login_form.dart';
import 'package:animation_login_and_register/features/login_or_register/view/widgets/register_form.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;
  bool isLogin = false;
  bool isRegister = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 1, end: 2.2).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double animationContanierHieght = size.height * 0.3;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.greenAccent,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
                left: size.width * 0.3,
                bottom: (animationContanierHieght + 20) * animation.value,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/w.png')),
                      borderRadius: BorderRadius.circular(60)),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                height: animationContanierHieght * animation.value,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: isLogin
                    ? LoginForm(
                        registerNowOnTap: () async {
                          await _animationController.reverse();
                          _animationController.forward();
                          setState(() {
                            isLogin = false;
                            isRegister = true;
                          });
                        },
                      )
                    : isRegister
                        ? RigesterForm(
                            signInOnTap: () async {
                              await _animationController.reverse();
                              _animationController.forward();
                              setState(() {
                                isLogin = true;
                                isRegister = false;
                              });
                            },
                          )
                        : HelloForm(
                            loginOnPressed: () async {
                              _animationController.forward();
                              await Future.delayed(
                                  const Duration(microseconds: 400));
                              setState(() {
                                isLogin = true;
                                isRegister = false;
                              });
                            },
                            registerOnPressed: () {
                              setState(() {
                                _animationController.forward();
                                isLogin = false;
                                isRegister = true;
                              });
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
