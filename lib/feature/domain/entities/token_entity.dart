import 'dart:ui';

import 'package:crypto_list/core/managers/color_manager.dart';
import 'package:crypto_list/feature/data/models/token_model.dart';

class TokenEntity {
  final String id;
  final String? name;
  final double? price;
  final Color color;

  TokenEntity({
    required this.id,
    this.name,
    this.price,
    required this.color,
  });

  factory TokenEntity.fromModel(TokenModel model) {
    return TokenEntity(
      id: model.id,
      name: model.name,
      price: model.price,
      color: ColorManager.getRandomRGBColor(),
    );
  }
}
