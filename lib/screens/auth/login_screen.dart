import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/auth/register_screen.dart';
import 'package:movies_app/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     const SizedBox(height: 80),
                      Image.asset(
                        'assets/images/popcorn.png',
                        height: 72,
                        width: 72,
                      ),

                      const Text(
                        "Welcome to Movies",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily:"Cairo",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Sign in to continue",
                        style:
                            TextStyle(fontSize: 15, fontFamily: "Cairo",color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.length <= 5) {
                                return "Please enter Email again ";
                              } else
                                return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Your Email',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder())),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.length <= 5) {
                                return 'Please enter Password Again';
                              } else
                                return null;
                            },
                            controller: passwordController,
                            obscureText: isObscureText,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock_outline,
                                    color: Colors.white),
                                suffixIcon: IconButton(
                                  color: Colors.white.withOpacity(0.8),
                                  onPressed: () {
                                    setState(() {
                                      isObscureText = !isObscureText;
                                    });
                                  },
                                  icon: isObscureText
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                ),
                                border: OutlineInputBorder())),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              print(emailController.text);
                              print(passwordController.text);
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff40BFFF).withOpacity(0.7)),
                             child:  const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: "Cairo",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        height:140,
                      ),
                      const Text(
                        "Forget Password ?",
                        style: TextStyle(color: Color(0XFF40BFFF),fontFamily: "Cairo"),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Cairo"),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return RegisterScreen();
                              }));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Color(0xff40BFFF),fontFamily: "Cairo"),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/auth/login", data: {
        "email": emailController.text,
        "password": passwordController.text,
      });
      print('data is : ${response.data['access_token']}');

      final accessToken = response.data['access_token'];

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('access_token', accessToken);
      print('my access token is :$accessToken');

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return MainPage();
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
