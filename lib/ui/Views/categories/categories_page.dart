import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/Models/Response/response_categories_home.dart';
import 'package:e_commers/service/product_services.dart';
import 'package:e_commers/service/urls.dart';
import 'package:e_commers/ui/Views/categories/product_for_category_page.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/shimmer_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CategoriesPage extends StatelessWidget {

  const CategoriesPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          splashRadius: 20,
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        title: const TextFrave(text: 'Categories', color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 20),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Categories>>(
         future: productServices.getAllCategories(),
         builder: (context, snapshot){
            return !snapshot.hasData
            ? Column(
                children: const [
                  ShimmerFrave(),
                  SizedBox(height: 10.0),
                  ShimmerFrave(),
                  SizedBox(height: 10.0),
                  ShimmerFrave(),
                ],
              )
            : _ListCategories(categories: snapshot.data!);
         },
      ),
     );
  }
}


class _ListCategories extends StatelessWidget {
  
  final List<Categories> categories;

  const _ListCategories({ Key? key, required this.categories}): super(key: key); 

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: 180
      ),
      itemCount: categories.length,
      itemBuilder: (context, i) => GestureDetector(
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: ColorsFrave.primaryColorFrave.withOpacity(.2),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.network(URLS.baseUrl+ categories[i].picture, height: 85, color: ColorsFrave.primaryColorFrave),
              const SizedBox(height: 10.0),
              TextFrave(text: categories[i].category, fontSize: 20, overflow: TextOverflow.ellipsis )
            ],
          ),
        ),
        onTap: () => Navigator.push(context, routeSlide(page: CategoryProductsPage(uidCategory: categories[i].uidCategory.toString(), category: categories[i].category)))
      ),
    );
  }
}