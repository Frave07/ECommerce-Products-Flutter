import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:e_commers/Controller/ProductController.dart';
import 'package:e_commers/Models/Product/FavoriteProduct.dart';
import 'package:e_commers/Widgets/BottomNavigationFrave.dart';
import 'package:e_commers/Widgets/TextFrave.dart';


class FavoritePage extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    final size =  MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: TextFrave(text: 'Favorites', color: Colors.black,),
        centerTitle: true,
        backgroundColor: Color(0xfff2f2f2),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [

          FutureBuilder<List<Favorite>>(
            future: dbProductController.favoriteProducts(),
            builder: (context, snapshot){
              return !snapshot.hasData
                      ? LoadingFavoriteProduct()
                      : ListFavoriteProduct(list: snapshot.data );
            },
          ),
          
          Positioned(
            bottom: 20,
            child: Container(
              width: size.width,
              child: Align(
                child: BottomNavigationFrave(index: 1)
              )
            ),
          ),

          
        ],
      ),
     );
  }
}

class LoadingFavoriteProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Color(0xFFF5F5F5),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 90),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 20,
          mainAxisExtent: 210
        ),
        itemCount: 6,
        itemBuilder: (context, index) 
          => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0)
            ),
          ),
      ),
    );
  }
}


class ListFavoriteProduct extends StatelessWidget {
  
  final List<Favorite> list;

  ListFavoriteProduct({this.list});

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
      itemCount: list.length == null ? 0 : list.length,
      itemBuilder: (context, i) 
        => ProductFavorite( product: list[i] )
    );
  }
}


class ProductFavorite extends StatelessWidget {

  final Favorite product;

  ProductFavorite({this.product});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductPage(product: product))),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: [
            Image.network('http://192.168.1.16:7070/' + product.picture, height: 140 ),
            TextFrave(text: product.nameProduct, fontSize: 17, textOverflow: TextOverflow.ellipsis ),
            SizedBox(height: 10.0),
            TextFrave(text: '\$ ${product.price}', fontSize: 21, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

}
