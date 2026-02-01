import 'package:bloc/bloc.dart';
import 'package:crypto_list/feature/data/crypto/i_crypto_data_source.dart';
import 'package:crypto_list/feature/domain/entities/token_entity.dart';
import 'package:crypto_list/feature/presentation/blocs/token_list/token_list_state.dart';

const int _pageLimit = 30;

abstract class TokenListEvent {
  const TokenListEvent();
}

class TokenListLoadEvent extends TokenListEvent {
  const TokenListLoadEvent();
}

class TokenListBloc extends Bloc<TokenListEvent, TokenListState> {
  final ICryptoDataSource _cryptoDataSource;
  TokenListBloc(this._cryptoDataSource) : super(TokenListState.initial()) {
    on<TokenListLoadEvent>((event, emit) async {
      await _onTokenListLoadEvent(event, emit);
    });
  }

  Future<void> _onTokenListLoadEvent(TokenListLoadEvent event, Emitter<TokenListState> emit) async {
    if (state.isLoading || state.isPaginating) return;

    final isFirstLoad = state.tokens.isEmpty;
    emit(state.copyWith(
      isLoading: isFirstLoad,
      isPaginating: !isFirstLoad,
    ));

    try {
      final tokens = await _cryptoDataSource.getTokensList(page: state.page, limit: _pageLimit);
      final newTokens = tokens.map((token) => TokenEntity.fromModel(token)).toList();
      emit(
        state.copyWith(
          tokens: [...state.tokens, ...newTokens],
          page: state.page + 1,
          hasMore: tokens.length == _pageLimit,
          isLoading: false,
          isPaginating: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
        isPaginating: false,
      ));
    }
  }
}
