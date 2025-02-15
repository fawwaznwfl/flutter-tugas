import 'package:flutter/material.dart';
import 'package:travel_app/core/routing/app_route.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/useCase/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/traver.png', height: 100),
            SizedBox(height: 40),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: _obscureText,
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('Remember me'),
                Spacer(),
                TextButton(
                  onPressed: () => context.goNamed(Routes.Forgot),
                  child: Text('Forgot password?'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => prossesAuth().login(context, email.text, password.text),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFFFCD240),
                side: BorderSide(color: Color(0xFFFCD240)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Login', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 10),
           
            SizedBox(height:120),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/img/ig.png'),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/img/google.png'),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/img/fb.png'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
