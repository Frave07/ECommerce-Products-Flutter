import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/Home/home_page.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarCart extends StatelessWidget {

  const AppBarCart({Key? key}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffF5F5F5),
                radius: 24,
                child: InkWell(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(routeSlide(page: HomePage()), (_) => false),
                  child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black )
                ),
              ),
              const SizedBox(width: 20.0),
              Container(
                child: const TextFrave(text: 'My Cart', fontSize: 24, fontWeight: FontWeight.w600 )
              ),
            ],
          ),
          
          Container(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (_, state) 
              => state.products != null
              ? TextFrave(text: '${state.products!.length} items', fontSize: 19, color: Colors.black54 )
              : TextFrave(text: '0 items', fontSize: 19, color: Colors.black54 )
            )
          ),
        ],
      ),
    );
  }
}