import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/cubit/bloc_observer.dart';
import 'package:m_wallet_hps/network/remote/dio_helper.dart';
import 'package:m_wallet_hps/screens/accueilScreen.dart';

import 'package:m_wallet_hps/screens/home_page.dart';
import 'package:m_wallet_hps/screens/login_page.dart';
import 'package:m_wallet_hps/screens/signup_page.dart';
import 'package:m_wallet_hps/screens/transfer_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Firebase.initializeApp();
  String? token;
  Widget widget;
  try {
    token = CacheHelper.getData(key: 'token');
  } catch (e) {
    print(e);
  }
  print('token is ');
  print(token);

  if (token == null) {
    widget = const LoginPage();
  } else if (jwtVerification(token) == true) {
    print(jwtVerification(token));
    widget = const HomePage();
  } else {
    widget = const LoginPage();
  }

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()..loadLoggedInUser(CacheHelper.getData(key: 'email'))),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: startWidget,
            routes: {
              SignupPage.id: (context) => SignupPage(),
              LoginPage.id: (context) => const LoginPage(),
              HomePage.id: (context) => const HomePage(),
              TransferPage.id: (context) => const TransferPage(),
              AccueilScreen.id: (context) => AccueilScreen(),
            },
          ),
        ));
  }
}
