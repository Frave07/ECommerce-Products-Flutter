part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class OnSelectUidCategoryEvent extends CategoryEvent {
  final int uidCategory;
  final String category;

  OnSelectUidCategoryEvent(this.uidCategory, this.category);
} 


