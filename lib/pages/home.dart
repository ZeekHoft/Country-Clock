import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? routeData = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    //we're updating the data, now when build is rerun, the general values from loading is being loaded back
    //so now we're checking if the data above is not empty and if it is the generic values that was first set will be displayed
    //if not the new values will be displayed

    if (routeData != null) {
      data = routeData;
      print(data);
    }
    String BG = data['Daytime'] != null && data['Daytime'] == true
        ? 'day1.png'
        : 'night1.png';

    Color BGcolor = data["Daytime"] != null && data["Daytime"] == true
        ? const Color.fromARGB(255, 255, 255, 255)
        : Colors
            .black; // this is just changin the color of the background for the phone section that is
    //above the SafeArea

    return Scaffold(
        backgroundColor: BGcolor,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/$BG"),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result_from_places =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        "time": result_from_places["time"],
                        "location": result_from_places["location"],
                        "Daytime": result_from_places["Daytime"],
                        "flag": result_from_places[
                            "flag"] //we're overiding the data above called data{}, from just having simple values it now has realtime
                        //mutable values with the location and time
                      };
                    });
                  },
                  label: const Text(
                    "Navigation Button",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'] != null
                        ? 'Location: ${data['location']}'
                        : 'Loading...',
                    style: const TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.white),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.white),
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'] != null ? '${data['time']}' : 'Loading...',
                style: const TextStyle(
                    fontSize: 60.0,
                    letterSpacing: 2.0,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                          // bottomLeft
                          offset: Offset(-1.5, -1.5),
                          color: Colors.white),
                      Shadow(
                          // bottomRight
                          offset: Offset(1.5, -1.5),
                          color: Colors.white),
                      Shadow(
                          // topRight
                          offset: Offset(1.5, 1.5),
                          color: Colors.white),
                      Shadow(
                          // topLeft
                          offset: Offset(-1.5, 1.5),
                          color: Colors.white),
                    ]),
              ),
            ],
          )),
        ));
  }
}
