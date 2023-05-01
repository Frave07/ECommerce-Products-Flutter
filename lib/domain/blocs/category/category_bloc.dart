import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc() : super(CategoryInitial()) {
    on<OnSelectUidCategoryEvent>(_selectUidCategory);
  }


  Future<void> _selectUidCategory( OnSelectUidCategoryEvent event, Emitter<CategoryState> emit ) async {

    emit( SetSelectCategoryState(event.uidCategory, event.category) );

  }
}
