class Wallpaper{
  String image;
  String photo;
  String avg;

  Wallpaper({
    required this.image,
    required this.photo,
    required this.avg
});

 factory Wallpaper.forMap(Map<String,dynamic>map){
   return Wallpaper(
       image: map['src']['portrait'],
       photo: map['photographer'],
     avg: map['avg_color']
   );
 }
}