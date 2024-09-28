import 'package:swift_cart/consts/consts.dart';

Widget ourButton({onPress,color,textColor,title}){
  return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor:color,
        padding: EdgeInsets.all(12),


      ),
      child: title.toString().text.white.color(textColor).fontFamily(bold).make());
}