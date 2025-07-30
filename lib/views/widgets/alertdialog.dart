import 'package:flutter/material.dart';

class CAlert extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool showCancel;
  final bool barrierDismissible;

  const CAlert({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'OK',
    this.cancelText = 'Cancel',
    this.onConfirm,
    this.onCancel,
    this.showCancel = false,
    this.barrierDismissible = true,
  });

  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(message),
      actions: [
        if (showCancel)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (onCancel != null) onCancel!();
            },
            child: Text(cancelText ?? 'Cancel'),
          ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (onConfirm != null) onConfirm!();
          },
          child: Text(confirmText),
        ),
      ],
    );
  }
}
