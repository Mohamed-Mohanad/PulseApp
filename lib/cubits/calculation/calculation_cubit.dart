import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculation_states.dart';

class CalculationCubit extends Cubit<CalculationStates> {
  CalculationCubit() : super(CalculationInitialState());

  static CalculationCubit get(context) => BlocProvider.of(context);
}
