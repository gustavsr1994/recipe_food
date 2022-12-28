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
          context
              .read<RecipeBloc>()
              .add(SearchRecipe(keyword: state.nameSelected));
          context
              .read<VideoBloc>()
              .add(GetListVideo(keyword: state.nameSelected));
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
                  context
                      .read<RecipeBloc>()
                      .add(SearchRecipe(keyword: listMenu[value]));

                  context
                      .read<VideoBloc>()
                      .add(GetListVideo(keyword: listMenu[value]));
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
                          mainAxisSpacing: 4,
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
                BlocBuilder<VideoBloc, VideoState>(
                  builder: (context, state) {
                    if (state is VideoSuccess) {
                      return Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                "Video",
                                style: textStyleMedium(
                                    boldStatus: true, colorFont: colorBlueSky),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (var item in state.listVideo!)
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                item.thumbnail!,
                                                errorListener: () => Icon(
                                                  Icons.error,
                                                  color: colorBlueSky,
                                                ),
                                              ),
                                              fit: BoxFit.cover)),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
