part of 'helpers.dart';

class AccessPermission {

  final ImagePicker _picker = ImagePicker();

  Future<void> permissionAccessGalleryOrCameraForProfile(PermissionStatus status, BuildContext context, ImageSource source) async {

    switch (status){
    
      case PermissionStatus.granted:
          final XFile? imagePath = await _picker.pickImage(source: source);
          if( imagePath != null ){
            BlocProvider.of<UserBloc>(context).add( OnUpdateProfilePictureEvent(imagePath.path) );
          }
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        break;
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
        break;
    }
  }

  Future<void> permissionAccessGalleryOrCameraForProduct(PermissionStatus status, BuildContext context, ImageSource source) async {

    switch (status){
    
      case PermissionStatus.granted:
          final XFile? imagePath = await _picker.pickImage(source: source);
          if( imagePath != null ){
            BlocProvider.of<ProductBloc>(context).add( OnSelectPathImageProductEvent(imagePath.path) );
          }
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        break;
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
        break;
    }
  }


}