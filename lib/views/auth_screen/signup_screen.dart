import 'package:get/get.dart';
import 'package:swift_cart/consts/lists.dart';
import 'package:swift_cart/controllers/auth_controller.dart';
import 'package:swift_cart/views/home_screen/home.dart';
import 'package:swift_cart/widgets_common/applogo_widget.dart';
import 'package:swift_cart/widgets_common/bg_widget.dart';
import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/widgets_common/custom_textfield.dart';
import 'package:swift_cart/widgets_common/our_button.dart';

class SignUpScree extends StatefulWidget {
  const SignUpScree({super.key});

  @override
  State<SignUpScree> createState() => _SignUpScreeState();
}

class _SignUpScreeState extends State<SignUpScree> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Sign Up for $appname"
                    .text
                    .fontFamily(bold)
                    .white
                    .size(22)
                    .make(),
                15.heightBox,
                Obx(
                  () => Column(
                    children: [
                      customTextField(
                          title: name,
                          hint: nameHint,
                          controller: nameController,
                          isPass: false),
                      5.heightBox,
                      customTextField(
                          title: email,
                          hint: emailHint,
                          controller: emailController,
                          isPass: false),
                      5.heightBox,
                      customTextField(
                          title: password,
                          hint: passwordHint,
                          isPass: true,
                          controller: passwordController),
                      5.heightBox,
                      customTextField(
                          title: retypepass,
                          hint: retypepasshind,
                          controller: passwordRetypeController,
                          isPass: true),
                      5.heightBox,
                      10.heightBox,
                      Row(
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                              checkColor: redColor,
                              activeColor: Colors.white,
                              value: isCheck,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue;
                                });
                              }),
                          5.widthBox,
                          Expanded(
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                      fontFamily: bold, color: fontGrey)),
                              TextSpan(
                                  text: termsandconditions,
                                  style: TextStyle(
                                      fontFamily: bold, color: redColor)),
                              TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                      fontFamily: bold, color: fontGrey)),
                              TextSpan(
                                  text: privacypolicy,
                                  style: TextStyle(
                                      fontFamily: bold, color: redColor)),
                            ])),
                          )
                        ],
                      ),
                      15.heightBox,
                      controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : ourButton(
                                  onPress: () async {
                                    if (isCheck != false) {
                                      controller.isloading(true);
                                      try {
                                        await controller
                                            .signupMethod(
                                                context: context,
                                                email: emailController.text,
                                                password:
                                                    passwordController.text)
                                            .then((value) {
                                          return controller
                                              .storeUserData(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  name: nameController.text)
                                              .then((value) {
                                            VxToast.show(context,
                                                msg: loggedIn);
                                            Get.offAll(() => Home());
                                          });
                                        });
                                      } catch (e) {
                                        auth.signOut();
                                        VxToast.show(context,
                                            msg: e.toString());
                                        controller.isloading(false);
                                      }
                                    }
                                  },
                                  color: isCheck == true ? redColor : lightGrey,
                                  textColor: isCheck == true
                                      ? whiteColor
                                      : Colors.black45,
                                  title: signup)
                              .box
                              .width(context.screenWidth - 50)
                              .make(),
                      25.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          already.text.color(fontGrey).make(),
                          login.text
                              .color(redColor)
                              .fontFamily(bold)
                              .make()
                              .onTap(() {
                            Get.back();
                          }),
                        ],
                      ),
                      25.heightBox,
                      const Row(children: <Widget>[
                        Expanded(child: Divider()),
                        SizedBox(width: 10),
                        Text("OR"),
                        SizedBox(width: 10),
                        Expanded(child: Divider()),
                      ]),
                      15.heightBox,
                      signupWith.text.color(fontGrey).make(),
                      15.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: lightGrey,
                                    child: Image.asset(
                                      socialIconList[index],
                                      width: 30,
                                    ),
                                  ),
                                )),
                      ),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .width(context.screenWidth - 70)
                      .shadowSm
                      .padding(const EdgeInsets.all(16))
                      .make(),
                ),
              ],
            ),
          )),
    );
  }
}
