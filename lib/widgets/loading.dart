import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(250, 250, 250, 1),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset("assets/images/loader.gif", height: 120, fit: BoxFit.cover,))
      ),
    );
  }
}