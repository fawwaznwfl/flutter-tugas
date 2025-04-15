// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/routing/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplaschScreen extends StatefulWidget {
  const SplaschScreen({super.key});

  @override
  State<SplaschScreen> createState() => _SplaschScreenState();
}

class _SplaschScreenState extends State<SplaschScreen> {
bool intro = false;
String login = "";


  cekData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    if (prefs.getBool('isIntro') != null) {
        intro = prefs.getBool('isIntro')!;
        if (prefs.getString('isLogin') != null)  {
          login = prefs.getString('isLogin')!;
        }
    }
    });
} 

  void initState() {
    print(intro);
    cekData();
    Future.delayed(Duration(seconds: 3), () => !intro ? context.goNamed(Routes.Intro) : login == "" ? context.goNamed(Routes.Login) : context.goNamed(Routes.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Center(
                      child: Image.asset("assets/img/traver.png", height: 200, width: 200,),
                    ),
                  ),
             
                  Center(
                    child: Text("version 11.0"),
                  )
                ],
              )
        ],
      )
    );
  }
}