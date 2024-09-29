import 'package:swift_cart/consts/consts.dart';

Widget featuredButton({String? title,icon}){
  return Row(
    children: [

        Image.asset(icon,width:60,fit: BoxFit.fill),
        10.widthBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make(),

    ],
  ).box.white.rounded.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(4)).outerShadowSm.make();
}