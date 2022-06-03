import 'package:flutter/material.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/screens/login_page.dart';
import 'package:m_wallet_hps/shared/buttons.dart';
import 'package:m_wallet_hps/shared/component.dart';


class UserPage extends StatelessWidget {
  static String id = "UserScreen";
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultHomeButton(buttonText: "Log Out", buttonImage: AssetImage("images/logout.png"), function: (){
            CacheHelper.removeData(key: 'token');
            CacheHelper.removeData(key: 'email');

            navigateAndFinish(context, LoginPage());
          AppCubit.get(context).currentIndex=0;
          }),
        ],
      ),
    );
  }
}
