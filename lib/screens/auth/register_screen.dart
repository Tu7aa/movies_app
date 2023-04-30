import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/themes/colors.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  bool isObscureText = true;
  bool isObscureTextTwo = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController secondPasswordController = TextEditingController();
  final FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: FormKey,
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.asset(
                    'assets/images/popcorn.png',
                    height: 72,
                    width: 72,
                  ),
                  const Text(
                    "Let\'s Get Started",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontFamily: "Cairo",
                    ),
                  ),
                  const Text(
                    "Create an new account",
                    style: TextStyle(
                        color: Color(0xff9098B1),
                        fontFamily: "Cairo",
                        fontSize: 15),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    height: 55,
                    margin: const EdgeInsets.only(left: 14, right: 14),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.length <= 5) {
                            return 'error';
                          } else {
                            return null;
                          }
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey,fontFamily: "Cairo"),
                            hintText: 'Full Name',
                            prefixIcon: Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder())),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 55,
                    margin: const EdgeInsets.only(left: 14, right: 14),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.length <= 5) {
                            return 'error';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                            hintText: 'Your Email',
                          hintStyle: TextStyle(color: Colors.grey,fontFamily: "Cairo"),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder())),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 55,
                    margin: const EdgeInsets.only(left: 14, right: 14),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length <= 5) {
                          return 'error';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      obscureText: isObscureText,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey,fontFamily: "Cairo"),
                        border: const OutlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                            color: Colors.white.withOpacity(0.8),
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: isObscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 55,
                    margin: const EdgeInsets.only(left: 14, right: 14),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.length <= 5) {
                            return 'error';
                          } else {
                            return null;
                          }
                        },
                        controller: secondPasswordController,
                        obscureText: isObscureTextTwo,
                        decoration: InputDecoration(
                            hintStyle:const TextStyle(color: Colors.grey,fontFamily: "Cairo"),
                            hintText: 'Password Again',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.white.withOpacity(0.8),
                              onPressed: () {
                                setState(() {
                                  isObscureTextTwo = !isObscureTextTwo;
                                });
                              },
                              icon: isObscureTextTwo
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            border: const OutlineInputBorder())),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            print(nameController.text);
                            print(emailController.text);
                            print(passwordController.text);

                            if (FormKey.currentState!.validate()) {
                              if (passwordController.text ==
                                  secondPasswordController.text) {
                                signIn();
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff40BFFF)),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontFamily: "Cairo",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("have a account?",
                          style: TextStyle(
                              color: Color(0xff9098B1),
                              fontSize: 20,
                              fontFamily: "Cairo")),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Color(0xff40BFFF),
                              fontSize: 20,
                              fontFamily: "Cairo"),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return LoginPage();
      }));
    } on DioError catch (e) {
      print("This is an error :${e.response}");
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('You Should Enter Valid Email And Password'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
