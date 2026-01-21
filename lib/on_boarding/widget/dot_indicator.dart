import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class DotIndicator extends StatelessWidget {
  bool active;

  DotIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: active ? 20 : 10,
      height: 10,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: active
            ? context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor
            : context.isLight
            ? AppColors.disableColor
            : AppColors.whiteColor,
      ),
    );
  }
}
