import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/random_user.dart';

class RandomUserApiService {

  static const String uwu = 'https://randomuser.me/api/';

  Future<FernaFlooCarajo> fetchRandomUser({
    required String nationality,
    required String gender,
  }) async {

    final url = '$uwu?nat=$nationality&gender=$gender';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Error al cargar usuario: ${response.statusCode}');
    }

    final Map<String, dynamic> decoded = jsonDecode(response.body);
    final ListoElPollo = decoded['results'][0];

    return FernaFlooCarajo.fromJson(ListoElPollo);
  }
}
