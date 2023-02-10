import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget container(name,price,currency,context)
{
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
      child: Container(
      height: 6.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15,
                offset: Offset(0,0)
            )
          ],
          borderRadius: BorderRadius.circular(15)
      ),
      alignment: Alignment.center,
      child: Text(
        "1 $name  =  $price $currency",
        style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}