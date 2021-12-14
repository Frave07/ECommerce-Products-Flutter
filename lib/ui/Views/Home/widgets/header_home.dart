import 'package:animate_do/animate_do.dart';
import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/Service/urls.dart';
import 'package:e_commers/ui/Views/cart/cart_page.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderHome extends StatelessWidget {

  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInLeft(
            child: BlocBuilder<UserBloc, UserState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) 
              => state.user != null
              ? Row(
                  children: [
                    state.user!.image != ''
                    ? CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(URLS.baseUrl + state.user!.image),
                      )
                    : CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorsFrave.primaryColorFrave,
                      child: TextFrave(text: state.user!.users.substring(0,2).toUpperCase(), fontWeight: FontWeight.bold, color: Colors.white,),
                    ),
                    const SizedBox(width: 5.0),
                    TextFrave(text: state.user!.users, fontSize: 18,)
                  ],
              )
              : const SizedBox()
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () => Navigator.of(context).pushAndRemoveUntil(routeSlide(page: CartPage()), (_) => false),
            child: Stack(
              children: [
                FadeInRight(
                  child: Container(
                    height: 32,
                    width: 32,
                    child: SvgPicture.asset('Assets/bolso-negro.svg', height: 25 )
                  )
                ),
                Positioned(
                  left: 0,
                  top: 12,
                  child: FadeInDown(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: ColorsFrave.primaryColorFrave,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) 
                            => state.amount == 0 
                              ? TextFrave(text: '0', color: Colors.white, fontWeight: FontWeight.bold )
                              : TextFrave(text: '${state.products!.length}', color: Colors.white, fontWeight: FontWeight.bold )
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}