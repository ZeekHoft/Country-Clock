import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String Location; //locations
  late String time; //time of the locations
  late String flag; // assets of the flag
  late String url;
  late bool Daytime; //true or false for day time or night time

  WorldTime(
      {required this.Location,
      required this.flag,
      required this.url,
      required String location});

  Future<void> getTime() async {
    // we're wrapping the void function in a future, which means it will let the async run first
    // then return the value once async is finished

    //make req for timezones
    try {
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      if (response.statusCode == 200) ;
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from the data
      String datetime = data['datetime'];
      String utcoffset = data['utc_offset']
          .substring(1, 3); //this coverts the string from +01 to 01
      //print("Date and Time: $datetime");
      //print("Offset: $utcoffset");

      //create a datetime object to add the offset with the datetime

      DateTime DT = DateTime.parse(datetime);
      DT = DT.add(Duration(
          hours: int.parse(
              utcoffset))); // adding 01 as an int to the new DT (DateTime)

      Daytime = DT.hour > 6 && DT.hour < 20 ? true : false;

      time = DateFormat.jm().format(DT); // formatting time using intl library
    } catch (e) {
      print("Error detected");
      time = "FIX ME ";
    }
  }
}
