import 'package:date_format/date_format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class DateScreen extends ConsumerStatefulWidget {
  const DateScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends ConsumerState<DateScreen> {
  String? selectedDate = "";

  @override
  Widget build(BuildContext context) {
    Future<String> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2003, 1),
        lastDate: DateTime.now(),
      );
      return formatDate(picked!, [yyyy, '-', mm, '-', dd]);
    }

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric( vertical: 15.0),
              child: Text("Date Selected"),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff4D4D4D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {
                  selectDate(context).then((value) {
                    selectedDate = value;
                    setState(() {});
                  });
                },
                leading: const Icon(Icons.date_range),
                title: Text(selectedDate!),
                trailing: const Text(
                  "Select Date",
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
