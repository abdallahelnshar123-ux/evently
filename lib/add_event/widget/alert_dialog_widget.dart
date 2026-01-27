import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String errorMessage;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        context.tr(title),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.tr('ok'),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
      content: Text(
        context.tr(errorMessage),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
