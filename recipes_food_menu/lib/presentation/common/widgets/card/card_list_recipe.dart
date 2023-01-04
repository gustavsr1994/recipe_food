import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recipes_food_menu/domain/entities/recipe_entity.dart';
import 'package:recipes_food_menu/presentation/common/style/color_palletes.dart';
import 'package:recipes_food_menu/presentation/common/style/text_style.dart';
import 'package:recipes_food_menu/presentation/views/detail_recipe_page.dart';

class CardListRecipe extends StatelessWidget {
  final RecipeEntity? data;
  CardListRecipe({this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailRecipePage(
        idRecipe: data!.id,
      )),
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 15,
        color: colorBlack,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(color: colorGreenSky)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7.5,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        data!.image!,
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data!.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyleMedium(
                        boldStatus: true, colorFont: colorBlueSky),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      SvgPicture.asset('lib/presentation/shared/icon/ic_clock.svg', color: colorGreenSky, height: 18,),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${data!.readyInMinutes!} min',
                        style: textStyleMedium(
                            boldStatus: false, colorFont: colorBlueSky),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
