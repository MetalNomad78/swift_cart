import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/consts/lists.dart';
import 'package:swift_cart/views/home_screen/components/featured_buttons.dart';
import 'package:swift_cart/widgets_common/home_buttons.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: search,
                    hintStyle: TextStyle(color: textfieldGrey)),
              ),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 140,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Image
                            .asset(slidersList[index], fit: BoxFit.fill)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                              (index) =>
                              homeButtons(
                                context.screenWidth / 2.5,
                                context.screenHeight * 0.15,
                                index == 0 ? todaydeal : flash,
                                index == 0 ? icTodaysDeal : icFlashDeal,
                                    () {},
                              )),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 140,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      itemCount: secondSlider.length,
                      itemBuilder: (context, index) {
                        return Image
                            .asset(secondSlider[index],
                            fit: BoxFit.fill)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                              (index) =>
                              homeButtons(
                                  context.screenWidth / 3.5,
                                  context.screenHeight * 0.15,
                                  index == 0
                                      ? topCategories
                                      : index == 1
                                      ? brands
                                      : topSellers,
                                  index == 0
                                      ? icTopCategories
                                      : index == 1
                                      ? icBrands
                                      : icTopSeller,
                                      () {})),
                    ),
                    // Featured Categories
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              3,
                                  (index) =>
                                  Column(
                                    children: [
                                      featuredButton(
                                          icon: featuredImages1[index],
                                          title: featuredTitles1[index]),
                                      10.heightBox,
                                      featuredButton(
                                          icon: featuredImages2[index],
                                          title: featuredTitles2[index]),
                                    ],
                                  )).toList()),
                    ),

                    //featured products

                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: redColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct.text.white
                              .fontFamily(bold)
                              .size(18)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  6,
                                      (index) =>
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(imgP1,
                                              width: 150, fit: BoxFit.cover),
                                          10.heightBox,
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
                                      )
                                          .box
                                          .white
                                          .roundedSM
                                          .padding(EdgeInsets.all(8))
                                          .margin(EdgeInsets.symmetric(
                                          horizontal: 4))
                                          .make()),
                            ),
                          ),

                        ],
                      ),
                    ),
                    20.heightBox,
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 140,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      itemCount: slidersList.length,
                      itemBuilder: (context, index) {
                        return Image
                            .asset(slidersList[index],
                            fit: BoxFit.fill)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      },
                    ),

                    //all products
                    20.heightBox,
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300), itemBuilder: (context,
                        index) {
                      return
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Image.asset(imgP5,
                                width: 200,height: 180, fit: BoxFit.cover),
                            const Spacer(),
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
                        ).box
                            .white
                            .roundedSM
                            .padding(EdgeInsets.all(8))
                            .margin(EdgeInsets.symmetric(
                            horizontal: 12))
                            .make();
                    }
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
