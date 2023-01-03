import 'package:flutter/material.dart';

class ShowSnackBar {
  void showSnackBar(
    BuildContext context,
    String title, {
    SnackBarAction action,
    Duration duration = const Duration(seconds: 1),
    bool noAction = false,
  }) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: duration,
          elevation: 0,
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          content: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          action: 
                  SnackBarAction(
                    textColor: Colors.white,
                    label: "Got it",
                    onPressed: () {},
                  ),
        ),
      );
    } catch (e) {
      print('Failed to show Snackbar with title:$title');
    }
  }
}