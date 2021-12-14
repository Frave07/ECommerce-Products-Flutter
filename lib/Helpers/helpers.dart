import 'package:animate_do/animate_do.dart';
import 'package:e_commers/Bloc/category/category_bloc.dart';
import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Models/Response/response_categories_home.dart';
import 'package:e_commers/service/product_services.dart';
import 'package:e_commers/Service/urls.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/shimmer_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';



part 'animation_route.dart';
part 'modal_success.dart';
part 'modal_loading.dart';
part 'error_message.dart';
part 'modal_warning.dart';
part 'loading_upload.dart';
part 'modal_add_cart.dart';
part 'access_permission.dart';
part 'modal_picture.dart';
part 'modal_loading_short.dart';
part 'modal_categories.dart';