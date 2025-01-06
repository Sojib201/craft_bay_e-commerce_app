import 'package:carousel_slider/carousel_slider.dart';
import 'package:craft_bay/data/models/ProductSliderModel.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  HomeBannerSlider({Key? key, required this.productSliderModel}) : super(key: key);

  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> CurrentSelectedIndex = ValueNotifier(0);
  final ProductSliderModel productSliderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, _) {
                CurrentSelectedIndex.value = index;
              }),
          items: productSliderModel.data?.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.primaryColor.withOpacity(0),
                  image: DecorationImage(image: NetworkImage(i.image!),),),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 5,
        ),
        ValueListenableBuilder(
          valueListenable: CurrentSelectedIndex,
          builder: (context, updateValue, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < (productSliderModel.data!.length); i++)
                  Container(
                    margin: EdgeInsets.all(3),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: i == CurrentSelectedIndex.value
                          ? AppColor.primaryColor
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: i == CurrentSelectedIndex.value
                            ? AppColor.primaryColor
                            : Colors.grey,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
