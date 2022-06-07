


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/shared/buttons.dart';

class AccueilScreen extends StatelessWidget {
  static String id = "AccueilScreen";
   AccueilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: ((context, state) {}),
        builder: ((context, state) => Material(
          color: Colors.transparent,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,


                children: <Widget>[
                  const SizedBox(height: 15.0),
                  Container(
                    height: 65,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 15
                          )
                        ]
                      ),

                    child: Center(
                      child: Text(
                          '0,00 MAD ',
                        style: TextStyle(
                            fontWeight: FontWeight. bold,
                          fontSize: 22,
                        ),
                      ),

                    ),
                  ),

                  Container(
                      padding: const EdgeInsets.only(
                          top: 65.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 30.0),
                          const SizedBox(
                            height: 5.0,
                          ),
                          defaultHomeButton(
                              buttonText: "Payment",
                              buttonImage:
                              const AssetImage("images/paiment.png"),
                              function: () async {
                                String? token = await FirebaseMessaging.instance.getToken();
                                print(token);
                              }),
                          const  SizedBox(height: 20.0),
                          defaultHomeButton(
                              buttonText: "Transfer",
                              buttonImage:
                              const AssetImage("images/transferrrt.png"),
                              function: () {
                                print("helloTransfer");
                              }),
                          const   SizedBox(height: 20.0),
                          defaultHomeButton(
                              buttonText: "History",
                              buttonImage:
                              const AssetImage("images/historique.png"),
                              function: () {
                                print("helloHistory");
                              }),
                          const    SizedBox(
                            height: 40.0,
                          ),
                        ],
                      )),
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        )));
  }
}
