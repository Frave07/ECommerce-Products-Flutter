import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commers/Models/Response/response_slide_products.dart';
import 'package:e_commers/Service/product_services.dart';
import 'package:e_commers/Service/urls.dart';
import 'package:e_commers/ui/widgets/shimmer_frave.dart';
import 'package:flutter/material.dart';

class CardCarousel extends StatelessWidget {

  const CardCarousel({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<SlideProduct>>(
        future: productServices.listProductsHomeCarousel(),
        builder: (context, snapshot) {

            return !snapshot.hasData
            ? const ShimmerFrave()
            : CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1,
              ),
              itemBuilder: (context, index, realIndex) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(URLS.baseUrl + snapshot.data![index].image)
                    )
                  ),
                );
              },
            );
            
        } 
      ),
    );
  }
}