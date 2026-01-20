import 'package:easy_localization/easy_localization.dart';
import 'package:evently/on_boarding/model/on_boarding_model.dart';
import 'package:evently/on_boarding/widget/back_button_widget.dart';
import 'package:evently/on_boarding/widget/custom_elevated_button.dart';
import 'package:evently/on_boarding/widget/dot_indicator.dart';
import 'package:evently/on_boarding/widget/skip_button_widget.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../../provider/app_theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/screen_size.dart';

class OnBoardingScreen2 extends StatefulWidget {
  OnBoardingScreen2({super.key});

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  final PageController _pageController = PageController(initialPage: 0);
  List<OnBoardingModel> onBoardingList = [];

  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onBoardingList = [
      OnBoardingModel(
        image: context.isLight
            ? AppAssets.onBoarding2Light
            : AppAssets.onBoarding2Dark,
        title: 'find_events_that_inspire_you',
        description: 'on_boarding2_description',
        buttonText: 'next',
      ),
      OnBoardingModel(
        image: context.isLight
            ? AppAssets.onBoarding3Light
            : AppAssets.onBoarding3Dark,
        title: 'effortless_event_planning',
        description: 'on_boarding3_description',
        buttonText: 'next',
      ),
      OnBoardingModel(
        image: context.isLight
            ? AppAssets.onBoarding4Light
            : AppAssets.onBoarding4Dark,
        title: 'connect_with_friends_share_moments',
        description: 'on_boarding4_description',
        buttonText: 'get_started',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          context.isLight
              ? AppAssets.eventlyLogoLight
              : AppAssets.eventlyLogoDark,
        ),
        leading: Visibility(
          visible: currentIndex > 0,
          child: BackButtonWidget(
            onPressed: () {
              _pageController.animateToPage(
                currentIndex - 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        leadingWidth: 70,
        actionsPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 14),
        actions: [
          Visibility(
            visible: currentIndex != 2,
            child: SkipButtonWidget(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.homeRouteName,
                );
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.04),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        currentIndex = index;
                        setState(() {});
                      },
                      allowImplicitScrolling: false,
                      controller: _pageController,
                      itemBuilder: (context, index) => Image.asset(
                        onBoardingList[index].image,
                        fit: BoxFit.cover,
                      ),
                      itemCount: onBoardingList.length,
                    ),
                  ),
                  Row(
                    children: [
                      DotIndicator(active: currentIndex == 0 ? true : false),
                      DotIndicator(active: currentIndex == 1 ? true : false),
                      DotIndicator(active: currentIndex == 2 ? true : false),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      context.tr(onBoardingList[currentIndex].title),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Text(
                        context.tr(onBoardingList[currentIndex].description),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                switch (currentIndex) {
                  case 0:
                    _pageController.animateToPage(
                      currentIndex + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    break;
                  case 1:
                    _pageController.animateToPage(
                      currentIndex + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    break;
                  case 2:
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.homeRouteName,
                    );
                  default:
                    break;
                }
              },
              text: onBoardingList[currentIndex].buttonText,
            ),
          ],
        ),
      ),
    );
  }
}

/*
PageView.builder(

            itemBuilder: (context, index) =>
                Image.asset(onBoardingList[index].image , fit: BoxFit.fitHeight,),
            itemCount: onBoardingList.length,

          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                context.tr(onBoardingList[index].title),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Text(
                context.tr(onBoardingList[index].description),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )),

 */
