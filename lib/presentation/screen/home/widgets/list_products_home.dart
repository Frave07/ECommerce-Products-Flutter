import 'package:e_commers/data/env/env.dart';
import 'package:e_commers/domain/blocs/blocs.dart';
import 'package:e_commers/domain/models/response/response_products_home.dart';
import 'package:e_commers/domain/services/services.dart';
import 'package:e_commers/presentation/components/shimmer_frave.dart';
import 'package:e_commers/presentation/components/widgets.dart';
import 'package:e_commers/presentation/screen/products/details_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListProductsForHome extends StatelessWidget {

  const ListProductsForHome({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {

    final productBloc = BlocProvider.of<ProductBloc>(context);

    return FutureBuilder<List<ListProducts>>(
      future: productServices.listProductsHome(),
      builder: (context, snapshot) {
        
        return !snapshot.hasData
        ? Column(
            children: const [
              ShimmerFrave(),
              SizedBox(height: 10.0),
              ShimmerFrave(),
              SizedBox(height: 10.0),
              ShimmerFrave(),
            ],
          )
        : GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 20,
              mainAxisExtent: 220
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) => Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsProductPage(product: snapshot.data![i]))),
                child: Stack(
                  children: [
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Hero(
                            tag: snapshot.data![i].uidProduct.toString(),
                            child: Image.network(Environment.baseUrl + snapshot.data![i].picture, height: 120)
                          ),
                        ),
                        TextFrave(text: snapshot.data![i].nameProduct, fontSize: 17, overflow: TextOverflow.ellipsis),
                        TextFrave(text: '\$ ${snapshot.data![i].price}', fontSize: 16 ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: snapshot.data![i].isFavorite == 1
                      ? InkWell(
                          onTap: () => productBloc.add( OnAddOrDeleteProductFavoriteEvent(uidProduct: snapshot.data![i].uidProduct.toString())),
                          child: const Icon(Icons.favorite_rounded, color: Colors.red),
                        )
                      : InkWell(
                          onTap: () => productBloc.add( OnAddOrDeleteProductFavoriteEvent(uidProduct: snapshot.data![i].uidProduct.toString())),
                          child: Icon(Icons.favorite_outline_rounded)
                        )
                    ),
                  ],
                ),
              ),
            ),
          );

      },
    );
  }
}
