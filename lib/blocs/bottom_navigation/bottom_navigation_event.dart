import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class PageTapped extends BottomNavigationEvent {
  final int index;

  PageTapped({@required this.index}) : assert(index != null);

  @override
  List<Object> get props => [index];

  @override
  String toString() => 'PageTapped : $index';
}