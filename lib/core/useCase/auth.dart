// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/Core/routing/app_route.dart';

class prossesAuth {
  var url = dotenv.env['baseUrl'];

  Future register(BuildContext context, String name, String email,
      String password, String confirmPassword) async {
    Uri urlRegister = Uri.parse("$url/auth/register");
    var response = await http.post(urlRegister,
     headers: {"Content-Type": "application/json"},
     body: jsonEncode(
      {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    }
     ) 
     );

    if (response.statusCode == 200) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Registration Successful"),
            content: Text("Silahkan cek email anda"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog

                 context.goNamed(Routes.OtpScreen, extra: email);
                },
              ),
            ],
          );
        },
      );
    } else {
      return false;
    }
  }


Future verifyOTP(BuildContext context, String email, String otp) async {
    Uri urlVerifyOTP = Uri.parse("$url/auth/verify/");
    var response = await http.post(urlVerifyOTP, headers: {
      'Content-Type': 'application/json',
    }, body: jsonEncode({
      'email': email,
      'otp': otp,
    }));

    print(response.statusCode);
    if (response.statusCode == 200) {
      return context.goNamed(Routes.Forgot7);
    } else {

      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("kode OTP salah"),
        ),
      );
    }
  }


  Future login(BuildContext context, String email, String password) async {
    Uri urlLogin = Uri.parse("$url/auth/login");
    var response = await http.post(urlLogin,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    if (response.statusCode == 200) {
     return context.goNamed(Routes.home);
    } else {
       return AlertDialog(
        title: Text("Login Gagal"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  }

    Future forgotPassword(BuildContext context, String email) async {
    Uri urlForgot = Uri.parse("$url/auth/forgot-password");
    var response = await http.post(urlForgot,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
        }));
    if (response.statusCode == 200) {
      return context.goNamed(Routes.Forgot7);
    } else {
       return AlertDialog(
        title: Text("Login Gagal"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  }
}