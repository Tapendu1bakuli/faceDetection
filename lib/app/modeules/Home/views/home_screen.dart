import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../device_manager/screen_constants.dart';
import '../../../../utils/colors/app_colors.dart';
import '../controller/home_controller.dart';
import 'drawer_data_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    Uint8List bytes;
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                double slide =
                    rightSlide * controller.animationController.value +
                        ScreenConstant.defaultHeightFifteen;
                double scale =
                    1.1 - (controller.animationController.value * 0.3);
                return Stack(
                  children: [
                    const Scaffold(
                      backgroundColor: CustomColor.primaryBlue,
                      body: DrawerDataScreen(),
                    ),
                    Transform(
                      transform: Matrix4.identity()
                        ..translate(slide)
                        ..scale(scale),
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: ScreenConstant.defaultWidthThirty),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.secondaryBlue,
                              spreadRadius: 30,
                              blurRadius: 50,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Scaffold(
                            body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),onPressed: (){}, child: const Text("Face Detection",style: TextStyle(color: Colors.black),))),
                            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),onPressed: (){}, child: const Text("Video Stream",style: TextStyle(color: Colors.black),)),
                          ],
                        )),
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
