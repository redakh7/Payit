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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
DioHelper.init();
Firebase.initializeApp();

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            initialRoute: '/home',
            routes: {
              '/signup': (context) => SignupPage(),
              '/login': (context) => const LoginPage(),
              '/home': (context) => const HomePage(),
              '/transfert': (context) => const TransferPage(),
              '/accueil': (context) =>  AccueilScreen(),
            },
            home: const HomePage(),
          ),
        ));
  }
}
/*

 */