import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/Cubit/app_states.dart';

class FoodCubit extends Cubit<FoodStates> {
  FoodCubit() : super(InitialState());
  static FoodCubit get(context) => BlocProvider.of(context);

  var currTopPage = 0;
  void changeTopPage(int index) {
    currTopPage = index;
    emit(ChangeTopPageState());
  }

  int currTitle = 0;
  void changeTitle(int index) {
    currTitle = index;
    emit(ChangeTitleState());
  }
}
