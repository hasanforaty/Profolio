import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profolio/module/project_model.dart';

class ProjectFilterBloc extends Cubit<ProjectType?> {
  ProjectFilterBloc() : super(null);
  void change(ProjectType? type) => emit(type);
}
