import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commers/Controller/ProductController.dart';
import 'package:e_commers/Models/Product.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> 
{
  ProductBloc() : super(ProductState());

  List<ProductCart> product = [];

  @override
  Stream<ProductState> mapEventToState( ProductEvent event ) async* {



      if( event is AddOrDeleteProductFavorite ){

          yield* mapEventAddOrDeleteProductFavorite( event.uidProduct );


      } else if ( event is AddProductToCart ){


          final hasProduct = product.contains( event.product );

          if( !hasProduct ){

            product.add( event.product );

            double sum = 0;
            product.forEach((e) { sum = sum + e.price; });

            yield state.copyWith(
              products: product,
              total: sum,
              amount: product.length
            );

          }


      } else if ( event is DeleteProductToCart ){

          product.removeAt( event.index );

          double sum = 0;
          product.forEach((e) { sum = sum + e.price; });

          yield state.copyWith(
            products: product,
            total: sum,
            amount: product.length
          );


      } else if ( event is PlusQuantityProduct ){

          product[event.plus].amount++;

          double total = 0;
          product.forEach((e) { total = total + (e.price * e.amount); });

          yield state.copyWith(
            products: product,
            total: total
          );
      

      } else if ( event is SubtractQuantityProductEvent ){

          product[event.subtract].amount--;

          double total = 0;
          product.forEach((e) { total = total - (e.price * e.amount); });

          yield state.copyWith(
            products: product,
            total: total.abs()
          );


      } else if ( event is ClearProductsEvent ){

          product.clear();

          yield state.copyWith(
            amount: 00,
            delivery: 0.0,
            insurance: 0.0,
            products: product,
            total: 00.0,
          );

      
      } else if ( event is SaveProductsBuy ){

          try {

            await dbProductController.saveOrderBuyProduct(
              receipt: 'Ticket',
              date: event.date,
              amount: event.amount,
              products: event.product
            );
            
          } catch (e) {
            print('Something went wrong!');
            print(e.toString());
          }


      }
  
  }


  Stream<ProductState> mapEventAddOrDeleteProductFavorite( String uidProduct ) async* {

    try {

      final resp = await dbProductController.addOrDeleteProductFavorite( uidProduct: uidProduct );

      if( resp.resp ){

        
      }
      
    } catch (e) {

    }

  }





}
