import 'dart:io';

import 'package:e_commers/Bloc/category/category_bloc.dart';
import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/Profile/profile_page.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  late TextEditingController _nameProductController;
  late TextEditingController _descriptionProductController;
  late TextEditingController _stockController;
  late TextEditingController _priceController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _nameProductController = TextEditingController();
    _descriptionProductController = TextEditingController();
    _stockController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameProductController.clear();
    _nameProductController.dispose();
    _descriptionProductController.clear();
    _descriptionProductController.dispose();
    _stockController.clear();
    _stockController.dispose();
    _priceController.clear();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final productBloc = BlocProvider.of<ProductBloc>(context);
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if(state is LoadingProductState){
          modalLoading(context, 'Checking...');
        }else if(state is FailureProductState){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if( state is SuccessProductState ){
          Navigator.pop(context);
          modalSuccess(context, 'Product Added!', onPressed: (){
            Navigator.pushAndRemoveUntil(context, routeSlide(page: ProfilePage()), (_) => false);
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const TextFrave(text: 'Add New Product', fontSize: 20, fontWeight: FontWeight.bold ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            splashRadius: 20,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if(_keyForm.currentState!.validate()){
    
                  productBloc.add( OnSaveNewProductEvent(
                    _nameProductController.text.trim(), 
                    _descriptionProductController.text.trim(), 
                    _stockController.text.trim(), 
                    _priceController.text.trim(), 
                    categoryBloc.state.uidCategory.toString(), 
                    productBloc.state.pathImage!
                  ));
    
                }
              }, 
              child: const TextFrave(text: 'Save', color: ColorsFrave.primaryColorFrave, fontWeight: FontWeight.w500 )
            )
          ],
        ),
        body: Form(
          key: _keyForm,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            children: [
        
              InkWell(
                onTap: () => modalSelectPicture(
                  context: context,
                  onPressedImage: () async {
                    Navigator.pop(context);
                    AccessPermission().permissionAccessGalleryOrCameraForProduct(
                      await Permission.storage.request(),
                      context,
                      ImageSource.gallery
                    );
                  },
                  onPressedPhoto: () async {
                    Navigator.pop(context);
                    AccessPermission().permissionAccessGalleryOrCameraForProduct(
                      await Permission.camera.request(),
                      context,
                      ImageSource.camera
                    );
                  },
                ),
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (_, state) 
                    => state.pathImage != null
                    ? Container(
                        height: 190,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(state.pathImage!))
                          )
                        ),
                    )
                    : Container(
                        height: 190,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: const Icon(Icons.wallpaper_rounded, size: 80),
                    ),
                ),
              ),
        
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _nameProductController, 
                prefixIcon: const Icon(Icons.add),
                hintText: 'Name Product',
                validator: RequiredValidator(errorText: 'name is required'),
              ),
        
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _descriptionProductController, 
                prefixIcon: const Icon(Icons.add),
                hintText: 'Description Product',
                validator: RequiredValidator(errorText: 'Description is required'),
              ),
        
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _stockController, 
                prefixIcon: const Icon(Icons.add),
                hintText: 'Stock',
                keyboardType: TextInputType.number,
                validator: RequiredValidator(errorText: 'Stock is required'),
              ),
        
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _priceController, 
                prefixIcon: const Icon(Icons.add),
                hintText: 'Price',
                keyboardType: TextInputType.number,
                validator: RequiredValidator(errorText: 'Price is required'),
              ),
        
              const SizedBox(height: 20.0),
              InkWell(
                onTap: () => modalCategoies(context, size),
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (_, state) 
                    => state.uidCategory != null
                    ? TextFrave(text: state.nameCategory!, color: Colors.black54)
                    : TextFrave(text: 'Select Category', color: Colors.black54)
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}