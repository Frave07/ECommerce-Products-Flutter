import 'package:e_commers/domain/blocs/blocs.dart';
import 'package:e_commers/presentation/components/shimmer_frave.dart';
import 'package:e_commers/presentation/components/widgets.dart';
import 'package:e_commers/presentation/helpers/helpers.dart';
import 'package:e_commers/presentation/screen/home/home_page.dart';
import 'package:e_commers/presentation/themes/colors_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithoutProductsCart extends StatelessWidget {

  const WithoutProductsCart({Key? key}):super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (_, state) 
        => state.products != null
        ? state.products!.length != 0 
          ? SizedBox(
              height: 290,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.shopping_bag_outlined, size: 90, color: ColorsFrave.primaryColorFrave.withOpacity(.7)),
                const SizedBox(height: 20),
                const TextFrave(text: 'There is a cart to fill!', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 20),
                const TextFrave(text: 'Currently do not have ', fontSize: 16),
                const SizedBox(height: 5),
                const TextFrave(text: 'any products in your shopping cart', fontSize: 16),
                const SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                    style:ButtonStyle(
                      side: MaterialStateProperty.all( BorderSide(color: Colors.blue) ),
                      padding: MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 40, vertical: 10))
                    ),
                    child: const TextFrave(text: 'Go Products', fontSize: 19 ),
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(routeSlide(page: HomePage()), (_) => false),
                  ),
                )
              ],
            )
          )
          : const SizedBox()
      : const ShimmerFrave()
    );
  }


}
