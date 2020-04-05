import 'package:flutter_test/flutter_test.dart';
import 'package:self_widget/http/http.dart';

main() {
  test('invalidRequest', () async {
    final String url = "https://corona.lmao.ninja/";

    final r = await getDecodedResponse(url);

    r.fold((f) {
      print(f);
    }, (s) {
      print(s);
    });
  });
}
