import 'dart:convert';
import 'package:api_cording/model/wallpaper.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class WallpaperServices{
  final _base ='https://api.pexels.com/v1/';
  final _key = 'kC7CdNqKcDmTovbUTCR6ktgbkDwbuCSEw7DTSNBJkB9abdK9kwfRbaTS';

 Future<List<Wallpaper>> fatchNature(String cats) async {
    try{
      final image = "${_base}search?query=${cats}&per_page=200";
      final response = await http.get(Uri.parse(image),headers: {'Authorization':_key});
      final allData = jsonDecode(response.body);
      final List data = allData['photos'];
      return data.map((photo) => Wallpaper.forMap(photo)).toList();
    }catch(r){
    print(r);
    return [];
    }
  }

  Future<void> open(String image) async {
   final Uri _url = Uri.parse(image);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
class SearchService {
  Future<List<Wallpaper>> fetchWallpapersByQuery(String query) async {
    return await WallpaperServices().fatchNature(query);
  }}