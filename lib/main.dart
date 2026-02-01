import 'package:crypto_list/feature/data/crypto/crypto_remote_data_source.dart';
import 'package:crypto_list/feature/presentation/blocs/token_list/token_list_bloc.dart';
import 'package:crypto_list/feature/presentation/views/token_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto List',
      showSemanticsDebugger: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => TokenListBloc(CryptoRemoteDataSource()),
        child: const TokenListView(),
      ),
    );
  }
}
