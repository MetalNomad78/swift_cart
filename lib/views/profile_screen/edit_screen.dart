import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_cart/controllers/profile_controller.dart';
import 'package:swift_cart/widgets_common/bg_widget.dart';
import 'package:swift_cart/widgets_common/custom_textfield.dart';
import 'package:swift_cart/widgets_common/our_button.dart';

import '../../consts/consts.dart';

class EditScreen extends StatelessWidget {
  final dynamic data;

  const EditScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                ? Image.asset(imgProfile2, width: 130, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make()
                : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                    ? Image.network(data['imageUrl'],
                            width: 100, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make()
                    : Image.file(File(controller.profileImgPath.value),
                            width: 100, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
            10.heightBox,
            ourButton(
              color: redColor,
              onPress: () {
                controller.changImage(context);
              },
              textColor: whiteColor,
              title: "Change",
            ),
            Divider(),
            20.heightBox,
            customTextField(
              hint: nameHint,
              title: name,
              isPass: false,
              controller: controller.nameController,
            ),
            10.heightBox,
            customTextField(
                hint: passwordHint,
                title: "Old Password",
                isPass: true,
                controller: controller.oldpassController),
            10.heightBox,
            customTextField(
                hint: passwordHint,
                title: "New Password",
                isPass: true,
                controller: controller.newpassController),

            20.heightBox,
            controller.isLoading.value
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor))
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                        color: redColor,
                        onPress: () async {
                          controller.isLoading(true);

                          //if image is not selected
                          if(controller.profileImgPath.value.isNotEmpty){
                            await controller.uploadProfileImage();
                          }
                          else{
                            controller.profileImageLink=data['imageUrl'];
                          }

                          //if old password matches previous password

                          if(data['password']==controller.oldpassController.text){
                            await controller.changeAuthPassword(
                              email: data['email'],
                              password: controller.oldpassController.text,
                              newpassword: controller.newpassController.text
                            );
                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.newpassController.text,
                            );

                            VxToast.show(context, msg: "Updated");
                          }
                          else{
                            VxToast.show(context, msg: "Wrong old password");
                            controller.isLoading(false);
                          }


                        },
                        textColor: whiteColor,
                        title: "Save"),
                  )
          ],
        )
            .box
            .shadowSm
            .white
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
