import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:e_commers/Bloc/Cart/cart_bloc.dart';
import 'package:e_commers/Bloc/Personal/personal_bloc.dart';
import 'package:e_commers/Bloc/Product/product_bloc.dart';
import 'package:e_commers/Helpers/ModalLoading.dart';
import 'package:e_commers/Helpers/modalPayment.dart';
import 'package:e_commers/Service/StripeService.dart';
import 'package:e_commers/Views/Cart/DeliveryPage.dart';
import 'package:e_commers/Views/Cart/PaymentPage.dart';
import 'package:e_commers/Widgets/AnimationRoute.dart';
import 'package:e_commers/Widgets/btnFrave.dart';
import 'package:e_commers/Widgets/TextFrave.dart';


class CheckOutPagePage extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {

    new StripeService()
      ..init();

    final productBloc = BlocProvider.of<ProductBloc>(context);
    final personalBloc = BlocProvider.of<PersonalBloc>(context);
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if( state is LoadingPaymentState ){

          modalLoading(context, 'Making payment...');

        } else if ( state is SuccessPaymentState ) {
          
          Navigator.pop(context);
          modalPayment(context);
        
        } else if ( state is FailurePaymentState ){
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextFrave(text: state.err, fontSize: 17 ), backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xfff3f4f8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextFrave(text: 'Checkout', color: Colors.black, fontSize: 21),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            
            Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              color: Colors.white,
              height: 96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFrave(text: 'Shipping address', fontSize: 19, fontWeight: FontWeight.w600),
                      GestureDetector(
                        child: TextFrave(text: personalBloc.state.address == null ? 'Add' : 'Change', color: Colors.blue, fontSize: 18 ),
                        onTap: () => Navigator.of(context).push(rutaFrave(page: DeliveryPage(), curved: Curves.easeInOut)),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 5.0),
                  BlocBuilder<PersonalBloc, PersonalState>(
                    builder: (context, state) 
                      => ( state.address == null ) 
                        ? TextFrave(text: 'Without Street Address', fontSize: 18)
                        : TextFrave(text: '${personalBloc.state.address}', fontSize: 18)
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 113,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFrave(text: 'Payment', fontSize: 19, fontWeight: FontWeight.w600 ),
                      GestureDetector(
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) 
                            => ( !state.cardActive )
                            ? TextFrave(text: 'Add', color: Colors.blue, fontSize: 18 )
                            : TextFrave(text: 'Change', color: Colors.blue, fontSize: 18 )
                        ),
                        onTap: () => Navigator.of(context).push(rutaFrave(page: PaymentPage(), curved: Curves.easeInOut)) 
                      )
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 5.0),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) 
                      => ( !state.cardActive ) 
                        ? TextFrave(text: 'Without Credit Card', fontSize: 18)
                        : Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          color: Color(0xfff5f5f5),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: SvgPicture.asset('Assets/${state.creditCardFrave.brand}.svg' )
                              ),
                              SizedBox(width: 15.0),
                              TextFrave(text: '**** **** **** ${state.creditCardFrave.cardNumberHidden}', fontSize: 18,)
                            ],
                          ),
                        )
                  )
                ],
              )
            ),

            Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(15.0),
              height: 100,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFrave(text: 'Delivery Details', fontSize: 19, fontWeight: FontWeight.w600 ),
                  Divider(),
                  TextFrave(text: 'Stander Delivery (3-4 days)', fontSize: 18),
                ],
              ),
            ),

            _PromoCode(),

            _OrderDetails(),

            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFrave(text: 'Total', fontSize: 19,),
                  TextFrave(text: '\$ ${productBloc.state.total}', fontSize: 19,)
                ],
              ),
            ),
          
            Container(
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              alignment: Alignment.bottomCenter,
              child: BtnFrave(
                text: 'Pay',
                height: 55, 
                fontSize: 22,
                onPressed: (){
                    cartBloc.add( OnMakePayment(amount: '${ (productBloc.state.total * 100 ).floor() }', creditCardFrave: cartBloc.state.creditCardFrave ) );
                    productBloc.add( 
                      SaveProductsBuy( 
                        date: DateTime.now().toString(),
                        amount: '${productBloc.state.total}',
                        product: productBloc.product
                      ) 
                    );
                    productBloc.add( ClearProductsEvent() );
                },
              ),
            )
          ],
        ),
       ),
    );
  }
}


class _OrderDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) 
  {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      height: 130,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFrave(text: 'Order', fontSize: 19,),
              TextFrave(text: '\$ ${productBloc.state.total}', fontSize: 19,)
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFrave(text: 'Delivery', fontSize: 19,),
              TextFrave(text: '\$ ${productBloc.state.delivery}', fontSize: 19,)
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFrave(text: 'Insurance', fontSize: 19,),
              TextFrave(text: '\$ ${productBloc.state.insurance}', fontSize: 19,)
            ],
          ),
        ],
      ),
    );
  }
}


class _PromoCode extends StatelessWidget {

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFrave(text: 'Promo', fontSize: 19,),
          SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                // width: 250,
                child: Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Roboto', fontSize: 19),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color(0xffF5F5F5))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                )
              ),
              SizedBox(width: 10.0),
              Container(
                height: 48,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xff0C6CF2),
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: Center(
                  child: TextFrave(text: 'Use Code', color: Colors.white, fontSize: 18,)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}