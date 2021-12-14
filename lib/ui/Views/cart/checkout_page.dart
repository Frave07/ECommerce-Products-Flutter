
import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/Home/home_page.dart';
import 'package:e_commers/ui/Views/cart/widgets/order_details.dart';
import 'package:e_commers/ui/Views/cart/widgets/payment_credit_cart.dart';
import 'package:e_commers/ui/Views/cart/widgets/promo_code.dart';
import 'package:e_commers/ui/Views/cart/widgets/street_address.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CheckOutPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    // new StripeService()
    //   ..init();

    final productBloc = BlocProvider.of<ProductBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if(state is LoadingProductState){
          modalLoading(context, 'Checking...');
        }else if(state is FailureProductState){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if( state is SuccessProductState ){
          Navigator.pop(context);
          modalSuccess(context, 'Successfully paid', 
            onPressed: (){
              productBloc.add( OnClearProductsEvent() );
              Navigator.pushAndRemoveUntil(context, routeFade(page: HomePage()), (_) => false);
            } 
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xfff3f4f8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const TextFrave(text: 'Checkout', color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            splashRadius: 20,
            icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            
            const StreetAddressCheckout(),
    
            const PaymentCreditCart(),
    
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(15.0),
              height: 100,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextFrave(text: 'Delivery Details', fontSize: 19, fontWeight: FontWeight.w600 ),
                  Divider(),
                  TextFrave(text: 'Stander Delivery (3-4 days)', fontSize: 18),
                ],
              ),
            ),
    
            PromoCode(size: size.width),
    
            const OrderDetails(),
    
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextFrave(text: 'Total', fontSize: 19,),
                  TextFrave(text: '\$ ${productBloc.state.total}', fontSize: 19,)
                ],
              ),
            ),
          
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              alignment: Alignment.bottomCenter,
              child: BtnFrave(
                text: 'Pay',
                height: 55, 
                fontSize: 22,
                width: size.width,
                onPressed: (){
                    // cartBloc.add( OnMakePayment(amount: '${ (productBloc.state.total * 100 ).floor() }', creditCardFrave: cartBloc.state.creditCardFrave ) );
                    productBloc.add( 
                      OnSaveProductsBuyToDatabaseEvent('${productBloc.state.total}', productBloc.product ) 
                    );
                },
              ),
            )
          ],
        ),
       ),
    );
  }
}





