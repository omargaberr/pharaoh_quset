import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  bool _isUpcoming = true;

  Map<String, Map<String, dynamic>> appointments = {"past": {}, "upcoming": {}};

  @override
  void initState() {
    super.initState();
    _getBookings();
  }

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
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getAppointments(
      Map<String, Map<String, dynamic>> allAppointments) {
    Map<String, dynamic> appointments = _isUpcoming
        ? allAppointments["upcoming"] ?? {}
        : allAppointments["past"] ?? {};
    return appointments.entries.map((e) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        height: _isUpcoming ? 200 : 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          border: Border.all(color: Colors.black, width: 2),
          color: const Color(0xffffffff),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.value["Title"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Tour Language: ${e.value["Language"]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      e.value["imageUrl"],
                      fit: BoxFit.cover,
                    ),
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
                      e.value["Date"],
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
                      e.value["Time"],
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
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("PlacesBookings")
                          .doc(e.key)
                          .update(
                              {"gid": FirebaseAuth.instance.currentUser!.uid});
                    },
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

  Future<void> _getBookings() async {
    Map<String, Map<String, dynamic>> categorizedBookings = {
      'past': {},
      'upcoming': {}
    };

    DateTime now = DateTime.now();

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('PlacesBookings').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      String dateStr = data['Date'] as String;
      String timeStr = data['Time'] as String;

      DateTime bookingDateTime = DateTime.parse("$dateStr $timeStr");

      if (bookingDateTime.isBefore(now)) {
        categorizedBookings['past']![doc.id] = data;
      } else {
        categorizedBookings['upcoming']![doc.id] = data;
      }
    }

    setState(() {
      appointments = categorizedBookings;
    });
  }
}
