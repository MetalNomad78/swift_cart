import 'package:get/get.dart';
import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/consts/lists.dart';
import 'package:swift_cart/views/category_screen/category_details.dart';
import 'package:swift_cart/widgets_common/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,mainAxisExtent: 200,crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(categoriesImages[index],height: 120,width: 200,fit: BoxFit.cover),
                  10.heightBox,
                  "${categoriesList[index]}".text.color(darkFontGrey).align(TextAlign.center).make(),
                ],
              ).box.white.clip(Clip.antiAlias).outerShadowSm.make().onTap((){
                Get.to(()=>CategoryDetails(title:categoriesList[index]));
              });
            }),
      ),
    ));
  }
}
