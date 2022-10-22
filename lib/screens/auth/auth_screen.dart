import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/reusable_button.dart';
import '../../components/reusable_textfield.dart';
import '../../controllers/auth_controllers.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthController controller = Get.put(AuthController());
  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Obx(
              () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      isLogin.value ? 'Login' : 'Register',
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          height: 45,
                          color:
                              !isLogin.value ? Colors.deepPurple : Colors.white,
                          onPressed: () {
                            isLogin.value = false;
                          },
                          child: Text('Register',
                              style: TextStyle(
                                fontSize: isLogin.value ? 18 : 20,
                                color:
                                    isLogin.value ? Colors.black : Colors.white,
                              )),
                        ),
                        MaterialButton(
                          height: 45,
                          color:
                              isLogin.value ? Colors.deepPurple : Colors.white,
                          onPressed: () {
                            isLogin.value = true;
                          },
                          child: Text('Login',
                              style: TextStyle(
                                fontSize: isLogin.value ? 20 : 18,
                                color:
                                    isLogin.value ? Colors.white : Colors.black,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    isLogin.value
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              InputTextFieldWidget(
                                  controller.loginEmailController,
                                  'Email Address'),
                              const SizedBox(
                                height: 20,
                              ),
                              InputTextFieldWidget(
                                  controller.loginPasswordController,
                                  'Password'),
                              const SizedBox(
                                height: 40,
                              ),
                              ReusableButton(
                                onPressed: () => controller.login(),
                                title: 'Login',
                              )
                            ],
                          )
                        : Column(
                            children: [
                              InputTextFieldWidget(
                                  controller.nameController, 'Name'),
                              const SizedBox(
                                height: 20,
                              ),
                              InputTextFieldWidget(
                                  controller.emailController, 'Email Address'),
                              const SizedBox(
                                height: 20,
                              ),
                              InputTextFieldWidget(
                                  controller.passwordController, 'Password'),
                              const SizedBox(
                                height: 40,
                              ),
                              ReusableButton(
                                onPressed: () => controller.register(),
                                title: 'Register',
                              )
                            ],
                          )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
