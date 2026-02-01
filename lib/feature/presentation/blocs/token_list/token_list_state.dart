import 'package:crypto_list/feature/domain/entities/token_entity.dart';
import 'package:equatable/equatable.dart';

class TokenListState extends Equatable {
  final bool isLoading;
  final bool isPaginating;
  final List<TokenEntity> tokens;
  final String? error;
  final int page;
  final bool hasMore;

  const TokenListState({
    required this.isLoading,
    required this.isPaginating,
    required this.tokens,
    this.error,
    required this.page,
    required this.hasMore,
  });

  factory TokenListState.initial() {
    return const TokenListState(
      isLoading: false,
      isPaginating: false,
      tokens: [],
      error: null,
      page: 0,
      hasMore: true,
    );
  }

  TokenListState copyWith({
    bool? isLoading,
    bool? isPaginating,
    List<TokenEntity>? tokens,
    String? error,
    int? page,
    bool? hasMore,
  }) {
    return TokenListState(
      isLoading: isLoading ?? this.isLoading,
      isPaginating: isPaginating ?? this.isPaginating,
      tokens: tokens ?? this.tokens,
      error: error ?? this.error,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [isLoading, isPaginating, tokens, error, page, hasMore];
}
