import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/src/controllers/home_controller.dart';
import 'package:movies/src/pages/commons_widgets/card_movie_widget.dart';

class ComedyTab extends GetView<HomeController> {
  const ComedyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: controller.detailsMoviesComedy.length,
          itemBuilder: (context, index) =>
              CardMovie(movie: controller.detailsMoviesComedy[index]),
        ));
  }
}
