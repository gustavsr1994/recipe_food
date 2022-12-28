import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
  Widget build(BuildContext context) {
    return BlocListener<DetailrecipeBloc, DetailrecipeState>(
      listener: (context, state) {
        if (state is DetailRecipeSuccess) {
          dataEntity = state.detailRecipe;
        }
      },
      child: Scaffold(
        body: BlocBuilder<DetailrecipeBloc, DetailrecipeState>(
          builder: (context, state) {
            if (state is DetailRecipeSuccess) {
              return bodySuccess();
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
      ),
    );
  }

  Widget bodySuccess() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height / 4,
          backgroundColor: colorBlack,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              dataEntity!.title!,
              style:
                  textStyleMedium(colorFont: colorGreenSky, boldStatus: true),
            ),
            background: Image.network(
              dataEntity!.imgRecipe!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          Container(
            height: MediaQuery.of(context).size.height,
            color: colorBlack,
            child: ListView(
              children: [
                Text(
                  "${dataEntity!.cookTime} minutes",
                  style: textStyleMedium(
                    colorFont: colorGreenSky,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Ingredients",
                  style: textStyleMedium(colorFont: colorGreenSky),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (var item in dataEntity!.listIngredient!)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Chip(
                            backgroundColor: colorGreenSky,
                            label: Text(
                              item.toUpperCase(),
                              style: textStyleMedium(colorFont: colorBlack),
                            )),
                      )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Step",
                  style: textStyleMedium(colorFont: colorGreenSky),
                ),
                for (var item in dataEntity!.listInstruction!)
                  Card(
                    color: colorGreenSky,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${item.number!}. ${item.step!}",
                        style: textStyleMedium(colorFont: colorBlack),
                      ),
                    ),
                  )
              ],
            ),
          )
        ]))
      ],
    );
  }
}
