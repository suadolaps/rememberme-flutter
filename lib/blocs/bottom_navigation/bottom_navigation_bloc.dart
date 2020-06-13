import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';
import 'package:remember_me/repositories/repositories.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final ThemeRepository themeRepository;
  final FavouritesRepository favouritesRepository;
  final HomeRepository homeRepository;
  final JournalRepository journalRepository;
  final ProfileRepository profileRepository;
  int currentIndex = 0;

  BottomNavigationBloc({this.themeRepository, this.favouritesRepository,
      this.homeRepository, this.journalRepository, this.profileRepository});

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState>
    mapEventToState(BottomNavigationEvent event) async* {
    if (event is PageTapped){
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String data = await _getThemeOverviewData();
        yield ThemeOverviewLoaded(text: data);
      }
      if (this.currentIndex == 1) {
        String data = await _getJournalOverviewData();
        yield JournalOverviewLoaded(text: data);
      }
      if (this.currentIndex == 2) {
        int data = await _getHomeOverviewData();
        yield HomeOverviewLoaded(number: data);
      }
      if (this.currentIndex == 3) {
        String data = await _getFavouritesOverviewData();
        yield FavouritesOverviewLoaded(text: data);
      }
      if (this.currentIndex == 4) {
        String data = await _getProfileOverviewData();
        yield ProfileOverviewLoaded(text: data);
      }
    }
  }

  Future<String> _getThemeOverviewData() async {
    String data = themeRepository.data;
    if (data == null) {
      await themeRepository.fetchData();
      data = themeRepository.data;
    }
    return data;
  }
  Future<String> _getJournalOverviewData() async {
    String data = journalRepository.data;
    if (data == null) {
      await journalRepository.fetchData();
      data = journalRepository.data;
    }
    return data;
  }
  Future<int> _getHomeOverviewData() async {
    int data = homeRepository.data;
    if (data == null) {
      await homeRepository.fetchData();
      data = homeRepository.data;
    }
    return data;
  }
  Future<String> _getFavouritesOverviewData() async {
    String data = favouritesRepository.data;
    if (data == null) {
      await favouritesRepository.fetchData();
      data = favouritesRepository.data;
    }
    return data;
  }
  Future<String> _getProfileOverviewData() async {
    String data = profileRepository.data;
    if (data == null) {
      await profileRepository.fetchData();
      data = profileRepository.data;
    }
    return data;
  }
}