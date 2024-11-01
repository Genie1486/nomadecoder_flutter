import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  // 우리가 getTodaysToons라는 함수를 실행할 때
  // Dart가 바로 코드를 처리하지 않고
  // API 요청이 처리돼서 응답을 반환할 때까지 기다리게 하고 싶다.
  // 이것을 async(비동기) programming이라고 한다.
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    // Dart가 결과를 기다리게 하고 싶을 때 await 키워드를 사용
    // await 키워드는 async 함수에서만 사용가능

    // Future<타입>은 현재가 아닌 미래에 받을 결과 값의 타입을 알려준다.
    // 따라서 http.get() 메서드는 Response 타입을 반환함을 알 수 있다.
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // jsonDecode는 String을 JSON으로 바꿔주는 함수
      // response.body는 String 이다.
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        // final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body); // String을 json으로
      return WebtoonDetailModel.fromJson(webtoon); // json을 WebtoonDetailModel로
    }

    throw Error();
  }
}
