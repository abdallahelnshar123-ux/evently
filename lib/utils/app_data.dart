import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppDataClass {
  /// add event Lists
  final List<String> _eventsNameList = [
    'sport',
    'birthday',
    'meeting',
    'gaming',
    'workshop',
    'book_club',
    'exhibition',
    'holiday',
    'eating',
  ];

  List<String> get eventsNameList {
    return _eventsNameList;
  }

  final List<IconData> _selectedIcons = [
    MingCute.football_fill,
    Icons.cake,
    Icons.group,
    Icons.videogame_asset_rounded,
    Icons.group_work,
    Bootstrap.book_fill,
    Clarity.image_gallery_solid,
    Clarity.on_holiday_solid,
    Icons.fastfood,
  ];

  List<IconData> get selectedIcons {
    return _selectedIcons;
  }

  final List<IconData> _unselectedIcons = [
    MingCute.football_line,
    Icons.cake_outlined,
    Icons.group_outlined,
    Icons.videogame_asset_outlined,
    Icons.group_work_outlined,
    Bootstrap.book,
    Clarity.image_gallery_line,
    Clarity.on_holiday_line,
    Icons.fastfood_outlined,
  ];

  List<IconData> get unselectedIcons {
    return _unselectedIcons;
  }

  /// home Lists

  final List<String> _homeEventsNameList = [
    'all',
    'sport',
    'birthday',
    'meeting',
    'gaming',
    'workshop',
    'book_club',
    'exhibition',
    'holiday',
    'eating',
  ];

  List<String> get homeEventsNameList {
    return _homeEventsNameList;
  }

  final List<IconData> _homeSelectedIcons = [
    Icons.window,
    MingCute.football_fill,
    Icons.cake,
    Icons.group,
    Icons.videogame_asset_rounded,
    Icons.group_work,
    Bootstrap.book_fill,
    Clarity.image_gallery_solid,
    Clarity.on_holiday_solid,
    Icons.fastfood,
  ];

  List<IconData> get homeSelectedIcons {
    return _homeSelectedIcons;
  }

  final List<IconData> _homeUnselectedIcons = [
    Icons.wind_power_outlined,
    MingCute.football_line,
    Icons.cake_outlined,
    Icons.group_outlined,
    Icons.videogame_asset_outlined,
    Icons.group_work_outlined,
    Bootstrap.book,
    Clarity.image_gallery_line,
    Clarity.on_holiday_line,
    Icons.fastfood_outlined,
  ];

  List<IconData> get homeUnselectedIcons {
    return _homeUnselectedIcons;
  }
}
