import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/model/model.dart';
import 'package:http/http.dart' as http;


class HomeController{

   var url = dotenv.env['baseUrl'];
  Future getCategory() async{
   Uri url = Uri.parse("${dotenv.env['baseUrl']}/categories/");
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   Login user = loginFromJson(prefs.getString('isLogin')!);
   String token = "Bearer ${user.token}";
   var response = await http.get(url, headers: {"Authorization": token, "Content-Type": "application/json"});
   if (response.statusCode == 200) {
     List<Categories> data = categoriesFromJson(response.body);
     return data;
   } else {
     return null;
   }
    }

  Future getWisata () async {
   Uri url = Uri.parse("${dotenv.env['baseUrl']}/wisata/");
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   Login user = loginFromJson(prefs.getString('isLogin')!);
   String token = "Bearer ${user.token}";
   var response = await http.get(url, headers: {"Authorization": token, "Content-Type": "application/json"});
   if (response.statusCode == 200) {
     DataWisata data = dataWisataFromJson(response.body);
     List<DetailWisata> favorit = data.data;
     favorit = favorit.where((x) => x.isFav == 1).toList();
     return [{
      "favorit": favorit,
      "populer": data.data
     }];
   } else {
     return null;
   }
  }

}