import 'package:flutter/material.dart';
import 'package:suitmedia_submission/controller/user_controller.dart';
import 'package:suitmedia_submission/ui/widgets/button_custom.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';

class SecondScreenPage extends StatefulWidget {
  final String userWelcomeName;

  const SecondScreenPage({super.key, required this.userWelcomeName});

  @override
  State<SecondScreenPage> createState() => _SecondScreenPageState();
}

class _SecondScreenPageState extends State<SecondScreenPage> {
  final userStateController = Get.put(UserController());
  String welcomeUserName = '';

  @override
  void initState() {
    super.initState();
    welcomeUserName = Get.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Second Screen'),
        leading: GestureDetector(
          child: const Icon(Icons.chevron_left),
          onTap: (){
            Get.back();
          },
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          // Welcome Text
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: regular
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  welcomeUserName,
                  style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold
                  ),
                ),
              ],
            ),
          ),

          // Selected User Name
          Obx((){
            final selectedUserName = userStateController.selectedUserName;

            return Center(
              child: Text(
                selectedUserName ?? 'Selected User Name', // Pass the data to this text
                style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold
                ),
              ),
            );
          }),

          // Button Choose a User
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, bottom: 10),
            child: FilledButtonCustom(
                width: double.infinity,
                height: 50,
                label: 'Choose a User',
                onTap: (){
                  Get.toNamed('/third');
                }
            ),
          ),
        ],
      ),
    );
  }
}
