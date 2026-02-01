import 'package:crypto_list/feature/data/crypto/i_crypto_data_source.dart';
import 'package:crypto_list/feature/data/models/token_model.dart';
import 'package:dio/dio.dart';

const String _authToken = 'ef02bfb7ff5dd118d3f57409651d294e1e7f05bd5e75c3947a608f937c743f28';
const String _baseUrl = 'https://rest.coincap.io/v3';

class CryptoRemoteDataSource implements ICryptoDataSource {
  final Dio _dio = Dio();

  @override
  Future<List<TokenModel>> getTokensList({int page = 0, int limit = 10}) async {
    final Response response = await _dio.get(
      '$_baseUrl/assets?limit=$limit&offset=${page * limit}',
      options: Options(
        headers: {'Authorization': 'Bearer $_authToken'},
      ),
    );
    return (response.data['data'] as List<dynamic>)
        .map((json) => TokenModel.fromJson(json))
        .whereType<TokenModel>()
        .toList();
  }
}
