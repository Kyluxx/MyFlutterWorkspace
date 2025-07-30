import 'package:flutter/material.dart';

void ctxPop(BuildContext ctx) {
  if (ctx.mounted) {
    Navigator.pop(ctx);
  }
}