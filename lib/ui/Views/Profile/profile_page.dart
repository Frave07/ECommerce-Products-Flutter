// import 'dart:io';
import 'package:e_commers/Bloc/General/general_bloc.dart';
import 'package:e_commers/ui/Views/Profile/add_product/add_product_page.dart';
import 'package:e_commers/ui/Views/Profile/card/credit_card_page.dart';
import 'package:e_commers/ui/Views/Profile/information_page.dart';
import 'package:e_commers/ui/Views/Profile/shopping/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/Service/urls.dart';
import 'package:e_commers/ui/Views/Profile/widgets/card_item_profile.dart';
import 'package:e_commers/ui/Views/Profile/widgets/divider_line.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/shimmer_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';


class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    
    final size =  MediaQuery.of(context).size;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if( state is LoadingUserState ){
          modalLoading(context, 'Loading...');
        }else if( state is FailureUserState ){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if( state is SetUserState ){
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: Stack(
          children: [
    
            ListProfile(),
            
            Positioned(
              bottom: 20,
              child: Container(
                width: size.width,
                child: Align(
                  child: BottomNavigationFrave(index: 5)
                )
              ),
            ),  
            
          ],
        ),
       ),
    );
  }
}


class ListProfile extends StatefulWidget {
  @override
  _ListProfileState createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {

  late ScrollController _scrollController;
  double scrollPrevious = 0;

  @override
  void initState() {

    _scrollController = ScrollController();
    _scrollController.addListener(addListenerScroll);

    super.initState();
  }

  void addListenerScroll(){

    if( _scrollController.offset > scrollPrevious ){
      BlocProvider.of<GeneralBloc>(context).add( OnShowOrHideMenuEvent(showMenu: false));
    }else{
      BlocProvider.of<GeneralBloc>(context).add( OnShowOrHideMenuEvent(showMenu: true));
    }
    scrollPrevious = _scrollController.offset;

  }

  @override
  void dispose() {
    _scrollController.removeListener(addListenerScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 35.0, bottom: 20.0),
      children: [

        BlocBuilder<UserBloc, UserState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) 
          => state.user != null 
          ? Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: state.user != null && state.user?.image == ''
                  ? GestureDetector(
                      onTap: () => modalSelectPicture(
                        context: context,
                        onPressedImage: () async {
                          Navigator.pop(context);
                          AccessPermission().permissionAccessGalleryOrCameraForProfile(
                            await Permission.storage.request(),
                            context,
                            ImageSource.gallery
                          );
                        },
                        onPressedPhoto: () async {
                          Navigator.pop(context);
                          AccessPermission().permissionAccessGalleryOrCameraForProfile(
                            await Permission.camera.request(),
                            context,
                            ImageSource.camera
                          );
                        },
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: ColorsFrave.primaryColorFrave,
                        child: TextFrave(text: state.user!.users.substring(0,2).toUpperCase(), fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    )
                  : GestureDetector(
                      onTap: () => modalSelectPicture(
                        context: context,
                        onPressedImage: () async {
                          Navigator.pop(context);
                          AccessPermission().permissionAccessGalleryOrCameraForProfile(
                            await Permission.storage.request(),
                            context,
                            ImageSource.gallery
                          );
                        },
                        onPressedPhoto: () async {
                          Navigator.pop(context);
                          AccessPermission().permissionAccessGalleryOrCameraForProfile(
                            await Permission.camera.request(),
                            context,
                            ImageSource.camera
                          );
                        },
                      ),
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage( URLS.baseUrl + state.user!.image )
                          )
                        ),
                      ),
                  )
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BounceInRight(
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFrave(text: state.user!.users , fontSize: 21, fontWeight: FontWeight.w500 )
                      ),
                    ),
                    FadeInRight(
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFrave(text: state.user!.email, fontSize: 18, color: Colors.grey)
                      ),
                    ),
                  ],
                ),
              ],
            )
          : const ShimmerFrave()
        ),
        const SizedBox(height: 25.0),
        
        Container(
          height: 182,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Column(
            children: [
              CardItemProfile(
                text: 'Personal Information', 
                borderRadius: BorderRadius.circular(50.0),
                icon: Icons.person_outline_rounded,
                backgroundColor: Color(0xff7882ff),
                onPressed: () => Navigator.push(context, routeSlide(page: InformationPage())),
              ),
              DividerLine(size: size),
              CardItemProfile(
                text: 'Credit Card', 
                borderRadius: BorderRadius.circular(50.0),
                icon: Icons.credit_card_rounded,
                backgroundColor: Color(0xffFFCD3A),
                onPressed: () => Navigator.push(context, routeSlide(page: CreditCardPage())),
              ),
              DividerLine(size: size),
              CardItemProfile(
                text: 'Add Product', 
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30.0)),
                icon: Icons.add,
                backgroundColor: Color(0xff02406F),
                onPressed: () => Navigator.push(context, routeSlide(page: AddProductPage())),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: const TextFrave(text: 'General', fontSize: 17, color: Colors.grey,),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 243,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Column(
            children: [
                CardItemProfile(
                  text: 'Settings', 
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30.0)),
                  backgroundColor: Color(0xff2EAA9B),
                  icon: Icons.settings_applications,
                  onPressed: (){},
                ),
                DividerLine(size: size),
                CardItemProfile(
                  text: 'Notifications',
                  borderRadius: BorderRadius.zero,
                  backgroundColor: Color(0xffE87092),
                  icon: Icons.notifications_none_rounded,
                  onPressed: () {},
                ),
                DividerLine(size: size),
                CardItemProfile(
                  text: 'Favorites',
                  backgroundColor: Color(0xfff28072),
                  icon: Icons.favorite_border_rounded,
                  borderRadius: BorderRadius.zero,
                  onPressed: (){},
                ),
                DividerLine(size: size),
                CardItemProfile(
                  text: 'My Shopping',
                  backgroundColor: Color(0xff0716A5),
                  icon: Icons.shopping_bag_outlined,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30.0)),
                  onPressed: () => Navigator.push(context, routeSlide(page: ShoppingPage())),
                ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: const TextFrave(text: 'Personal', fontSize: 17, color: Colors.grey,),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 243,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Column(
            children: [
                CardItemProfile(
                  text: 'Privacy & Policy', 
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30.0)),
                  backgroundColor: Color(0xff6dbd63),
                  icon: Icons.policy_rounded,
                  onPressed: (){},
                ),
                DividerLine(size: size),
                CardItemProfile(
                  text: 'Security',
                  borderRadius: BorderRadius.zero,
                  backgroundColor: Color(0xff1F252C),
                  icon: Icons.lock_outline_rounded,
                  onPressed: (){},
                ),
                DividerLine(size: size),
                CardItemProfile(
                  text: 'Term & Conditions',
                  borderRadius: BorderRadius.zero,
                  backgroundColor: Color(0xff458bff),
                  icon: Icons.description_outlined,
                  onPressed: (){},
                ),
                DividerLine(size: size),
                CardItemProfile(
                  text: 'Help',
                  backgroundColor: Color(0xff4772e6),
                  icon: Icons.help_outline,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30.0)),
                  onPressed: (){},
                ),

            ],
          ),
        ),
        SizedBox(height: 25.0),
        CardItemProfile(
          text: 'Sign Out', 
          borderRadius: BorderRadius.circular(50.0),
          icon: Icons.power_settings_new_sharp,
          backgroundColor: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}






