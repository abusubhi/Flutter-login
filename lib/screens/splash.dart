import 'package:flutter/material.dart';
import 'package:task1/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('splash'),
      ),
      body: Column(
        children: [
          Container(
            height: 600,
            child: PageView(
              children: [
                Image.asset(
                  'images/1.jpg',
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'images/images.jpg',
                  height: 300,
                  fit: BoxFit.fill,
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black.withOpacity(0.5);
                      }
                    }),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Let's GO!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
