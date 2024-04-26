import 'package:caht_app/screens/login_screen.dart';
import 'package:caht_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/wbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_Screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1), vsync: this, upperBound: 1);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                ),
                Center(
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('assets/images/logoct.png'),
                          height: animation.value * 100,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'CLEVORY',
                            style: TextStyle(
                              fontFamily: 'Anta-Regular',
                              color: Colors.grey[600],
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            ' TRAINING',
                            style: TextStyle(
                              fontFamily: 'Anta-Regular',
                              color: Colors.white,
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        Expanded(
                          child: WelcomeButton(
                            buttonText: 'Sign in',
                            onTap: LoginScreen(),
                            textColor: Colors.white,
                            color: Colors.transparent,
                          ),
                        ),
                        Expanded(
                          child: WelcomeButton(
                            buttonText: 'Sign up',
                            onTap: RegistrationScreen(),
                            color: Colors.white,
                            textColor: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
