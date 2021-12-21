import 'package:applications/features/applications/data/datasources/api_services.dart';
import 'package:applications/features/applications/presentation/getx/controllers/applications_controller.dart';
import 'package:applications/features/applications/presentation/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends StatelessWidget {
  ApplicationPage({Key? key}) : super(key: key);

  final applicationController = Get.find<ApplicationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Widgets().text("Applications", Colors.black, 20),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => ListView.builder(
                          itemCount: applicationController
                              .applications.value.data!.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                applicationController.applicationItemClicked(applicationController
                                    .applications.value.data![index]);
                              },
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: Get.width / 2,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          child: CachedNetworkImage(
                                            imageUrl: ApiServices().baseURL +
                                                applicationController
                                                    .applications
                                                    .value
                                                    .data![index]
                                                    .logoImg!,
                                            fit: BoxFit.cover,
                                          )),
                                    )),
                                Widgets().text(
                                    applicationController.applications.value
                                        .data![index].applicantName!,
                                    Colors.deepOrange,
                                    18),
                                const SizedBox(
                                  height: 16,
                                )
                              ],
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
