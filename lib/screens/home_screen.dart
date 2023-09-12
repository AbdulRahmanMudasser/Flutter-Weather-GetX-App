import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/widgets/header.dart';
import '../config/app_size.dart';
import '../controllers/global_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call global controller or inject dependency
  // dependency injection is just calling a class instance
  // in another class
  GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
    // permanent is set to true, which means that this controller will not
    // be destroyed when current page is removed
  );

  final AppSize appSizeController = Get.put(AppSize());

  @override
  Widget build(BuildContext context) {
    appSizeController.init();

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    SizedBox(
                      height: AppSize.baseSize * 2,
                    ),
                    Header(),
                  ],
                ),
        ),
      ),
    );
  }
}