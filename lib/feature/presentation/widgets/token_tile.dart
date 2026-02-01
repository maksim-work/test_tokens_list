import 'package:crypto_list/feature/domain/entities/token_entity.dart';
import 'package:flutter/material.dart';

const double _tokenLogoSize = 56.0;
const double _logoBorderRadius = 18.0;

const double _tokenVerticalPadding = 14.0;
const double _tokenHorizontalPadding = 20.0;
const double _defaultPadding = 16.0;

const TextStyle _fontStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'SF Pro Text',
);

class TokenTile extends StatelessWidget {
  final TokenEntity token;
  const TokenTile({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _tokenHorizontalPadding, vertical: _tokenVerticalPadding),
      child: Row(
        children: [
          Container(
            width: _tokenLogoSize,
            height: _tokenLogoSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_logoBorderRadius),
              color: token.color,
            ),
          ),
          SizedBox(width: _defaultPadding),
          Expanded(child: Text(token.name ?? '', style: _fontStyle)),
          SizedBox(width: _defaultPadding),
          Text('\$${token.price?.toStringAsFixed(2) ?? '--'}', style: _fontStyle),
        ],
      ),
    );
  }
}
