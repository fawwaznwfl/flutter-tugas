// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:travel_app/core/model/model.dart';
import 'package:travel_app/presentation/page/detail.dart';
import 'package:travel_app/presentation/page/forgot1.dart';
import 'package:travel_app/presentation/page/forgot2.dart';
import 'package:travel_app/presentation/page/forgot3.dart';
import 'package:travel_app/presentation/page/forgot4.dart';
import 'package:travel_app/presentation/page/forgot5.dart';
import 'package:travel_app/presentation/page/forgot7.dart';
// import 'package:travel_app/presentation/page/forgot7.dart';
// import 'package:travel_app/presentation/page/forgot7.dart';
import 'package:travel_app/presentation/page/home.dart';
import 'package:travel_app/presentation/page/intro.dart';
import 'package:travel_app/presentation/page/login.dart';
import 'package:travel_app/presentation/page/otp.dart';
import 'package:travel_app/presentation/page/regis.dart';
import 'package:travel_app/presentation/page/search.dart';

import 'package:travel_app/presentation/page/splasch_screen.dart';

part 'route_name.dart';

final appRoute = GoRouter(routes: [
  GoRoute(
    path: '/home',
    name: Routes.home,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/',
    name: Routes.splash,
    builder: (context, state) => SplaschScreen(),
  ),
   GoRoute(
    path: '/intro',
    name: Routes.Intro,
    builder: (context, state) => ScreenIntroduction(),
  ),
  GoRoute(
    path: '/login',
    name: Routes.Login,
    builder: (context, state) => LoginScreen(),
  ),
   GoRoute(
    path: '/register',
    name: Routes.Register,
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: '/forgot',
    name: Routes.Forgot,
    builder: (context, state) => ForgotPasswordScreen(),
  ),
  GoRoute(
    path: '/forgot2',
    name: Routes.Forgot2,
    builder: (context, state) => CreateNewPasswordScreen(),
  ),
   GoRoute(
    path: '/forgot3',
    name: Routes.Forgot3,
    builder: (context, state) => PasswordScreen(),
  ),
  GoRoute(
    path: '/forgot4',
    name: Routes.Forgot4,
    builder: (context, state) => ForgotPassword(),
  ),

    GoRoute(
    path: '/forgot5',
    name: Routes.Forgot5,
    builder: (context, state) => CreateEmailScreen(),
  ),

  GoRoute(
    path: '/otp',
    name: Routes.OtpScreen,
    builder: (context, state) 
    {
      final email = state.extra as String;
      return OTPVerificationScreen(email: email);
    } 
  ),
   GoRoute(
    path: '/forgot7',
    name: Routes.Forgot7,
    builder: (context, state) => SuccessScreen(),
  ),
  GoRoute(path: '/detail',
    name: Routes.detail,
    builder: (context, state) {
      final _data = state.extra as DetailWisata;
      return DetailPage(data: _data);
    },
    ),
   GoRoute(
    path: '/search',
    name: Routes.search,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>? ?? {};
      final String searchQuery = extra['searchQuery'] as String? ?? "";
      final int categoryID = extra['categoryID'] as int? ?? 0;
      final List<Categories> categoryName = extra['categoryName'] as List<Categories>? ?? [];
      return SearchScreen(categoryID: categoryID, searchQuery: searchQuery, dataCategory: categoryName);
    },
  ),

]);