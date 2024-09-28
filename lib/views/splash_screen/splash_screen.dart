import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_cart/consts/colors.dart';
import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/views/auth_screen/login_screen.dart';
import 'package:swift_cart/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>LoginScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
                child:Image.asset(icSplashBg,width: 300),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            const Spacer(),
            credits.text.white.size(18).white.make(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
