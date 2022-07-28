import 'package:flutter/material.dart';
import 'package:quick_order/src/global/progress_bar.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({Key? key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(height: 15.0),
          Text(message! + "Please Wait.."),
        ],
      ),
    );
  }
}
