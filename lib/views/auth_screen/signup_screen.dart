import 'package:get/get.dart';
import 'package:swift_cart/consts/lists.dart';
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

  bool? isCheck=false;

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
                Column(
                  children: [
                    customTextField(name, nameHint),
                    5.heightBox,
                    customTextField(email, emailHint),5.heightBox,
                    customTextField(password, passwordHint),5.heightBox,
                    customTextField(retypepass, retypepasshind),5.heightBox,
                    10.heightBox,
                    Row(
                      children: [
                        Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(width: 1.0, color: Colors.black),
                            ),
                          checkColor: redColor,
                            activeColor: Colors.white,

                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck=newValue;
                              });

                            }),
                        5.widthBox,
                        Expanded(
                          child: RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: "I agree to the ",
                                style:
                                    TextStyle(
                                        fontFamily: bold,
                                        color: fontGrey)),
                                TextSpan(
                                    text: termsandconditions,
                                    style:
                                    TextStyle(
                                        fontFamily: bold,
                                        color: redColor)),
                                TextSpan(
                                    text: " & ",
                                    style:
                                    TextStyle(
                                        fontFamily: bold,
                                        color: fontGrey)),
                                TextSpan(
                                    text: privacypolicy,
                                    style:
                                    TextStyle(
                                        fontFamily: bold,
                                        color: redColor)),
                          ])),
                        )
                      ],
                    ),
                    15.heightBox,
                    ourButton(
                            onPress: () {},
                            color: isCheck==true? redColor:lightGrey,
                            textColor: isCheck==true? whiteColor:Colors.black45,
                            title: signup)
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    25.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        already.text.color(fontGrey).make(),
                        login.text.color(redColor).fontFamily(bold).make().onTap((){Get.back();}),
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
              ],
            ),
          )),
    );
  }
}
