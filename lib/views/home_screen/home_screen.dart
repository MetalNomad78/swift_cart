import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/consts/lists.dart';
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
                        return Image.asset(slidersList[index], fit: BoxFit.fill)
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
                              (index) => homeButtons(
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
                        return Image.asset(secondSlider[index], fit: BoxFit.fill)
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
                              (index) => homeButtons(
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
