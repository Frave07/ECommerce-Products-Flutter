import 'package:e_commers/Controller/ProductController.dart';
import 'package:e_commers/Models/Home/ProductsHome.dart';
import 'package:e_commers/Views/Products/DetailsProductPage.dart';
import 'package:e_commers/Widgets/StaggeredDualView.dart';
import 'package:e_commers/Widgets/TextFrave.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoryProductsPage extends StatefulWidget {
  final String uidCategory;
  final String category;

  const CategoryProductsPage({ @required this.uidCategory, @required this.category});

  @override
  _CategoryProductsPageState createState() => _CategoryProductsPageState();
}


class _CategoryProductsPageState extends State<CategoryProductsPage> 
{

  List<Product> listProduct = [];

  getProducts() async {

    listProduct = await dbProductController.getProductsForCategories(id: widget.uidCategory );
    setState(() { });
  }


  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: TextFrave(text: widget.category, color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: StaggeredDualView(
          itemCount: listProduct.length,
          spacing: 5,
          alturaElement: 0.15,
          aspectRatio: 0.8,
          itemBuilder: (_, i) 
            => Card(
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
              elevation: 10.0,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                splashColor: Colors.blue[300],
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsProductPage(product: listProduct[i]))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                          child: Hero(
                            tag: listProduct[i].uidProduct.toString(),
                            child: Image.network('http://192.168.1.16:7070/'+ listProduct[i].picture, height: 150,)
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          listProduct[i].nameProduct,
                          style: GoogleFonts.getFont('Roboto', fontSize: 17, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextFrave(text: '\$ ${listProduct[i].price}', fontSize: 16 ),
                    ],
                  ),
                ),
              ),
            )
        ),
      )
     );
  }
}