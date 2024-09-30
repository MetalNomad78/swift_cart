import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/controllers/product_controller.dart';
import 'package:swift_cart/views/category_screen/item_details.dart';
import 'package:swift_cart/widgets_common/bg_widget.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;

  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print("HELLO");
    //   controller.getSubCategories(title!);
    // });

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).color(Colors.white).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    controller.subcat.length,
                        (index) => controller.subcat[index].toString()
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(150, 60)
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make(),
                  ),
                ),
              )),

              // Items container
              20.heightBox,

              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(imgP5, width: 200, height: 150, fit: BoxFit.cover),
                        "Laptop 4GB/64GB"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "Rs 60000"
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(16)
                            .make(),
                      ],
                    ).box.white.roundedSM.outerShadowSm.padding(EdgeInsets.all(8)).margin(EdgeInsets.symmetric(horizontal: 12)).make().onTap(() {
                      Get.to(() => ItemDetails(title: "Dummy Title"));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
