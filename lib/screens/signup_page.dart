import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/screens/login_page.dart';
import 'package:m_wallet_hps/shared/buttons.dart';
import 'package:m_wallet_hps/shared/component.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:easy_loading_button/easy_loading_button.dart';





class SignupPage extends StatefulWidget {
  static String id = "SignupScreen";


  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {



  final jobRoleCtrl = TextEditingController();

  final _formkey = GlobalKey<FormState>();
 var swiftController = DropdownEditingController<String>();

  var passwordController = TextEditingController();

  var emailController = TextEditingController();

  var firstnameController = TextEditingController();

  var lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onButtonPressed() async {
      if (_formkey.currentState!.validate()) {
       //await Future.delayed(const Duration(milliseconds: 300), () => 422);

        AppCubit.get(context).userSignUp(
            swift: swiftController.value!,
            email: emailController.text,
            password: passwordController.text,
            firstName: firstnameController.text,
            lastName: lastnameController.text);
        await Future.delayed(Duration(milliseconds: 3000), () => 422);

      }


      // After [onPressed], it will trigger animation running backwards, from end to beginning
      return () {
             };
    }
    builder: EasyLoading.init();
    String dropdownvalue = 'Item 1';

// List of items in our dropdown menu

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSigninSuccessStates) {
          showToast(message: "registrated");
          CacheHelper.saveData(key: 'swift', value: state.swift);
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
                      TextDropdownFormField(
                        controller: swiftController,
                        options: ["cih", "attijari","sgma"],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            labelText: "BANK")
                        ,
                        dropdownHeight: 120,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(


                        child: EasyButton(
                          type: EasyButtonType.outlined,
                          idleStateWidget: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.black54,
                            )
                            ,
                          ) ,
                          loadingStateWidget: const CircularProgressIndicator(
                            strokeWidth: 3.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.green,
                            ),
                          ) ,
                          useWidthAnimation: true,
                          width: 150.0,
                          height: 40.0,
                          borderRadius: 14.0,
                          contentGap: 6.0,
                          onPressed: onButtonPressed,
                        ),
                      ),
                      /*Container(

                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: loginButton(buttonText: "Register", function:
                            () {
                          if (_formkey.currentState!.validate()) {
                            AppCubit.get(context).userSignUp(
                              swift: swiftController.value!,
                                email: emailController.text,
                                password: passwordController.text,
                                firstName: firstnameController.text,
                                lastName: lastnameController.text);


                          }
                        },)
                          ,
                      ),*/
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