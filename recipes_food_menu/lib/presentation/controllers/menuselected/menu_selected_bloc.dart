import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'menu_selected_event.dart';
part 'menu_selected_state.dart';

class MenuSelectedBloc extends Bloc<MenuSelectedEvent, MenuSelectedState> {
  MenuSelectedBloc() : super(MenuSelectedInitial()) {
    on<MenuSelect>((event, emit) {
      List<String> listCategory = [
        'indonesia',
        'italy',
        'china',
        'satay',
        'noodle',
        'meatball'
      ];
      emit(NameSelected(listCategory: listCategory, nameSelected: listCategory[event.index!], indexSelected: event.index));
    });
  }
}
