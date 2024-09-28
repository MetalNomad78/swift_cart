import 'package:swift_cart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}){
  return Container(
    decoration: BoxDecoration(
      image: const DecorationImage(image: AssetImage(imgBackground),fit: BoxFit.fill)),
      child:child,
  );
}