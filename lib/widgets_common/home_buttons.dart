import 'package:swift_cart/consts/consts.dart';

Widget homeButtons(width,height,title,icon,onPress) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset(
          icon,
          width: 26,
        ),
        10.heightBox,
        title.toString().text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}
