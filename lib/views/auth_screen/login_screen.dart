import 'package:get/get.dart';
import 'package:swift_cart/consts/lists.dart';
import 'package:swift_cart/controllers/auth_controller.dart';
import 'package:swift_cart/views/auth_screen/signup_screen.dart';
import 'package:swift_cart/views/home_screen/home.dart';
import 'package:swift_cart/widgets_common/applogo_widget.dart';
import 'package:swift_cart/widgets_common/bg_widget.dart';
import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/widgets_common/custom_textfield.dart';
import 'package:swift_cart/widgets_common/our_button.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller=Get.put(AuthController());

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight*0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(22).make(),
              15.heightBox,
              Obx(()=>
                Column(
                  children: [
                    customTextField(title: email,hint: emailHint,isPass: false,controller: controller.emailController),
                    customTextField(title: password,hint: passwordHint,isPass: true,controller: controller.passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child:forgetPass.text.make())),
                    5.heightBox,
                    // Inside your onPress method for login button
                    controller.isloading.value?const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          :ourButton(
                      onPress: () async {
                        controller.isloading(true);
                        try {
                          await controller.loginMethod(context: context).then((value) {
                            if (value != null) {
                              VxToast.show(context, msg: loggedIn);
                              Get.offAll(() => const Home());
                            }
                            else{
                              controller.isloading(false);
                            }
                          });
                        } catch (e) {
                          VxToast.show(context, msg: "Login failed: ${e.toString()}");
                        }
                      },
                      color: redColor,
                      textColor: whiteColor,
                      title: login,
                    ).box
                        .width(context.screenWidth - 50)
                        .make(),
                
                    25.heightBox,
                
                    const Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider()
                          ),
                          SizedBox(width: 10),
                          Text("OR"),
                          SizedBox(width: 10),
                          Expanded(
                              child: Divider()
                          ),
                        ]
                    ),
                    15.heightBox,
                    createnewaccount.text.color(fontGrey).make(),
                    15.heightBox,
                    ourButton(onPress: () {
                      Get.to(()=>SignUpScree());
                      },
                        color: lightGolden,
                        textColor: redColor,
                        title: signup).box
                        .width(context.screenWidth-50).make(),
                    20.heightBox,
                    const Row(
                        children: [
                          Expanded(
                              child: Divider()
                          ),
                          SizedBox(width: 10),
                          Text("OR"),
                          SizedBox(width: 10),
                          Expanded(
                              child: Divider()
                          ),
                        ]
                    ),
                    10.heightBox,
                    loginWith.text.color(fontGrey).make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      List.generate(3, (index)=>Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: lightGrey,
                          child: Image.asset(socialIconList[index],
                            width: 30,
                          ),
                        ),
                      )),
                    ),
                  ],
                ).box.white.rounded.width(context.screenWidth-70).shadowSm.padding(const EdgeInsets.all(16)).make(),
              ),



            ],
          ),
        )
      ),
    );
  }
}
