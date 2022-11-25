import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.value, required this.child});
  final bool value;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: value,
      progressIndicator: const CircularProgressIndicator(
        color: Color(0xFFFE904B),
      ),
      child: child,
    );
  }
}
