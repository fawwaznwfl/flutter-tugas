// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/routing/app_route.dart';

class SplaschScreen extends StatefulWidget {
  const SplaschScreen({super.key});

  @override
  State<SplaschScreen> createState() => _SplaschScreenState();
}

class _SplaschScreenState extends State<SplaschScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => context.goNamed(Routes.Login));
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