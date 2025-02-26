import 'dart:convert';
import 'package:http/http.dart' as http;
import 'image_model_class.dart';

class ApiService {
  Future<ImageModel?> getImageFromApi(String prompt) async {
    final url = Uri.parse(
        'https://openapi.naver.com/v1/search/image?query=${prompt}&display=4');

    final Map<String, String> headers = {
      'X-Naver-Client-Id': '21mzA1WQkPGCnzpEPj6Z',
      'X-Naver-Client-Secret': 'vaxbh7ijjv',
    };

    final response = await http.get(url, headers: headers);
    // 그냥 통째로 꺼냄 use-case에서 리스트만 뽑아가자
    // TODO: 주석 보강
    if (response.statusCode == 200) {
      final resJsonDecode = jsonDecode(response.body);
      return ImageModel.fromJson(resJsonDecode);

    } else {
      return null;
    }
    // 에러를 던질거면 에러를 정의하고, 에러가 필요한지부터 확인.
  }
}


// 데이터 레이어에서는 에러를 따로 정의 해야함. 
// 그리고 presentation layer에서 그 에러코드를 -> UI에서 보여줄 메세지로 매핑을 해야함.

//이해 시작
//서비스에서는 getImageFromApi메서드 존재
// 그 안에 url , 헤더 존재.
// 서비스에서는 ImageModel에 담아서 빼감
// ImageModel