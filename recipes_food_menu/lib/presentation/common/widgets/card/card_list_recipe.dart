import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes_food_menu/domain/entities/recipe_entity.dart';
import 'package:recipes_food_menu/presentation/common/style/color_palletes.dart';
import 'package:recipes_food_menu/presentation/common/style/text_style.dart';

class CardListRecipe extends StatelessWidget {
  final RecipeEntity? data;
  CardListRecipe({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              data!.image!,
            ),
            fit: BoxFit.cover
          )),
      height: 170,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.black.withOpacity(.6),
              ),
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: colorBlueSky,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${data!.readyInMinutes!} minutes',
                        style: textStyleSmall(
                            boldStatus: false, colorFont: colorBlueSky),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
