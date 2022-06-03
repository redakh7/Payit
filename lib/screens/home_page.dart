import 'package:drawerbehavior/drawer_scaffold.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/screens/settings_page.dart';
import 'package:m_wallet_hps/shared/buttons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatelessWidget {
  static String id = "HomeScreen";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: ((context, state) {}),
      builder: ((context, state){
        return Conditional.single(context: context,
        conditionBuilder: (context)=>AppCubit.get(context).userModel!=null,
    widgetBuilder: (context)=> builderWidget(context),
    fallbackBuilder: (context) => Container(
      color: Colors.white,
      child: const Center(
      child: CircularProgressIndicator(backgroundColor: Colors.green,color: Colors.red),
      ),
    ));
    }
      ));
  }



  Widget builderWidget(context)=>Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/body_background.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hello ${AppCubit. get (context).userModel?.data.firstName.toUpperCase()}!",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: AppCubit.get(context)
          .bottomScreens[AppCubit.get(context).currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: AppCubit.get(context).currentIndex,
        onTap: (index) {
          AppCubit.get(context).changeBottom(index);
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    ),
  );
}
