import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarProduct extends StatelessWidget {
 
  final String nameProduct;
  final String uidProduct;
  final int isFavorite;

  const AppBarProduct({ 
    Key? key,
    required this.nameProduct, 
    required this.uidProduct,
    required this.isFavorite 
  }):super(key: key);

  @override
  Widget build(BuildContext context) {

    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: () => Navigator.pop(context),
          child: CircleAvatar(
            backgroundColor: Color(0xffF3F4F6),
            radius: 24,
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black ),
          ),
        ),
        Container(
          width: 250,
          child: TextFrave(text: nameProduct, overflow: TextOverflow.ellipsis, fontSize: 19, color: Colors.grey)
        ),
        CircleAvatar(
          backgroundColor: Color(0xffF5F5F5),
          radius: 24,
          child: IconButton(
            icon: isFavorite == 1 
            ? Icon(Icons.favorite_rounded, color: Colors.red )
            : Icon(Icons.favorite_border_rounded, color: Colors.black ),
            onPressed: () => productBloc.add( OnAddOrDeleteProductFavoriteEvent(uidProduct: uidProduct)),
          ),
        ),
      ],
    );
  }
}