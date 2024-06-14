import 'package:flutter/material.dart';
import 'package:world_clock/services/worldtime_logic.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London', Location: 'London', flag: 'uk.png', location: ''),
    WorldTime(
        url: 'Europe/Berlin',
        Location: 'Athens',
        flag: 'greece.png',
        location: ''),
    WorldTime(
        url: 'Africa/Cairo',
        Location: 'Cairo',
        flag: 'egypt.png',
        location: ''),
    WorldTime(
        url: 'Africa/Nairobi',
        Location: 'Nairobi',
        flag: 'kenya.png',
        location: ''),
    WorldTime(
        url: 'America/Chicago',
        Location: 'Chicago',
        flag: 'usa.png',
        location: ''),
    WorldTime(
        url: 'America/New_York',
        Location: 'New York',
        flag: 'usa.png',
        location: ''),
    WorldTime(
        url: 'Asia/Seoul',
        Location: 'Seoul',
        flag: 'south_korea.png',
        location: ''),
    WorldTime(
        url: 'Asia/Jakarta',
        Location: 'Jakarta',
        flag: 'indonesia.png',
        location: ''),
    WorldTime(
        url: 'Asia/Manila',
        Location: 'Manila',
        flag: 'Philippines.png',
        location: ''),
  ];

  void updateTime(index) async {
    WorldTime getPlaces = locations[index];
    await getPlaces.getTime();
    // navigate back to home
    Navigator.pop(context, {
      "location": getPlaces.Location,
      "flag": getPlaces.flag,
      "time": getPlaces.time,
      "Daytime": getPlaces.Daytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 105, 0, 53),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 197, 142, 91),
        title: Text("Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index); // getting the index of the place
                    //print(locations[index].Location);
                  },
                  title: Text(locations[index].Location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class Index {}
