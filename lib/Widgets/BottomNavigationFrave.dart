import 'package:flutter/material.dart';
import 'package:e_commers/Views/Cart/CartPage.dart';
import 'package:e_commers/Views/Favorite/FavoritePage.dart';
import 'package:e_commers/Views/Home/HomePage.dart';
import 'package:e_commers/Views/Profile/ProfilePage.dart';
import 'package:e_commers/Widgets/AnimationRoute.dart';
import 'package:flutter_svg/flutter_svg.dart';



class BottomNavigationFrave extends StatelessWidget
{

  final int index;
  final bool showMenu;
  
  BottomNavigationFrave({ @required this.index, this.showMenu = true });


  @override
  Widget build(BuildContext context) 
  {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 250),
      opacity: ( showMenu ) ? 1 : 0,
      child: Container(
        height: 60,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ItemsButton(i: 0, index: index, svg: 'Assets/home.svg', activeSvg: 'Assets/home-selected.svg', onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: HomePage(), curved: Curves.easeInOut))),
            _ItemsButton(i: 1, index: index, icon: Icons.favorite_outline_rounded, isIcon: true, activeIcon: Icons.favorite_rounded, onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: FavoritePage(), curved: Curves.easeInOut))),
            _ItemsButton(i: 2, index: index, svg: 'Assets/bolso.svg', center: true, activeSvg: 'Assets/bolso-selected.svg', onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: CartPage(), curved: Curves.easeInOut))),
            _ItemsButton(i: 3, index: index, icon: Icons.search, isIcon: true, activeIcon: Icons.search,),
            _ItemsButton(i: 4, index: index, icon: Icons.person_outline_rounded, isIcon: true, activeIcon:  Icons.person, onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: ProfilePage(), curved: Curves.easeInOut))),
          ]
        ),
      ),
    );
  }
}



class  _ItemsButton extends StatelessWidget 
{
  final IconData icon;
  final String svg;
  final bool isIcon;
  final bool center;
  final Function onPressed;
  final IconData activeIcon;
  final String activeSvg;
  final int index;
  final int i;

  _ItemsButton({ 
    this.i,
    this.index,
    this.icon, 
    this.svg, 
    this.center = false,
    this.isIcon = false,
    this.onPressed,
    this.activeIcon,
    this.activeSvg
  });


  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: onPressed,
      child: center
       ? CircleAvatar(
         backgroundColor: Color(0xff006cf2),
         radius: 26,
         child: SvgPicture.asset( i == index ? activeSvg : svg, height: 26, color: Colors.white ),
       )
       : isIcon 
          ? Icon( i == index ? activeIcon : icon , size: 30, color: i == index ? Color(0xff006cf2) : Colors.black )
          : SvgPicture.asset( i == index ? activeSvg : svg , height: 26, color: i == index ? Color(0xff006cf2) : Colors.black )
    );
  }
}
