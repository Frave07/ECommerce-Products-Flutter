import 'package:e_commers/data/env/env.dart';
import 'package:e_commers/domain/blocs/blocs.dart';
import 'package:e_commers/domain/models/response/response_products_home.dart';
import 'package:e_commers/presentation/components/widgets.dart';
import 'package:e_commers/presentation/helpers/helpers.dart';
import 'package:e_commers/presentation/screen/products/details_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListFavoriteProduct extends StatelessWidget {
  
  final List<ListProducts> products;

  const ListFavoriteProduct({Key? key, required this.products}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 90),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 20,
        mainAxisExtent: 220
      ),
      itemCount: products.length,
      itemBuilder: (context, i) 
        => ProductFavorite( product: products[i] )
    );
  }
}



class ProductFavorite extends StatelessWidget {

  final ListProducts product;

  ProductFavorite({Key? key, required this.product}): super(key: key);

  @override
  Widget build(BuildContext context) {

    final productBloc = BlocProvider.of<ProductBloc>(context);
    
    return GestureDetector(
      onTap: () => Navigator.push(context, routeSlide(page: DetailsProductPage(product: product))),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(Environment.baseUrl + product.picture, height: 120 ),
                TextFrave(text: product.nameProduct, fontSize: 17, overflow: TextOverflow.ellipsis ),
                const SizedBox(height: 10.0),
                TextFrave(text: '\$ ${product.price}', fontSize: 21, fontWeight: FontWeight.bold),
              ],
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () => productBloc.add( OnAddOrDeleteProductFavoriteEvent(uidProduct: product.uidProduct.toString())),
                child: const Icon(Icons.favorite_rounded, color: Colors.red),
              )
            ),
          ],
        ),
      ),
    );
  }

}
