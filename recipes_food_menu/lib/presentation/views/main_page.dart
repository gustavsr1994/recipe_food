import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_food_menu/presentation/common/style/color_palletes.dart';
import 'package:recipes_food_menu/presentation/common/style/text_style.dart';
import 'package:recipes_food_menu/presentation/controllers/recipe/recipe_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<RecipeBloc>().add(SearchRecipe(keyword: "rendang"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBlack,
        title: Text(
          "Recipe Food",
          style: textStyleLarge(colorFont: colorBlueSky, boldStatus: true),
        ),
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeSuccess) {
            return ListView.builder(
              itemCount: state.recipeEntity!.listEntity!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: state.recipeEntity!.listEntity![index].image!.replaceAll("https", "http"),
                        fit: BoxFit.cover,
                        height: 100,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Text(state.recipeEntity!.listEntity![index].title!)
                    ],
                  ),
                );
              },
            );
          } else if (state is RecipeError) {
            return Text(state.message!);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
