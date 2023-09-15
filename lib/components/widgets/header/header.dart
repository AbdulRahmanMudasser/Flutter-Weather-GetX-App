import 'package:flutter/material.dart';
import 'package:flutter_weather_getx_app/components/widgets/header/today_date.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/global_controller.dart';
import 'locality.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  String locality = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  void initState() {
    super.initState();

    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
  }

  Future getAddress(latitude, longitude) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);

    setState(() {
      locality = placeMarks[0].locality!;
    });

    debugPrint(placeMarks[0].locality);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // locality
        Locality(locality: locality),

        // date
        TodayDate(date: date),
      ],
    );
  }
}




