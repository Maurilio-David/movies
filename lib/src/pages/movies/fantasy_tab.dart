import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/src/controllers/home_controller.dart';
import 'package:movies/src/pages/commons_widgets/card_movie_widget.dart';
import 'package:movies/src/routes/app_pages.dart';

class FantasyTab extends GetView<HomeController> {
  const FantasyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: controller.detailsMoviesFantasy.length,
          itemBuilder: (context, index) => OutlinedButton(
            style:
                OutlinedButton.styleFrom(elevation: 0, side: BorderSide.none),
            onPressed: () {
              controller.castMovie(controller.detailsMoviesActions[index].id!);
              Get.toNamed(Routes.details,
                  arguments: controller.detailsMoviesFantasy[index]);
            },
            child: CardMovie(movie: controller.detailsMoviesFantasy[index]),
          ),
        ));
  }
}