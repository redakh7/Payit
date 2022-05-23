import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_wallet_hps/shared/constantes.dart';

Widget defaultHomeButton(
        {required String buttonText,
        required AssetImage buttonImage,
        required VoidCallback function}) =>
    InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      onTap: function,
      child: Ink(
        height: 40.0,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black, style: BorderStyle.solid, width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ImageIcon(buttonImage),
            ),

            const SizedBox(
              width: 10.0,
            ),
            Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
              ),
            )
          ],
        ),
      ),
    );


