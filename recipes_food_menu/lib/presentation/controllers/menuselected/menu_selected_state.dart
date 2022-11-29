part of 'menu_selected_bloc.dart';

@immutable
abstract class MenuSelectedState {}

class MenuSelectedInitial extends MenuSelectedState {

}
class NameSelected extends MenuSelectedState {
  final List<String>? listCategory; 
  final String? nameSelected;
  final int? indexSelected;
  NameSelected({this.listCategory, this.nameSelected, this.indexSelected});
}