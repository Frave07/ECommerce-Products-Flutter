import 'package:e_commers/Models/Response/response_categories_home.dart';
import 'package:e_commers/Service/product_services.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commers/ui/widgets/shimmer_frave.dart';

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
