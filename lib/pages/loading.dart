import 'package:flutter/material.dart';
import 'package:world_clock/services/worldtime_logic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // since theres no more getTime function we're making an instance for the class
  // thats gonna refernce the getTime

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        Location: "Asia", flag: "Jakarta", url: "Asia/Jakarta", location: '');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.Location,
      "flag": instance.flag,
      "time": instance.time,
      "Daytime": instance.Daytime,
    }); //Loading takes the value of time, so we'll need to display that in the home UI with this line of code
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print("LOADINGGGGG!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: SpinKitCubeGrid(
          color: Colors.pink,
          size: 40.0,
        )));
  }
}
