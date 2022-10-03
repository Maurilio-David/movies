import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/src/controllers/home_controller.dart';
import 'package:movies/src/pages/commons_widgets/card_movie_widget.dart';

class ActionTab extends GetView<HomeController> {
  //final List listagem;
  const ActionTab({
    Key? key,
    /* required this.listagem */
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: controller.detailsMovies.length,
          itemBuilder: (context, index) =>
              CardMovie(movie: controller.detailsMovies[index]),
        ));
  }
}
