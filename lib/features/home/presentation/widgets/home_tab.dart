import 'dart:async';

import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/features/home/presentation/widgets/announcements_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_item.dart';
import 'package:ecommerce/features/home/presentation/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab();

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;
  final List<String> _announcementsImagesPaths = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnnouncementsSection(
            imagesPaths: _announcementsImagesPaths,
            currentIndex: _currentIndex,
            timer: _timer,
          ),
          Column(
            children: [
              CustomSectionBar(
                sectionName: 'Categories',
                onViewAllClicked: () {},
              ),
              SizedBox(
                height: 270.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => const CategoryItem(),
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ],
      ),
    );
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(
        () => _currentIndex =
            (_currentIndex + 1) % _announcementsImagesPaths.length,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
