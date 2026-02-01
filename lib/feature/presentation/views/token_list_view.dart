import 'package:crypto_list/feature/presentation/blocs/token_list/token_list_bloc.dart';
import 'package:crypto_list/feature/presentation/blocs/token_list/token_list_state.dart';
import 'package:crypto_list/feature/presentation/widgets/token_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const int paginationIndexTrigger = 5;

class TokenListView extends StatefulWidget {
  const TokenListView({super.key});

  @override
  State<TokenListView> createState() => _TokenListViewState();
}

class _TokenListViewState extends State<TokenListView> {
  @override
  void initState() {
    super.initState();
    context.read<TokenListBloc>().add(TokenListLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenListBloc, TokenListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: null,
          body: SafeArea(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.error != null
                    ? Center(child: Text(state.error!))
                    : CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                if (index == state.tokens.length - paginationIndexTrigger) {
                                  if (state.hasMore && !state.isPaginating) {
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      context.read<TokenListBloc>().add(TokenListLoadEvent());
                                    });
                                  }
                                }

                                return TokenTile(token: state.tokens[index]);
                              },
                              childCount: state.tokens.length,
                            ),
                          ),
                          if (state.isPaginating)
                            const SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(child: CircularProgressIndicator()),
                              ),
                            ),
                        ],
                      ),
          ),
        );
      },
    );
  }
}
