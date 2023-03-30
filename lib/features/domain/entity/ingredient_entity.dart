import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  IngredientEntity({
    this.title,
    this.useBy,
  });

  final String? title;
  final DateTime? useBy;

  @override
  // TODO: implement props
  List<Object?> get props => [title, useBy];
}