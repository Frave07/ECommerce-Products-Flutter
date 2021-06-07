import 'package:form_field_validator/form_field_validator.dart';


final validatedEmail = MultiValidator([
    RequiredValidator(errorText: 'Email ID is required'),
    EmailValidator(errorText: 'Enter a valid Email ID')
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be to least 8 digits long')
  ]);

  final passwordRepeatValidator = MultiValidator([
    RequiredValidator(errorText: 'Repeat Password is required'),
  ]);
