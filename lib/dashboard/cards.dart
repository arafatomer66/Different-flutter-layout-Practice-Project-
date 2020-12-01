import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:http/http.dart' as http;

import 'Models/overviewModels.dart';

class Cards extends StatelessWidget {
  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<OverViewModel>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.data.tasks);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                taskWidget(Color.fromRGBO(253, 42, 42, 1), "Overdue", "9:00 AM",
                    0, true, true, false, false),
                taskWidget(Color.fromRGBO(253, 148, 42, 1), "Today", "9:00 AM",
                    11, false, false, false, false),
                taskWidget(Color.fromRGBO(253, 211, 42, 1), "Tomorrow",
                    "9:00 AM", 2, false, true, false, true),
                taskWidget(Color.fromRGBO(255, 255, 255, 1), "Later", "9:00 AM",
                    19, false, false, false, true),
                taskWidget(Color.fromRGBO(253, 42, 42, 1), "Completed",
                    "9:00 AM", 0, false, true, false, false),
                taskWidget(Color.fromRGBO(235, 245, 250, 1), "No Date",
                    "9:00 AM", 4, true, false, false, false),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: TextStyle(color: Colors.white),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  taskWidget(Color color, String title, String time, int countTask, chat,
      subtask, reminder, attachment) {
    bool ifChat = chat;
    bool ifSubtask = subtask;
    bool ifReminder = reminder;
    bool ifAttachment = attachment;

    Container emptyContainer = Container(
      height: 0,
      width: 0,
    );

    ImageIcon notificationIcon(image) {
      return ImageIcon(
        AssetImage(image),
        color: Color.fromRGBO(253, 211, 42, 1),
      );
    }

    return Expanded(
      child: Container(
        height: 81,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(
              29,
              39,
              52,
              1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                offset: Offset(0, 9),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 52, 1),
                      shape: BoxShape.circle,
                      border: Border.all(color: color, width: 5)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ifChat
                      ? notificationIcon("assets/icon/notification/Chat.png")
                      : emptyContainer,
                  ifReminder
                      ? notificationIcon(
                          "assets/icon/notification/reminder.png")
                      : emptyContainer,
                  ifSubtask
                      ? notificationIcon("assets/icon/notification/Subtask.png")
                      : emptyContainer,
                  ifAttachment
                      ? notificationIcon(
                          "assets/icon/notification/Attachment.png")
                      : emptyContainer,
                ],
              )),
            ),
            FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                child: Container(
                  width: 75,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(34, 46, 62, 1),
                    child: Center(
                      child: Text(
                        "$countTask",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              back: Container(
                child: Container(
                  width: 75,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(253, 211, 42, 1),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: Color.fromRGBO(34, 46, 62, 1)),
                      ),
                    ),
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

Future<OverViewModel> getData() async {
  final url = 'http://192.168.1.98:8000/api/v1/tasks/timestat/my';
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonOverview = jsonDecode(response.body);
    return OverViewModel.fromJson(jsonOverview);
  } else {
    print('not ok ');
  }
}
