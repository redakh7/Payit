import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/models/userModel.dart';
import 'package:m_wallet_hps/network/remote/dio_helper.dart';
import 'package:m_wallet_hps/screens/accueilScreen.dart';
import 'package:m_wallet_hps/screens/settings_page.dart';
import 'package:m_wallet_hps/screens/transfer_page.dart';
import 'package:m_wallet_hps/screens/user_page.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
   const AccueilScreen(),
   const TransferPage(),
   const SettingsPage(),
   const UserPage(),
  ];


  void changeBottom(index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  late UserModel userModel;
  void userLogin({required String email, required String password}) {
    emit(AppLoginInitialStates());
    DioHelper.postDataLogins(
      url: "login",
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print('here');
      print(value.data);
      userModel = UserModel.fromJson(value.data);
      emit(AppLoginSuccessStates(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorStates("Login Failed"));
    });
  }

  late UserModel signupUser;
  void userSignUp({required String email, required String password,required String firstName,required String lastName}) {
  emit(AppSigninInitialStates());
    DioHelper.postData(
      url: "registration",
      data: {
        'email': email,
        'password': password,
        'firstName' : firstName,
        'lastName' : lastName
      },
    ).then((value) {

      emit(AppSigninSuccessStates());
      print(value.data);

    }).catchError((error) {
      print(error.toString());
      emit(AppSigninErrorStates(error.toString()));
    });
  }




}