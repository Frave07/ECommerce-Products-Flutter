import 'package:e_commers/Bloc/Product/product_bloc.dart';
import 'package:e_commers/Helpers/ModalAddCart.dart';
import 'package:e_commers/Models/Home/ProductsHome.dart';
import 'package:e_commers/Models/Product.dart';
import 'package:e_commers/Views/Cart/CartPage.dart';
import 'package:e_commers/Views/Home/HomePage.dart';
import 'package:e_commers/Widgets/AnimationRoute.dart';
import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailsProductPage extends StatelessWidget
{
  final Product product;

  DetailsProductPage({ @required this.product }); 

  @override
  Widget build(BuildContext context)
  {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 10.0, bottom: 100.0),
              children: [
                _AppBarProduct(nameProduct: product.nameProduct, uidProduct: product.uidProduct.toString() ),
                SizedBox(height: 20.0),
                _ImageProduct( uidProduct: product.uidProduct.toString(), imageProduct: product.picture),

                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    children: [
                      TextFrave(text: product.nameProduct, fontSize: 25,)
                    ],
                  ),
                ),

                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFrave(text: '\$ ${product.price}', fontSize: 30, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10.0),
                _RaitingProduct(),

                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        SvgPicture.asset('Assets/garantia.svg', color: Colors.green, height: 50),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'This product has a ', style: GoogleFonts.getFont('Roboto', color: Colors.black, fontSize: 18)),
                              TextSpan(text: 'delivery guarantee', style: GoogleFonts.getFont('Roboto', color: Colors.blue, fontSize: 18))
                            ]
                          ),
                        )
                      ],
                    )
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 240.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                    color: Color(0xff8956FF),
                    child: TextFrave(text: 'Shipping normally', fontSize: 18, color: Colors.white ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Row(
                      children: [
                        TextFrave(text: 'Available. ', fontSize: 18, color: Colors.green ),
                        TextFrave(text: 'In Stock', fontSize: 18, ),
                      ],
                    ),
                  ),
                ), 

                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFrave(text: 'Description', fontSize: 20, fontWeight: FontWeight.bold ),
                ),

                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    children: [
                      TextFrave(text: product.description, fontSize: 17)
                    ],
                  ),
                ),

                SizedBox(height: 30.0 ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFrave(text: 'Payment methods', fontSize: 20, fontWeight: FontWeight.bold ),
                ),
                Container(
                  height: 60,
                  color: Color(0xfff5f5f5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset('Assets/visa.svg', height: 60, color: Colors.blue,),
                      SvgPicture.asset('Assets/mastercard.svg', height: 60,),
                      SvgPicture.asset('Assets/american express.svg', height: 60,),
                      SvgPicture.asset('Assets/paypal.svg', height: 55 ),
                    ],
                  ),
                )
                
              ],
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[200], blurRadius: 15, spreadRadius: 5)
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                        ),
                        child: TextFrave(text: 'Add To Cart', fontSize: 20),
                        onPressed: () async {

                          modalAddCartSuccess(context, product.picture );

                          final productSelect = ProductCart(
                              uidProduct: product.uidProduct.toString(), 
                              image: product.picture, 
                              name: product.nameProduct, 
                              price: product.price.toDouble(),
                              amount: 1
                          );

                          productBloc.add( AddProductToCart( product: productSelect ));
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pop(context);
                          Navigator.of(context).push(rutaFrave(page: HomePage(), curved: Curves.easeInOut));
                        },
                      ),
                    ),
                    // SizedBox(width: 15.0),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xff2D55DB),
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                        ),
                        child: TextFrave(text: 'Buy Now', fontSize: 20, color: Colors.white ),
                        onPressed: (){

                          final productSelect = ProductCart(
                              uidProduct: product.uidProduct.toString(), 
                              image: product.picture, 
                              name: product.nameProduct, 
                              price: product.price.toDouble(),
                              amount: 1
                          );

                          productBloc.add( AddProductToCart( product: productSelect ));
                          
                          Navigator.of(context).push(rutaFrave(page: CartPage(), curved: Curves.easeInOut));

                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
     );
  }
}

class _RaitingProduct extends StatelessWidget {

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
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ),
          TextFrave(text: '124 Reviews', fontSize: 17, color: Colors.grey)
        ],
      ),
    );
  }
}

class _ImageProduct extends StatelessWidget {

  final String imageProduct;
  final String uidProduct;

  const _ImageProduct({this.uidProduct, this.imageProduct});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '$uidProduct',
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Image.network('http://192.168.1.16:7070/'+ imageProduct),
      ),
    );
  }
}

class _AppBarProduct extends StatelessWidget {
 
  final String nameProduct;
  final String uidProduct;

  const _AppBarProduct({ this.nameProduct, this.uidProduct });

  @override
  Widget build(BuildContext context) {

    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: CircleAvatar(
            backgroundColor: Color(0xffF3F4F6),
            radius: 24,
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black ),
          ),
        ),
        Container(
          width: 250,
          child: Text(nameProduct, overflow: TextOverflow.ellipsis, style: GoogleFonts.getFont('Roboto', fontSize: 19, color: Colors.grey))
        ),
        CircleAvatar(
          backgroundColor: Color(0xffF3F4F6),
          radius: 24,
          child: IconButton(
            icon: Icon(Icons.favorite_border_rounded, color: Colors.black ),
            onPressed: () => productBloc.add( AddOrDeleteProductFavorite(uidProduct: uidProduct)),
          ),
        ),
      ],
    );
  }
}