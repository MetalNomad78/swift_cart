import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:swift_cart/consts/consts.dart';
import 'package:swift_cart/consts/lists.dart';
import 'package:swift_cart/controllers/auth_controller.dart';
import 'package:swift_cart/controllers/profile_controller.dart';
import 'package:swift_cart/services/firestore_services.dart';
import 'package:swift_cart/views/auth_screen/login_screen.dart';
import 'package:swift_cart/views/profile_screen/components/details_card.dart';
import 'package:swift_cart/views/profile_screen/edit_screen.dart';
import 'package:swift_cart/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor)));
                  } else {
                    var data = snapshot.data!.docs[0];

                    return SafeArea(
                      child: Column(
                        children: [
                          // Edit profile button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.edit,
                                  color: whiteColor,
                                )).onTap(() {
                              controller.nameController.text = data['name'];
                              Get.to(() => EditScreen(data: data));
                            }),
                          ),

                          // User details section
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                data['imageUrl'] == ''
                                    ? Image.asset(imgProfile2,
                                            width: 130, fit: BoxFit.cover)
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make()
                                    : Image.network(data['imageUrl'],
                                            width: 130, fit: BoxFit.cover)
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make(),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .white
                                        .make(),
                                    const SizedBox(height: 5),
                                    "${data['email']}".text.white.make(),
                                  ],
                                )),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                    color: Colors.white,
                                  )),
                                  onPressed: () async {
                                    await Get.put(AuthController())
                                        .signoutMethod(context);
                                    Get.offAll(() => LoginScreen());
                                  },
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
                                  count: "${data['cart_count']}",
                                  title: "in your cart",
                                  width: context.screenWidth / 3.4),
                              detailsCard(
                                  count: "${data['wishlist_count']}",
                                  title: "in your Wishlist",
                                  width: context.screenWidth / 3.4),
                              detailsCard(
                                  count: "${data['order_count']}",
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
                                        leading: Image.asset(
                                          profileButtonsIcon[index],
                                          width: 22,
                                        ),
                                        title: profileButtonList[index]
                                            .text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make(),
                                      );
                                    })
                                .box
                                .rounded
                                .white
                                .margin(const EdgeInsets.all(12))
                                .padding(
                                    const EdgeInsets.symmetric(horizontal: 16))
                                .shadowSm
                                .make()
                                .box
                                .color(redColor)
                                .make(),
                          )
                        ],
                      ),
                    );
                  }
                })));
  }
}
