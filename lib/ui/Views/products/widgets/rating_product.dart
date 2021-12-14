import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 160,
            child: RatingBarIndicator(
              rating: 4,
              itemCount: 5,
              itemSize: 30.0,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, _) => const Icon( Icons.star, color: Colors.amber),
            ),
          ),
          const TextFrave(text: '124 Reviews', fontSize: 17, color: Colors.grey)
        ],
      ),
    );
  }
}
