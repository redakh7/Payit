import 'package:flutter/material.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/screens/login_page.dart';
import 'package:m_wallet_hps/shared/buttons.dart';
import 'package:m_wallet_hps/shared/component.dart';


class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultHomeButton(buttonText: "Log Out", buttonImage: AssetImage("images/logout.png"), function: (){
            navigateAndFinish(context, LoginPage());
          AppCubit.get(context).currentIndex=0;
          }),
        ],
      ),
    );
  }
}
