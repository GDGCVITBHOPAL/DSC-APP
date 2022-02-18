import 'package:animate_do/animate_do.dart';
import 'package:dsc_client/authentication/SignInCheck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class Skip extends StatelessWidget {
  int cp;
  int np;
  Skip(this.cp, this.np);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(seconds: 1),
      child: Container(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: cp != np - 1
                ? () => Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: SignInCheck()))
                : null,
            child: cp != np - 1
                ? Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  )
                : Text("")),
      ),
    );
  }
}
