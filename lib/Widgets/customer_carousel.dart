import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/Tv_series_model.dart';
import 'package:my_app/Widgets/landing_card.dart';
import 'package:my_app/common/utils.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.data,
    required this.backgroundPrimary,
  });
  final TvSeriesModel data;
   final Color backgroundPrimary;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var carouselOptions = CarouselOptions(
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      aspectRatio: 16 / 9,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          var url = data.results[index].backdropPath.toString();
          return GestureDetector(
            onTap: () {},
            child: LandingCard(
              image: CachedNetworkImageProvider("$imageUrl$url"),
              name: data.results[index].name.toString(),
              backgroundPrimary: backgroundPrimary,
            ),
          );
        },
        options: carouselOptions,
      ),
    );
  }
}