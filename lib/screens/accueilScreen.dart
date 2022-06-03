


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
                  const   SizedBox(height: 120,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 180,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "images/mastercard.png",
                                    width: 50,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(text: "REDA KHOUDRI\n"),
                                  TextSpan(text: "**** **** **** 1298\n"),
                                  TextSpan(
                                      text: "VALID 09/22",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100))
                                ], style: TextStyle(fontSize: 22))),
                          )
                        ],
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
