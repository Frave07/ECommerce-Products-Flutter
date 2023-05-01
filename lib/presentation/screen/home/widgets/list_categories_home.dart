import 'package:e_commers/domain/models/response/response_categories_home.dart';
import 'package:e_commers/domain/services/services.dart';
import 'package:e_commers/presentation/components/shimmer_frave.dart';
import 'package:e_commers/presentation/components/widgets.dart';
import 'package:e_commers/presentation/themes/colors_frave.dart';
import 'package:flutter/material.dart';

class ListCategoriesHome extends StatelessWidget {

  const ListCategoriesHome({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<Categories>>(
        future: productServices.listCategoriesHome(),
        builder: (context, snapshot) {
          
          return !snapshot.hasData
          ? const ShimmerFrave()
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) => Container(
                margin: EdgeInsets.only(right: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: 150,
                decoration: BoxDecoration(
                  color: Color(0xff0C6CF2).withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Center(
                  child: TextFrave(
                    text: snapshot.data![i].category, 
                    color: ColorsFrave.primaryColorFrave,
                    overflow: TextOverflow.ellipsis, 
                    fontSize: 17,
                  )
                ),
              ),
            );
        },
      ),
    );
  }
}
