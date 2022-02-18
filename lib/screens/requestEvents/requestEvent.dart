import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_client/configs/assets.dart';
import 'package:flutter/material.dart';

class RequestEventForm extends StatefulWidget {
  @override
  _RequestEventFormState createState() => _RequestEventFormState();
}

class _RequestEventFormState extends State<RequestEventForm> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController eventEditingController = TextEditingController();
  TextEditingController guestnameEditingController = TextEditingController();
  TextEditingController guestLinkEditingController = TextEditingController();

  addToFirestore() async {
    Map<String, dynamic> eventData = {
      "Person's name": nameEditingController.text,
      "Event name": eventEditingController.text,
      "Guest name": guestnameEditingController.text,
      "Guest url": guestLinkEditingController.text,
    };

    FirebaseFirestore.instance
        .collection("Event Requests")
        .add(eventData)
        .catchError((e) {
      print("Error encountered while uploading data : $e");
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Container(
          height: 80,
          child: Image.asset(Assets.vitb_dsc_logo),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: nameEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your Name"),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: eventEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "On What Topic do you need an event??"),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: guestnameEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Any particular guest you want to call?"),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: guestLinkEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter url to guest's public profile"),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          addToFirestore();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 36,
                          // Constructor Call #2
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
