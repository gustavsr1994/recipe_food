part of 'menu_selected_bloc.dart';

@immutable
abstract class MenuSelectedEvent {}

class MenuSelect extends MenuSelectedEvent {
  final int? index; 
  MenuSelect({this.index});
}
