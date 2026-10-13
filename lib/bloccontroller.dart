
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitContro extends Cubit <int>{
  CubitContro() : super(0);

  void increement(){
    emit(state+1);
  }

  void decreement(){
    emit(state-1);
  }


}