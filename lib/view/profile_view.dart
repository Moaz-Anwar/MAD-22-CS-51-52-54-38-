import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/constants/app_strings.dart';
import 'package:medicine_delivery/routes/app_routes.dart';
import 'package:medicine_delivery/utils/utils.dart';
import '../constants/app_style.dart';
import '../controllers/profile_controller.dart';
import '../widgets/logout_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return PopScope(
      canPop: false,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Text(
                  AppString.Profile,
                  style: AppStyle.profile25w700(),
                ),
              ),
              body: Obx(() {
                if (controller.userData.isEmpty) {
                  return Center(child: CircularProgressIndicator()); // Loading indicator
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width*0.9,
                        height: MediaQuery.of(context).size.height*0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 3), // Shadow position
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                if (controller.userData['photoUrl'] != null)
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(controller.userData['photoUrl']),
                                    radius: 33,
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${controller.userData['name']}',
                                  style: AppStyle.moawaz25w500(),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Utils().toastMessage(context, 'The request has been sent to the admin');
                                  },
                                  child: Text('Edit Your Info', style: AppStyle.style16w400()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      controller.userData.isNotEmpty
                          ? Column(
                        children: [
                          DetailContainer(
                            text: 'Name:  ${controller.userData['name']}',
                            icon: Icons.arrow_forward_ios_outlined,
                            context: context
                          ),
                          DetailContainer(
                            text: 'Email:  ${controller.userData['email']}',
                            icon: Icons.arrow_forward_ios_outlined,
                            context: context
                          ),
                          DetailContainer(
                            text: 'Phone:  ${controller.userData['phone']}',
                            icon: Icons.arrow_forward_ios_outlined,
                            context: context
                          ),
                        ],
                      )
                          : Center(child: CircularProgressIndicator()),
                      SizedBox(height: 40),
                      Center(
                        child: Button(
                          title: 'Logout',
                        ),
                      ),
                    ],
                  ),
                );
              }),
          )),
    );
  }
}

Widget DetailContainer({required String text, required IconData icon,required BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(top: 13),
    width: MediaQuery.of(context).size.width*0.9,
    padding: EdgeInsets.all(14.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // This pushes the items to opposite ends
      children: [
        Text(
          text,
          style: AppStyle.style16w400(),
        ),
        Icon(icon, size: 27, color: Colors.black26), // Icon at the end
      ],
    ),
  );
}
