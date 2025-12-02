import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_cart_mart/models/banner_model.dart';
import 'package:click_cart_mart/util/app_images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BannerModel> banners = [
      BannerModel(id: 1, photo: AppImages.bannerBeauti),
      BannerModel(id: 2, photo: AppImages.bannerFragrence),
      BannerModel(id: 3, photo: AppImages.bannerJewel),
      BannerModel(id: 4, photo: AppImages.bannerShirt),
      BannerModel(id: 5, photo: AppImages.bannerShoes),
      BannerModel(id: 6, photo: AppImages.bannerWshirt),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: Get.width,
          height: Get.width * 0.4,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() => currIndex = index);
              },
            ),
            itemCount: banners.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    banners[index].photo ?? "",
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: banners.map((banner) {
            int index = banners.indexOf(banner);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 8,
              width: index == currIndex ? 25 : 8,
              decoration: BoxDecoration(
                color: index == currIndex
                    ? Colors.black
                    : Colors.grey.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(100),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
