part of 'category_bloc.dart';

@immutable
abstract class CategoryState {
  
  final int? uidCategory;
  final String? nameCategory;

  CategoryState({
    this.uidCategory,
    this.nameCategory
  });
}

class CategoryInitial extends CategoryState {}

class SetSelectCategoryState extends CategoryState {
  final uid;
  final category;

  SetSelectCategoryState(this.uid, this.category):super(uidCategory: uid, nameCategory: category);
}
