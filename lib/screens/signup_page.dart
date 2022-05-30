import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/screens/login_page.dart';
import 'package:m_wallet_hps/shared/buttons.dart';
import 'package:m_wallet_hps/shared/component.dart';

class SignupPage extends StatelessWidget {
  static String id = "SignupScreen";

  final _formkey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();

  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSigninSuccessStates) {
          showToast(message: "registrated");
          navigateAndFinish(context, const LoginPage());
        } else if (state is AppLoginErrorStates) {
          showToast(message: state.error);
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          
          child: Form(
            key: _formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 195.0, 0.0, 0.0),
                      child: Text(
                        'Sign UP',
                        style: TextStyle(
                            fontSize: 70.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(250, 195.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the mail must not be empty";
                          }
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the first Name must not be empty";
                          }
                        },
                        controller: firstnameController,
                        decoration: const InputDecoration(
                            labelText: 'First Name   ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the last name must not be empty";
                          }
                        },
                        controller: lastnameController,
                        decoration: const InputDecoration(
                            labelText: 'Last Name   ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the password must not be empty";
                          }
                        },
                        controller: passwordController,
                        decoration: const InputDecoration(
                            labelText: 'Password  ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: loginButton(buttonText: "Register", function:
                            () {
                          if (_formkey.currentState!.validate()) {
                            AppCubit.get(context).userSignUp(
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstnameController.text,
                                lastName: lastnameController.text);
                          }
                        },),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const Text(
                          'Already Have account? ',
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                        const SizedBox(width: 5.0),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],)

                    ],
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
