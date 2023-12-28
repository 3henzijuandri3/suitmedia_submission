import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_submission/controller/user_controller.dart';
import 'package:suitmedia_submission/ui/widgets/card_custom.dart';

import '../../shared/theme.dart';

class ThirdScreenPage extends StatefulWidget {
  const ThirdScreenPage({super.key});

  @override
  State<ThirdScreenPage> createState() => _ThirdScreenPageState();
}

class _ThirdScreenPageState extends State<ThirdScreenPage> {
  final userStateController = Get.put(UserController());
  final ScrollController scrollController = ScrollController();

  bool isRefreshing = false;

  void onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (maxScroll == currentScroll && userStateController.hasMore.value) {
      userStateController.fetchListUser();
    }
  }

  Future onRefresh() async {
    setState(() {
      isRefreshing = true;
    });

    await userStateController.refreshUser();

    setState(() {
      isRefreshing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    userStateController.fetchListUser();
    scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: GestureDetector(
          child: const Icon(Icons.chevron_left),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: GetX(
        init: userStateController,
        builder: (controller) {
          final listUser = controller.listUser;

          return RefreshIndicator(
            onRefresh: onRefresh,

            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(22),

              itemCount: controller.hasMore.value
                  ? listUser.length + 1
                  : listUser.length,

              itemBuilder: (context, index) {
                if (index < listUser.length) {
                  return GestureDetector(
                    onTap: () {
                      controller.selectUser(listUser[index]!);
                      Get.snackbar(
                        'User Selected',
                        "You selected ${listUser[index]!.firstName.toString()} ${listUser[index]!.lastName.toString()}",
                        colorText: Colors.white,
                        backgroundColor: Colors.green,
                        icon: Icon(Icons.person_add, color: whiteColor, size: 26),
                      );
                    },

                    child: UserCardCustom(
                      imgUrl: listUser[index]!.avatar.toString(),
                      firstName: listUser[index]!.firstName.toString(),
                      lastName: listUser[index]!.lastName.toString(),
                      email: listUser[index]!.email.toString(),
                    ),
                  );

                } else if (controller.hasMore.value) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isRefreshing
                        ?
                    const SizedBox.shrink()
                        :
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        },
      ),
    );
  }
}





















