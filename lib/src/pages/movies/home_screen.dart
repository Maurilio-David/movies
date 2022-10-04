import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/controllers/home_controller.dart';
import 'package:movies/src/pages/commons_widgets/card_movie_widget.dart';
import 'package:movies/src/pages/movies/action_tab.dart';
import 'package:movies/src/pages/movies/adventure_tab.dart';
import 'package:movies/src/pages/movies/comedy_tab.dart';
import 'package:movies/src/pages/movies/fantasy_tab.dart';
import 'package:movies/src/pages/movies/widgets/custom_text_field.dart';
import 'package:movies/src/pages/movies/widgets/custon_tab_label.dart';
import 'package:movies/src/routes/app_pages.dart';
import 'package:movies/src/theme/app_theme.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Filmes',
          style: GoogleFonts.montserrat(
            color: gray,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Obx(
          () => Column(
            children: [
              //Campo de busca
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextField(
                  icon: Icons.search,
                  label: 'Pesquise filmes',
                  controller: controller.queryController.value,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.showTab.value = true;
                    } else {
                      controller.showTab.value = false;
                      controller.searchMovie(value);
                    }
                  },
                ),
              ),
              Visibility(
                visible: controller.loading.value,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: darkBlue,
                  ),
                ),
              ),
              Visibility(
                  visible:
                      !controller.showTab.value && !controller.loading.value,
                  child: controller.detailsSearch.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: controller.detailsSearch.length,
                            itemBuilder: (context, index) => OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  elevation: 0, side: BorderSide.none),
                              onPressed: () {
                                controller.castMovie(
                                    controller.detailsSearch[index].id!);
                                Get.toNamed(Routes.details,
                                    arguments: controller.detailsSearch[index]);
                              },
                              child: CardMovie(
                                  movie: controller.detailsSearch[index]),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            'Nenhum filme encontrado',
                            style: GoogleFonts.montserrat(
                              color: gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
              // Tabview
              Visibility(
                visible: controller.showTab.value,
                child: Expanded(
                  child: DefaultTabController(
                    initialIndex: controller.label.value,
                    length: 4,
                    child: Scaffold(
                        backgroundColor: white,
                        appBar: PreferredSize(
                          preferredSize: const Size.fromHeight(65),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: TabBar(
                              padding: const EdgeInsets.all(0),
                              indicatorColor: Colors.transparent,
                              indicatorPadding: EdgeInsets.zero,
                              labelPadding: EdgeInsets.zero,
                              labelColor: white,
                              unselectedLabelColor: darkBlue,
                              indicatorSize: TabBarIndicatorSize.label,
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                              onTap: (value) {
                                controller.label.value = value;
                              },
                              tabs: [
                                CustomTabLabel(
                                  label: 'Ação',
                                  position: 0,
                                  positionAtual: controller.label.value,
                                ),
                                CustomTabLabel(
                                  label: 'Aventura',
                                  position: 1,
                                  positionAtual: controller.label.value,
                                ),
                                CustomTabLabel(
                                  label: 'Fantasia',
                                  position: 2,
                                  positionAtual: controller.label.value,
                                ),
                                CustomTabLabel(
                                  label: 'Comédia',
                                  position: 3,
                                  positionAtual: controller.label.value,
                                ),
                              ],
                            ),
                          ),
                        ),
                        body: const TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            ActionTab(),
                            AdventureTab(),
                            FantasyTab(),
                            ComedyTab(),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
