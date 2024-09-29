import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/consts/lists.dart';
import 'package:swift_cart/views/profile_screen/components/details_card.dart';
import 'package:swift_cart/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [

                // Edit profile button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.edit, color: whiteColor,)),
                ),

                // User details section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Image.asset(imgProfile2, width: 130, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make(),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Dummy User".text
                                  .fontFamily(semibold)
                                  .white
                                  .make(),
                              const SizedBox(height: 5),
                              "customer@example.com".text.white.make(),
                            ],
                          )),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.white,
                            )
                        ),
                        onPressed: () {},
                        child: logut.text
                            .fontFamily(semibold)
                            .white
                            .make(),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    detailsCard(
                        count: "00",
                        title: "in your cart",
                        width: context.screenWidth / 3.4),
                    detailsCard(
                        count: "00",
                        title: "in your Wishlist",
                        width: context.screenWidth / 3.4),
                    detailsCard(
                        count: "00",
                        title: "in your orders", // Changed title here
                        width: context.screenWidth / 3.4),
                  ],
                ),

                // Buttons Section
                SizedBox(
                  height: 235,
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: lightGrey,
                        );
                      },
                      itemCount: profileButtonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.asset(profileButtonsIcon[index],width: 22,),
                          title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                        );
                      }).box.rounded.white.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
                )
              ],
            ),
          ),
        ));
  }
}
