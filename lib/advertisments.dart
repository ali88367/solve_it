import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:solve_it/consts/colors.dart';

class Advertisements extends StatelessWidget {
  const Advertisements({super.key});

  @override
  Widget build(BuildContext context) {
    final AdvertisementController advertisementController = Get.put(AdvertisementController());

    // List of local asset images (replace with your actual asset paths)
    final List<String> imageUrls = [
      'assets/images/ad.png',
      'assets/images/ad.png',
      'assets/images/ad.png',
    ];

    // Shimmer loading effect when no images are available
    if (imageUrls.isEmpty) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 180.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
        ),
      );
    }

    return Column(
      children: [
        CarouselSlider(
          items: imageUrls.map((imagePath) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(16.r),

                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                    onError: (exception, stackTrace) => const AssetImage('assets/images/fallback.png'),
                  ),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 180.h,
            viewportFraction: 0.95,
            autoPlay: imageUrls.length > 1,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              advertisementController.currentIndex.value = index;
            },
          ),
        ),
        SizedBox(height: 12.h),
        Obx(
              () => AnimatedSmoothIndicator(
            activeIndex: advertisementController.currentIndex.value,
            count: imageUrls.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8.h,
              dotWidth: 8.w,
              activeDotColor: Colors.black,
              dotColor: Colors.grey[400]!,
              spacing: 6.w,
              expansionFactor: 3,
            ),
          ),
        ),
      ],
    );
  }
}

class AdvertisementController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<String> advertisements = <String>[].obs;
}