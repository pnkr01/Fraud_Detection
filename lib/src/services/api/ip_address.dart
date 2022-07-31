import 'package:http/http.dart' as https;

class IPInfo {
  static Future<String?> getIpAddress() async {
    try {
      final url = Uri.parse('https://api.ipify.org');
      final reponse = await https.get(url);
      return reponse.statusCode == 200 ? reponse.body : null;
    } catch (e) {
      return null ;
    }
  }
}
