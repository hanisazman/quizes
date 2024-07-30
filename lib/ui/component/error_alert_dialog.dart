import 'package:flutter/material.dart';

import '../../core/exports.dart';

class ErrorAlertDialogWidget extends StatelessWidget {
  const ErrorAlertDialogWidget({super.key, required this.errorMsg,});

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('An Error Occured!'),
        content: Text(errorMsg),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Okay',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ))
        ],
      );
  }
}