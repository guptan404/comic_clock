import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ElevatedIcon (BuildContext context, Icon icon, double elevation) {
  return Transform.translate(
    offset: Offset(0.0, elevation),
    child: icon,
  );
}