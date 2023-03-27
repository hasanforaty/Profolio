import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentLocalBloc extends Cubit<SupportedLocal> {
  CurrentLocalBloc() : super(SupportedLocal.fa);
  void changeLocal(SupportedLocal local) => emit(local);
}

enum SupportedLocal {
  en,
  fa;
}
