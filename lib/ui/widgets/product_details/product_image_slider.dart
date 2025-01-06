import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ProductIamgeSlider extends StatelessWidget {
  final List<String> sliders;

  ProductIamgeSlider({Key? key, required this.sliders}) : super(key: key);

  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> CurrentSelectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              height: 230,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                CurrentSelectedIndex.value = index;
              }),
          items: sliders.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(slider),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 5,
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ValueListenableBuilder(
                valueListenable: CurrentSelectedIndex,
                builder: (context, updateValue, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 6; i++)
                        Container(
                          margin: EdgeInsets.all(3),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: i == CurrentSelectedIndex.value
                                ? AppColor.primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: i == CurrentSelectedIndex.value
                                  ? AppColor.primaryColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
