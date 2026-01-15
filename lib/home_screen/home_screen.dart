import 'package:evently/home_screen/tabs/fav_tab/favorite_tab.dart';
import 'package:evently/home_screen/tabs/home_tab/home_tab.dart';
import 'package:evently/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 30, color: AppColors.whiteColor),
      ),

      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          builtBottomNavigationBarItem(
            label: AppLocalizations.of(context)!.home,
            index: 0,
            selectedIcon: AppAssets.homeSelectedIcon,
            unselectedIcon: AppAssets.homeUnselectedIcon,
          ),
          builtBottomNavigationBarItem(
            label: AppLocalizations.of(context)!.favorite,
            index: 1,
            selectedIcon: AppAssets.favoriteSelectedIcon,
            unselectedIcon: AppAssets.favoriteUnselectedIcon,
          ),
          builtBottomNavigationBarItem(
            label: AppLocalizations.of(context)!.profile,
            index: 2,
            selectedIcon: AppAssets.profileSelectedIcon,
            unselectedIcon: AppAssets.profileUnselectedIcon,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem({
    required String label,

    required int index,
    required String selectedIcon,
    required String unselectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        width: 30,

        selectedIndex == index ? selectedIcon : unselectedIcon,
        colorFilter: ColorFilter.mode(
          selectedIndex == index
              ? AppColors.mainDarkModeColor
              : AppColors.disableColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
