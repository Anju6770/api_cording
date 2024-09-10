import 'dart:convert';
import 'package:api_cording/model/wallpaper.dart';
import 'package:http/http.dart' as http;
class WallpaperServices{
  final _base ='https://api.pexels.com/v1/';
  final _key = 'kC7CdNqKcDmTovbUTCR6ktgbkDwbuCSEw7DTSNBJkB9abdK9kwfRbaTS';

 Future<List<Wallpaper>> fatchNature(String cats) async {
    try{
      final image = "${_base}search?query=${cats}&per_page=20";
      final response = await http.get(Uri.parse(image),headers: {'Authorization':_key});
      final allData = jsonDecode(response.body);
      final List data = allData['photos'];
      return data.map((photo) => Wallpaper.forMap(photo)).toList();
    }catch(r){
    print(r);
    return [];
    }
  }
}