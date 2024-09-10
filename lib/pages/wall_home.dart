import 'package:api_cording/controller/wallpaper_services.dart';
import 'package:api_cording/model/wallpaper.dart';
import 'package:api_cording/pages/wall_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
class WallHome extends StatefulWidget {
  const WallHome({super.key});

  @override
  State<WallHome> createState() => _WallHomeState();
}

class _WallHomeState extends State<WallHome> {
  List<Tab> cats = [
    Tab(
      text: "NATURE",
    ),
    Tab(
      text: "ANIME",
    ),
    Tab(
      text: "SPORTS",
    ),
    Tab(
      text: "CARS",
    ),
    Tab(
      text: "MANGA",
    ),
    Tab(
      text: "HOUSE",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wallpics",style: TextStyle(fontSize: 25,color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            tabs: cats,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.yellow
            ),
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            indicatorWeight: 1,
            dividerColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
          ),
        ),
        backgroundColor: Colors.black,
        body: TabBarView(
          children: cats.map((tab) => customGridView(tab)).toList(),
        )
      ),
    );
  }

  FutureBuilder<List<Wallpaper>> customGridView(Tab tab) {
    return FutureBuilder<List<Wallpaper>>(
      future: WallpaperServices().fatchNature(tab.text!.toLowerCase()),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if (!snapshot.hasData || snapshot.data == null){
          return Center(child: Text("No Data Found"));
        }
        else {
          return MasonryGridView.count(
            crossAxisSpacing: 5,
              mainAxisSpacing: 5,
               itemCount: snapshot.data!.length,
              crossAxisCount: 2,
              itemBuilder: (context,index){
                final photo = snapshot.data![index];
                return InkWell(
                  onTap: (){
                    Get.to(WallDetails(image: photo.image,name: photo.photo,alt: photo.late,));
                  },
                  child: Container(
                    height: (index % 3 + 2)*100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(int.parse(photo.avg.replaceAll("#", "0xff"))),
                      image: DecorationImage(
                          image: NetworkImage("${photo.image}"),fit: BoxFit.cover)
                    ),
                  ),
                );
              }
              );
        }
      },
    );
  }
}
