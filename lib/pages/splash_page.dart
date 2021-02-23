import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:jogodogalo/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isGrowing = false;
  double y = 0.0;
  double dy = 0.0;
  int i = 0;
  Ticker _ticker;

  @override
  void initState() {
    super.initState();

    animateCircle();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircule(),
                Text(
                  'Jogo da velha',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )),
      ),
    );
  }

  _buildCircule() {
    return Transform.translate(
      offset: Offset(0, y),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }

  animateCircle() {
    _ticker = Ticker((now) {
      if (i < 100) {
        setState(() {
          if (y > 220) {
            //Make the circle back up if reach the end
            dy = -dy;
          }
          dy += 1;
          y += dy;
        });
      } else {
        _ticker.dispose();
        Navigator.pop(context);
        Get.to(() => HomePage());
      }
      i++;
    });
    _ticker.start();
  }
}
