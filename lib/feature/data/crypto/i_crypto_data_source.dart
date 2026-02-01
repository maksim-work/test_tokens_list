import 'package:crypto_list/feature/data/models/token_model.dart';

abstract class ICryptoDataSource {
  Future<List<TokenModel>> getTokensList({int page = 0, int limit = 10});
}
