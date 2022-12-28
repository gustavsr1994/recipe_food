import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipes_food_menu/presentation/controllers/bloc/detailrecipe_bloc.dart';
import 'package:recipes_food_menu/presentation/views/main_page.dart';

import 'presentation/controllers/menuselected/menu_selected_bloc.dart';
import 'presentation/controllers/recipe/recipe_bloc.dart';
import 'presentation/controllers/video/video_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipeBloc(),
        ),
        BlocProvider(
          create: (context) => MenuSelectedBloc(),
        ),
        BlocProvider(
          create: (context) => VideoBloc(),
        ),
        BlocProvider(
          create: (context) => DetailrecipeBloc(),
        )
      ],
      child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const MainPage(
            key: Key("value"),
          )),
    );
  }
}
