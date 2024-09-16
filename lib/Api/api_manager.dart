import 'package:http/http.dart' as http;

class EndPoints{
   static String Sources='v2/top-headlines/sources';
   static String top_headlines='v2/top-headlines';
}
class ApiManager{
  static String API_Key='de44cc1f9dce471e99c82805754bfdcf';
  static String serverLink='newsapi.org';

  static Future<http.Response>getApi({required Map<String, dynamic> query, required String endPoint})async{
     var url=Uri.https(serverLink,endPoint,query);
     var response= await http.get(url,headers: {"X-Api-Key":API_Key});
     return response;
  }



}