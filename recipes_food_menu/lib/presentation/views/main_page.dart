import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_food_menu/presentation/common/style/color_palletes.dart';
import 'package:recipes_food_menu/presentation/common/style/text_style.dart';
import 'package:recipes_food_menu/presentation/common/widgets/card/card_list_recipe.dart';
import 'package:recipes_food_menu/presentation/controllers/menuselected/menu_selected_bloc.dart';
import 'package:recipes_food_menu/presentation/controllers/recipe/recipe_bloc.dart';
import 'package:recipes_food_menu/presentation/controllers/video/video_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var listMenu = ['indonesia', 'italy', 'china', 'satay', 'noodle', 'meatball'];
  @override
  void initState() {
    super.initState();
    context.read<MenuSelectedBloc>().add(MenuSelect(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuSelectedBloc, MenuSelectedState>(
      listener: (context, state) {
        if (state is NameSelected) {
          listMenu = state.listCategory!;
          searchRecipe(state.nameSelected!);
        }
      },
      child: DefaultTabController(
        length: listMenu.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorBlack,
            title: Text(
              "Recipe Food",
              style: textStyleLarge(colorFont: colorBlueSky, boldStatus: true),
            ),
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: colorWhite,
                indicatorColor: colorGreenSky,
                labelColor: colorBlueSky,
                labelStyle:
                    textStyleMedium(boldStatus: true, colorFont: colorBlueSky),
                onTap: (value) {
                  searchRecipe(listMenu[value]);
                },
                tabs: [
                  for (var item in listMenu)
                    Tab(
                      text: item.toString().toUpperCase(),
                    )
                ]),
          ),
          body: Container(
            color: colorBlack,
            child: Column(
              children: [
                BlocBuilder<RecipeBloc, RecipeState>(
                  builder: (context, state) {
                    if (state is RecipeSuccess) {
                      return Expanded(
                        flex: 4,
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: [
                            for (var item in state.listRecipe!)
                              CardListRecipe(
                                data: item,
                              )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchRecipe(String keyword){

                  context
                      .read<RecipeBloc>()
                      .add(SearchRecipe(keyword: keyword));
  }
}
