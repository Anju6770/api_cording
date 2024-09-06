import 'package:api_cording/controller/user.dart';
import 'package:api_cording/goggle.dart';
import 'package:api_cording/model/people_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class PeopleHome extends StatefulWidget {
  const PeopleHome({super.key});

  @override
  State<PeopleHome> createState() => _PeopleHomeState();
}

class _PeopleHomeState extends State<PeopleHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Person Details",style: TextStyle(fontSize: 25,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<PeopleModel?>(
        future: UserServices().fetchPeopleData(20),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            return  GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context,index){
                final person = snapshot.data!.results![index];
                final location = person.location;
                final locationDetails =
                    '${location?.city}, ${location?.state}, ${location?.country}';
                return Card(
                  elevation: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.blue
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height*0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(person.picture?.thumbnail??''),fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${person.name?.first} ${person.name?.last}',style: myStyle(18,Colors.black,FontWeight.bold),),
                              Text(person.email ?? ''),
                              Text(locationDetails),
                              Gap(5),
                              Row(
                                children: [
                                  Icon(Icons.call_sharp,color: Colors.green,size: 23,),
                                  Gap(10),
                                  Text("${person.phone ??''}"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}