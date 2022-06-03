import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/models/userModel.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
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
    AccueilScreen(),
   const SettingsPage(),
   const UserPage(),
  ];
static List<String> banks = <String>['cih', 'attijari','sgma'];
String element = banks.first;
void changeBank(newvalue){
element = newvalue;
  emit(AppChangeBottomNavStates());
}
  void changeBottom(index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

   UserModel? userModel;
  void userLogin({required String email, required String password,required String swift}) {
print(swift);
    emit(AppLoginInitialStates());
    DioHelper.postDataLogins(
      url: "login?swift=$swift",
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print('here');
      print(value.data);
      userModel = UserModel.fromJson(value.data);
      emit(AppLoginSuccessStates(userModel!));
      emit(LoginSaveTokenInitialStates());

    }).catchError((error) {
      print(error.toString());
      emit(AppLoginErrorStates("Login Failed"));
    });
  }



  void userSignUp({
    required String swift,
    required String email, required String password,
    required String firstName,required String lastName}) {
  emit(AppSigninInitialStates());
  print(swift);
    DioHelper.postData(
      url: "registration?swift=$swift",
      data: {
        'email': email,
        'password': password,
        'firstName' : firstName,
        'lastName' : lastName
      },
    ).then((value) {

      emit(AppSigninSuccessStates(swift));
      print(value.data);

    }).catchError((error) {
      print(error.toString());
      emit(AppSigninErrorStates(error.toString()));
    });
  }
  void addTokenToUser(email,deviceToken,swift){
    emit(LoginSaveTokenInitialStates());

    DioHelper.postDataLogins(url: "fcm_token?swift=$swift", data: {
      "email" : email,
      "fcmToken" : deviceToken
    }).then((value) => {
      print(value.data),
      emit(LoginSaveTokenSuccessStates()),
    }).catchError((error){
      emit(LoginSaveTokenErrorStates());
      print(error.toString());
    });
  }

  void loadLoggedInUser(email,swift){
    if(email != null ){
      emit(LoadLoggedInUserInitial());
print(swift);
      DioHelper.getData(url: "user?swift=$swift&email=$email").then((value)
      {
        userModel = UserModel.fromJson(value.data);
        print(userModel?.data.firstName);
        emit(LoadLoggedInUserSuccess());
      }).catchError((error){
        emit(LoadLoggedInUserError());
        print(error.toString());
      });
    }
  }






}

bool jwtVerification(String token){

  DateTime? expiryDate = Jwt.getExpiryDate(token);
  print(expiryDate);
  DateTime now =  DateTime.now();
  if(expiryDate!.compareTo(now) < 0)
  {
    return false;
  }
  else {

    return true;
  }
}

