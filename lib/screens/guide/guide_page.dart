import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  bool _isUpcoming = false;

  Map<String, dynamic> appointments = {
    "past": {
      "1": {
        "name": "Omar Gaber",
        "detail": "Giza Pyramids",
        "language": "English",
        "time": "09:30 AM",
        "date": "Thursday, 12/22/2022"
      },
      "2": {
        "name": "Omar Gaber",
        "detail": "Giza Pyramids",
        "language": "French",
        "time": "09:30 AM",
        "date": "Thursday, 12/22/2022"
      },
      "3": {
        "name": "Omar Gaber",
        "detail": "Giza Pyramids",
        "language": "English",
        "time": "09:30 AM",
        "date": "Thursday, 12/22/2022"
      },
      "4": {
        "name": "Omar Gaber",
        "detail": "Giza Pyramids",
        "language": "English",
        "time": "09:30 AM",
        "date": "Thursday, 12/22/2022"
      }
    },
    "upcoming": {
      "1": {
        "name": "Omar Gaber",
        "detail": "Giza Pyramids",
        "language": "English",
        "time": "09:30 AM",
        "date": "Thursday, 12/22/2022"
      }
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Appointment Schedule",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      _isUpcoming = true;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: _isUpcoming ? Colors.black : Colors.transparent,
                      ),
                      child: Text(
                        "upcoming",
                        style: TextStyle(
                          color: _isUpcoming ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      _isUpcoming = false;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        color: !_isUpcoming ? Colors.black : Colors.transparent,
                      ),
                      child: Text(
                        "past",
                        style: TextStyle(
                            color: !_isUpcoming ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [...getAppointments(appointments)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getAppointments(Map<String, dynamic> allAppointments) {
    Map<String, dynamic> appointments =
        _isUpcoming ? allAppointments["upcoming"] : allAppointments["past"];
    return appointments.entries.map((e) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          border: Border.all(color: Colors.black, width: 2),
          color: const Color(0xffffffff),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.value["name"],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  e.value["detail"],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  e.value[
                      "language"], 
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      e.value["date"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      e.value["time"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
            if (_isUpcoming)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Text(
                        "Decline",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(color: Colors.green),
                      ),
                      child: const Text(
                        "Accept",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      );
    }).toList();
  }
}
