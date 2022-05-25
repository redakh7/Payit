import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/screens/home_page.dart';
import 'package:m_wallet_hps/shared/buttons.dart';
import 'package:m_wallet_hps/shared/component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var emailLoginController = TextEditingController();
  var passwordLogController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppLoginSuccessStates)
            {
              if(AppCubit.get(context).userModel.status !=null){
            showToast(message: state.userModel.message);
          navigateAndFinish(context, HomePage());
              }
            }
          else  if(state is AppLoginErrorStates) {
            showToast(message: state.error);
          }
        },
        builder: (context, state) => Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[

                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(15.0, 195.0, 0.0, 0.0),
                              child: const Text(
                                'Payit',
                                style: TextStyle(
                                    fontSize: 70.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(180, 195.0, 0, 0.0),
                              child: const Text(
                                '.',
                                style: TextStyle(
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            )
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                top: 65.0, left: 20.0, right: 20.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "the Email must not be empty";
                                    }
                                    return null;
                                  },
                                  controller: emailLoginController,
                                  decoration: const InputDecoration(
                                      labelText: 'EMAIL',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                ),
                                const SizedBox(height: 30.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "the Password  must not be empty";
                                    }
                                    return null;
                                  },
                                  controller: passwordLogController,
                                  decoration: const InputDecoration(
                                      labelText: 'PASSWORD   ',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  alignment: const Alignment(1.0, 0.0),
                                  padding:
                                      const EdgeInsets.only(top: 15.0, left: 20.0),
                                  child: const InkWell(

                                    child: Text(
                                      'Forgot Password ?',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                SizedBox(
                                  height: 40.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.greenAccent,
                                    color: Colors.green,
                                    elevation: 7.0,
                                    child: Center(
                                      child: loginButton(buttonText: "Login",
                                          function: (){
                                    if (_formKey.currentState!.validate()) {
                                    print(emailLoginController.text);
                                    print(passwordLogController.text);
                                    AppCubit.get(context).userLogin(
                                    email: emailLoginController.text,
                                    password: passwordLogController.text);
                                    }

                                    },)
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  height: 40.0,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 1.0),
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Center(
                                            // child: ImageIcon(AssetImage('assets/66436-play-google-icons-computer-email-gmail.png')),
                                            ),
                                        Center(
                                          child: Text(
                                            'Log in With Gmail',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'New here ?',
                              style: TextStyle(fontFamily: 'Montserrat'),
                            ),
                            const SizedBox(width: 5.0),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
