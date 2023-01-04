import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:recipes_food_menu/domain/entities/detail_recipe_entity.dart';
import 'package:recipes_food_menu/presentation/common/style/color_palletes.dart';
import 'package:recipes_food_menu/presentation/common/style/text_style.dart';
import 'package:recipes_food_menu/presentation/controllers/bloc/detailrecipe_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailRecipePage extends StatefulWidget {
  int? idRecipe;
  DetailRecipePage({this.idRecipe});

  @override
  State<DetailRecipePage> createState() => _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage> {
  DetailRecipeEntity? dataEntity = DetailRecipeEntity();
  @override
  void initState() {
    super.initState();
    context
        .read<DetailrecipeBloc>()
        .add(InitialDetail(idRecipe: widget.idRecipe));
  }

  @override
  void dispose() {
    super.dispose();
    DetailrecipeBloc().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailrecipeBloc, DetailrecipeState>(
        builder: (context, state) {
          if (state is DetailRecipeSuccess) {
            return bodySuccess(state.detailRecipe!);
          } else {
            return ListView(
              children: [
                SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: Shimmer.fromColors(
                    baseColor: colorBlueSky,
                    highlightColor: colorGreenSky,
                    child: Container(
                      color: colorWhite,
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  Widget bodySuccess(DetailRecipeEntity dataEntity) {
    return Container(
      color: colorBlack,
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: colorBlack,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            dataEntity.imgRecipe!,
                          ),
                          fit: BoxFit.fill))),
              Positioned(
                top: 20,
                left: 15,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: colorBlack,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: colorGreenSky,
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(color: colorGreenSky)),
              child: Text(
                dataEntity.title!,
                textAlign: TextAlign.center,
                maxLines: 2,
                style:
                    textStyleLarge(boldStatus: true, colorFont: colorBlueSky),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Cook",
                      style: textStyleLarge(
                          boldStatus: true, colorFont: colorBlueSky),
                    ),
                    Text(
                      "${dataEntity.cookTime} min",
                      style: textStyleMedium(colorFont: colorBlueSky),
                    )
                  ],
                ),
                VerticalDivider(
                  color: colorGreenSky,
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Healhty Score",
                      style: textStyleLarge(
                          boldStatus: true, colorFont: colorBlueSky),
                    ),
                    Text(
                      "${dataEntity.healthyScore}",
                      style: textStyleMedium(colorFont: colorBlueSky),
                    )
                  ],
                ),
                VerticalDivider(
                  color: colorGreenSky,
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Serve",
                      style: textStyleLarge(
                          boldStatus: true, colorFont: colorBlueSky),
                    ),
                    Text(
                      "${dataEntity.serve}",
                      style: textStyleMedium(colorFont: colorBlueSky),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Step",
            style: textStyleMedium(colorFont: colorGreenSky),
          ),
          dataEntity.listInstruction == null
              ? Center(child: Text("Sorry, No Data", style: textStyleXtraLarge(colorFont: colorBlueSky, boldStatus: true),))
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var item in dataEntity.listInstruction!)
                      Card(
                        elevation: 2,
                        color: colorBlack,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(color: colorGreenSky)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${item.number!}. ${item.step!}",
                            style: textStyleMedium(colorFont: colorBlueSky),
                          ),
                        ),
                      )
                  ],
                )
        ],
      ),
    );
  }
}
