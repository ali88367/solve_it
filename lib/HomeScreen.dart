import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solve_it/consts/colors.dart';
import 'package:solve_it/consts/images.dart';
import 'package:solve_it/consts/textstyles.dart';
import 'package:solve_it/main.dart';

import 'advertisments.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.h,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Image.asset('assets/images/pin.png')),
                  SizedBox(width: 10.w,),
                  Text('Direcciones recientes',style: sourceSans400(12, black),),
                  SizedBox(width: 10.w,),

                  SizedBox(
                      height: 6.h,
                      width: 12.w,
                      child: Image.asset(arrow_down)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Balance  ',style: sourceSans400(12, black),),
                  Text('\$248.89 ',style: sourceSans400(12, black),),
                  SizedBox(width: 10.w,),

                  SizedBox(
                      height: 25.h,
                      width: 25.w,
                      child: Image.asset(notifications)),
                ],
              )
            ],
          ),
        ),

            const SizedBox(child: Advertisements()),

          ],
        ),
      ),
    );
  }
}
