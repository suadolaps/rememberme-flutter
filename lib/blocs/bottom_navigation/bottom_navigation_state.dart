import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex}) : assert(currentIndex != null);

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class ThemeOverviewLoaded extends BottomNavigationState {
  final String text;

  ThemeOverviewLoaded({this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'ThemeOverviewLoaded with text: $text';
}

class JournalOverviewLoaded extends BottomNavigationState {
  final String text;

  JournalOverviewLoaded({this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'JournalOverviewLoaded with text: $text';
}

class HomeOverviewLoaded extends BottomNavigationState {
  final int number;

  HomeOverviewLoaded({this.number});

  @override
  List<Object> get props => [number];

  @override
  String toString() => 'HomeOverviewLoaded with number: $number';
}

class FavouritesOverviewLoaded extends BottomNavigationState {
  final String text;

 FavouritesOverviewLoaded({this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'FavouritesOverviewLoaded with text: $text';
}

class ProfileOverviewLoaded extends BottomNavigationState {
  final String text;

  ProfileOverviewLoaded({this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'ProfileOverviewLoaded with text: $text';
}