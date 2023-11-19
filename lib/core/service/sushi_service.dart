import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sushi_app/core/constants/environments.dart';
import 'package:sushi_app/core/models/sushi_model.dart';

class SushiService {
  Future<List<Sushi>> sushiData() async {
    var url = Uri.parse('${sushiBaseUri}sushi');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return sushiFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final sushiServerProvider = Provider<SushiService>((ref) => SushiService());

final sushiDataProvider = FutureProvider<List<Sushi>>((ref) {
  return ref.watch(sushiServerProvider).sushiData();
});
